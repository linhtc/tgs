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
class Modules extends MY_Controller {
	
	function __construct() {
        parent::__construct();
        $this->class = strtolower(get_class());
        $this->numRows = 10;
        $this->moduleModel = 'cnc_modules';
        $this->permissionModel = 'cnc_permissions';
    }
	
    /**
     * View
     */
    public function view() {
		$permission = null;//$this->check_permission($this->class, 'view');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');

        $listCss = array(
            'static/default/template/datepicker/css/bootstrap-datetimepicker.min.css',
            'static/admin/template/plugins/datatables/media/css/dataTables.bootstrap.min.css',
            'static/admin/template/plugins/datatables/extensions/buttons/css/buttons.dataTables.min.css',

            'static/admin/template/plugins/toastr/toastr.min.css',
            'static/admin/template/plugins/bootstrap-select/bootstrap-select.min.css',

            'static/admin/template/css/opt.min.css',
        );
        $listJs = array(
            'static/default/template/mask/jquery.mask.js',
            'static/default/template/datepicker/js/moment.js',
            'static/default/template/datepicker/js/moment-with-locales.js',
            'static/default/template/datepicker/js/bootstrap-datetimepicker.min.js',

            'static/admin/template/plugins/bootpag/jquery.bootpag.min.js',
            'static/admin/template/plugins/toastr/toastr.min.js',
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

            'static/admin/template/js/opt.min.js',
        );

        $permissionList = $this->db->select('permission_key key, permission_name name')
            ->from($this->permissionModel)
            ->where('deleted', 0)
            ->order_by('permission_name', 'asc')
            ->get()
            ->result()
        ;
        $this->load->helper('mobiistar');
        $fileList = scandir(APPPATH.'controllers/admin/');
        $moduleList = array();
        foreach($fileList as $file){
            $ext = pathinfo($file, PATHINFO_EXTENSION);
            if($ext === 'php'){
                file_get_php_classes(APPPATH.'controllers/admin/'.$file, $moduleList);
            }
        }

        $function = '';
        foreach($permissionList as $item){
            $function.= '<option value="'.$item->key.'">'.$item->name.'</option>';
        }
//print_r($moduleList); exit;
        $module = '';
        foreach($moduleList as $item=>$dontcare){
            $module.= '<option value="'.$item.'">'.$item.'</option>';
        }

        $data = array(
            'function' => $function,
            'module' => $module,
            'moduleList' => $moduleList,
            'permissionList' => $permissionList,
            'permission' => $permission,
            'listJs' => add_Js($listJs),
            'listCss' => add_css($listCss),
        );

        $this->parser->parse("admin/modules/view", $data);
    }

    /**
     * Add object
     */
    public function add() {
        $permission = $this->check_permission($this->class, 'add');
        $method = $this->input->method();

        if($method === 'post'){ /*Submit form*/
            $this->layout->disable_layout();
            echo $this->modify(); exit;
        }
        /*--------------------Break--------------------*/

        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');

        $permissions = $this->db->select('permission_key key, permission_name name')
            ->from($this->permissionModel)
            ->where('deleted', 0)
            ->order_by('id', 'asc')
            ->get()
            ->result_array()
        ;
        $permissionList = array();
        foreach($permissions as $item){
            $permissionList[$item['key']] = $item['name'];
        }
        $this->load->helper('mobiistar');
        $fileList = scandir(APPPATH.'controllers/admin/');
        $moduleList = array();
        foreach($fileList as $file){
            $ext = pathinfo($file, PATHINFO_EXTENSION);
            if($ext === 'php'){
                file_get_php_classes(APPPATH.'controllers/admin/'.$file, $moduleList);
            }
        }

        $listCss = array(
            'static/admin/template/plugins/toastr/toastr.min.css',
            'static/admin/template/plugins/bootstrap-select/bootstrap-select.min.css',
        );
        $listJs = array(
            'static/admin/template/plugins/jstree/jstree.min.js',
            'static/admin/template/plugins/toastr/toastr.min.js',
            'static/admin/template/plugins/blockui/jquery.blockUI.js',
            'static/admin/template/plugins/bootstrap-select/bootstrap-select.min.js',
        );
        $data = array(
            'permission' => $permission,
            'moduleList' => $moduleList,
            'permissionList' => $permissionList,
            'listJs' => add_Js($listJs),
            'listCss' => add_css($listCss),
        );
        $this->parser->parse("admin/modules/add", $data);
    }

    /**
     * Edit object
     */
    public function edit($id='') {
        $permission = $this->check_permission($this->class, 'edit');
        $method = $this->input->method();

        if($method === 'post'){ /*Submit form*/
            $this->layout->disable_layout();
            echo $this->modify(); exit;
        }
        /*--------------------Break--------------------*/

        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');


        $objModule = $this->db->select('id, module_key key, functions')
            ->from($this->moduleModel)
            ->where('id', $id)
            ->get()
            ->row()
        ;
        $objMdKey = isset($objModule->key) ? $objModule->key : null;
        $objMdFunc = array();
        if(!empty($objModule->functions)){
            $mdf = json_decode($objModule->functions);
            foreach($mdf as $kf=>$vf){
                array_push($objMdFunc, $kf);
            }
        }
        $permissions = $this->db->select('permission_key key, permission_name name')
            ->from($this->permissionModel)
            ->where('deleted', 0)
            ->order_by('id', 'asc')
            ->get()
            ->result_array()
        ;
        $permissionList = array();
        foreach($permissions as $item){
            $permissionList[$item['key']] = $item['name'];
        }
        $this->load->helper('mobiistar');
        $fileList = scandir(APPPATH.'controllers/admin/');
        $moduleList = array();
        foreach($fileList as $file){
            $ext = pathinfo($file, PATHINFO_EXTENSION);
            if($ext === 'php'){
                file_get_php_classes(APPPATH.'controllers/admin/'.$file, $moduleList);
            }
        }

        $listCss = array(
            'static/admin/template/plugins/toastr/toastr.min.css',
            'static/admin/template/plugins/bootstrap-select/bootstrap-select.min.css',
        );
        $listJs = array(
            'static/admin/template/plugins/jstree/jstree.min.js',
            'static/admin/template/plugins/toastr/toastr.min.js',
            'static/admin/template/plugins/blockui/jquery.blockUI.js',
            'static/admin/template/plugins/bootstrap-select/bootstrap-select.min.js',
        );
        $data = array(
            'permission' => $permission,
            'moduleList' => $moduleList,
            'objMdKey' => $objMdKey,
            'objMdFunc' => $objMdFunc,
            'permissionList' => $permissionList,
            'listJs' => add_Js($listJs),
            'listCss' => add_css($listCss),
        );
        $this->parser->parse("admin/modules/edit", $data);
    }

    /**
     * Delete object
     */
    public function delete() {
        $this->check_permission($this->class, 'delete');
        $this->layout->disable_layout();

        $id = $this->input->post('id', true);
        if(!empty($id)){
            $pullClass = array('deleted' => 1);
            $result = $this->db->where('id', $id)->update($this->moduleModel, $pullClass);
            echo $result; exit;
        }
        echo 0; exit;
    }

    /**
     * Get data with ajax
     */
    public function data() {
        $permission = $this->check_permission($this->class, 'view');
        $this->layout->disable_layout();

        $page = $this->input->post('page', true);
        $sort = $this->input->post('sort', true);
        $type = $this->input->post('type', true);
        $start = ($page-1)*$this->numRows;
        $query = "select `id`, `module_key`, `functions` from ".$this->moduleModel;
        $query .= $this->criteria();
        $num = $this->db->query($query)->num_rows();
//        $query .= " order by `".(empty($sortMaps[$sort]) ? 'id' : $sortMaps[$sort]) ."` ".$type;
        $query .= " limit $start, ".$this->numRows;
//        echo $query; exit;
        $list = $this->db->query($query)->result_array();
        $this->smarty->assign('list', $list);
        $this->smarty->assign('permission', $permission);
        $html = $this->smarty->fetch("admin/modules/data.tpl");
        $response = new stdClass();
        $response->html = $html;
        $response->num = ceil($num/$this->numRows);
        $response->page = $page;
        $response->sort = $sort;
        $response->type = $type;
        echo json_encode($response); exit;
    }

    /**
     * Create criteria string for query
     */
    function criteria(){
        $id = $this->input->post('id', true);
        $slModule = $this->input->post('module', true);
        $slFunction = $this->input->post('function', true);
        $criteria = " where `deleted` = 0 ";
        if(!empty($slModule) && !is_array($slModule)){
            $slModule = explode(',', $slModule);
        }

        if(!empty($id)){
            $criteria .= " AND id = '$id' ";
        }
        if(is_array($slModule) && count($slModule)){
            $mdString = '';
            foreach($slModule as $module){
                $mdString .= ($mdString == "" ? "" : ",")."'$module'";
            }
            $criteria .= " AND module_key IN($mdString) ";
        }
        if(!empty($slFunction)){
            $criteria .= " AND functions like '%".addslashes($slFunction)."%' ";
        }
        return $criteria;
    }

    /**
     * Modify data
     */
    function modify(){
        $slModule = $this->input->post('slModule', true);
        $slFunction = $this->input->post('slFunction', true);
        $permissionList = json_decode($this->input->post('permissionList', true), true);
        if(!empty($slFunction)){
            $functionList = new stdClass();
            foreach($slFunction as $func){
                $functionList->$func = !empty($permissionList[$func]) ? $permissionList[$func] : $func;
            }
            /*$pullClass = array('module_key' => $slModule, 'functions' => json_encode($functionList, JSON_UNESCAPED_UNICODE));
            $result = $this->db->insert($this->moduleModel, $pullClass);*/
            $query = "
                    INSERT INTO `".$this->moduleModel."` (`module_key`, `functions`) VALUES ('".$slModule."', '".addslashes(json_encode($functionList, JSON_UNESCAPED_UNICODE))."')
                    ON DUPLICATE KEY UPDATE `functions` = '".addslashes(json_encode($functionList, JSON_UNESCAPED_UNICODE))."', `deleted` = 0, `id` = id;
                ";
            $result = $this->db->query($query);
            return $result ? $result : 'Thực hiện không thành công!';
        }
        return 'Thực hiện không thành công!';
    }

}
