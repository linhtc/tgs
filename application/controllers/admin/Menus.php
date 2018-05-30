<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * @package Admin
 *
 *
 * @author Leon Tran <leon@agikigi.com>
 * @copyright (c) 2016, 500BITS
 * @link http://agikigi.com
 * @license MIT
 * @version beta.0.1
 */
class Menus extends MY_Controller {
	
	function __construct() {
        parent::__construct();
        $this->class = strtolower(get_class());
        $this->numRows = 10;
        $this->menuModel = 'cnc_menus';
        $this->moduleModel = 'cnc_modules';
        $this->permissionModel = 'cnc_permissions';
    }
	
    /**
     * View
     */
    public function view() {
		$permission = $this->check_permission($this->class, 'view');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');

        $listCss = array(
            'static/admin/template/plugins/toastr/toastr.min.css',
            'static/admin/template/plugins/jstree/style.min.css',
            'static/default/template/datepicker/css/bootstrap-datetimepicker.min.css',
            'static/admin/template/plugins/datatables/media/css/dataTables.bootstrap.min.css',
            'static/admin/template/plugins/datatables/extensions/buttons/css/buttons.dataTables.min.css',
            'static/admin/template/plugins/bootstrap-select/bootstrap-select.min.css',
        );
        $listJs = array(
            'static/admin/template/plugins/toastr/toastr.min.js',
            'static/admin/template/plugins/jstree/jstree.min.js',
            'static/default/template/mask/jquery.mask.js',
            'static/default/template/datepicker/js/moment.js',
            'static/default/template/datepicker/js/moment-with-locales.js',
            'static/default/template/datepicker/js/bootstrap-datetimepicker.min.js',
            'static/admin/template/plugins/bootpag/jquery.bootpag.min.js',
            'static/admin/template/plugins/blockui/jquery.blockUI.js',
            'static/admin/template/plugins/datatables/media/js/jquery.dataTables.min.js',
            'static/admin/template/plugins/datatables/media/js/dataTables.bootstrap.min.js',
            'static/admin/template/plugins/datatables/extensions/responsive/js/dataTables.responsive.min.js',
            'static/admin/template/plugins/datatables/extensions/buttons/js/dataTables.buttons.min.js',
            'static/admin/template/plugins/datatables/extensions/buttons/js/buttons.flash.min.js',
            'static/admin/template/plugins/datatables/extensions/buttons/js/jszip.min.js',
            'static/admin/template/plugins/datatables/extensions/buttons/js/pdfmake.min.js',
            'static/admin/template/plugins/datatables/extensions/buttons/js/vfs_fonts.js',
            'static/admin/template/plugins/datatables/extensions/buttons/js/buttons.html5.min.js',
            'static/admin/template/plugins/datatables/extensions/buttons/js/buttons.print.min.js',
            'static/admin/template/plugins/confirmation/bootstrap-confirmation.min.js',
            'static/admin/template/plugins/bootstrap-select/bootstrap-select.min.js',
        );

        $menuListTmp = $this->db->select('id, if(parent_id = 0, "#", parent_id) parent, menu_name text, module, functions, router, icon')
            ->from($this->menuModel)
            ->where('deleted', 0)
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;
        $menuList = array();
        $menuMap = new stdClass();
        $maxID = 0;
        if(count($menuListTmp)){
            foreach($menuListTmp as $index=>$menu){
                $mapItem = new stdClass();
                $mapItem->id = $menu->id;
                $mapItem->parent = $menu->parent;
                $mapItem->module = $menu->module;
                $mapItem->text = $menu->text;
                $mapItem->router = $menu->router;
                $mapItem->icon = $menu->icon;
                $mapItem->maps = null;
                $maxID = $maxID < $menu->id ? $menu->id : $maxID;
                unset($menu->router);
//                unset($menu->icon);
                $menu->icon = 'glyphicon glyphicon-hdd';
                if(!empty($menu->functions)){
                    $functionList = json_decode($menu->functions);
                    $mapItem->maps = $functionList;
                    $functionArray = array();
                    $functionAddress = new stdClass();
                    if($functionList){
                        if(count((array)$functionList) > 1){
                            foreach($functionList as $funcKey=>$funcName){
                                $elementTree = new stdClass();
                                $elementTree->id = $funcKey.'_X_'.$menu->id;
                                $elementTree->parent = $menu->id;
                                $elementTree->text = $funcName;
                                $elementTree->icon = 'glyphicon glyphicon-flash';

                                array_push($menuList, $elementTree);
                                array_push($functionArray, $funcKey);
                                $functionAddress->$funcKey = count($menuList) - 1;
                            }
                            unset($menu->module);
                            unset($menu->functions);
                            $menu->icon = 'glyphicon glyphicon-pushpin';
                            array_push($menuList, $menu);
                        } else{
                            foreach($functionList as $funcKey=>$funcName){
                                $menu->id = $funcKey.'_X_'.$menu->id;

                                unset($menu->module);
                                unset($menu->functions);
                                $menu->icon = 'glyphicon glyphicon-pushpin';
                                array_push($menuList, $menu);
                                array_push($functionArray, $funcKey);
                                $functionAddress->$funcKey = count($menuList) - 1;
                            }
                        }
                    }
                    $mapItem->functions = $functionArray;
                    $mapItem->address = $functionAddress;
                } else{
                    $mapItem->functions = array();
                    $mapItem->address = null;
                    unset($menu->module);
                    unset($menu->functions);
                    array_push($menuList, $menu);
                }
                $mapItem->index = count($menuList) - 1;
                $menuMap->{$menu->id} = $mapItem;
            }
        }
        $modules = $this->db->select('id, module_key key, functions')
            ->from($this->moduleModel)
            ->where('deleted', 0)
            ->get()
            ->result()
        ;
        $moduleList = array();
        foreach($modules as $module){
            $moduleList[$module->key] = json_decode($module->functions);
        }

//        print_r(json_encode($menuList, JSON_UNESCAPED_UNICODE));
//        echo '<hr />';
//        print_r(json_encode($menuMap, JSON_UNESCAPED_UNICODE));
//        exit;

        $data = array(
            'permission' => $permission,
            'listJs' => add_Js($listJs),
            'listCss' => add_css($listCss),
            'menuList' => json_encode($menuList),
            'moduleList' => $moduleList,
            'maxID' => $maxID,
            'moduleListString' => json_encode($moduleList, JSON_UNESCAPED_UNICODE),
            'menuMapString' => json_encode($menuMap, JSON_UNESCAPED_UNICODE),
        );

        $this->parser->parse("admin/menus/view", $data);
    }

    /**
     * Apply change
     */
    public function apply() {
        $this->check_permission($this->class, 'view');
        $this->layout->disable_layout();

        $mapString = $this->input->post('maps', true);
        $maps = json_decode($mapString);
        if($maps){
            $query = '';
            foreach($maps as $item){
                $item->parent = is_numeric($item->parent) ? $item->parent : 0;
                $functions = !empty($item->maps) ? json_encode($item->maps, JSON_UNESCAPED_UNICODE) : null;
                $query .= ($query != '' ? ',' : '')."('".$item->id."', '".$item->parent."', '".$item->text."', '".$item->module."', '".$item->router."',
                    '".$item->icon."', '".$item->sort."',  '".$item->deleted."', '".addslashes($functions)."'
                )";
            }
            if(!empty($query)){
                $query = "INSERT INTO ".$this->menuModel." (`id`, `parent_id`, `menu_name`, `module`, `router`, `icon`, `sort`, `deleted`, `functions`) VALUES ".$query." 
                    ON DUPLICATE KEY UPDATE `parent_id` = VALUES(parent_id), `menu_name` = VALUES(menu_name), `module` = VALUES(module), `router` = VALUES(router), 
                        `icon` = VALUES(icon), `sort` = VALUES(sort), `deleted` = VALUES(deleted), `functions` = VALUES(functions)
                    ;
                ";
                $res = $this->db->query($query);
                echo $res; exit;
            }
        }
        echo 0; exit;
    }

}
