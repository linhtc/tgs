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
class Permissions extends MY_Controller {
	
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
		$permission = $this->check_permission($this->class, 'view');
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

        $data = array(
            'permission' => $permission,
            'listJs' => add_Js($listJs),
            'listCss' => add_css($listCss),
        );

        $this->parser->parse("admin/permissions/view", $data);
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
            'listJs' => add_Js($listJs),
            'listCss' => add_css($listCss),
        );
        $this->parser->parse("admin/permissions/add", $data);
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


        $objPers = $this->db->select('id, permission_key `key`, permission_name `name`')
            ->from($this->permissionModel)
            ->where('id', $id)
            ->get()
            ->row()
        ;
        $objPKey = isset($objPers->key) ? $objPers->key : null;
        $objPName = isset($objPers->name) ? $objPers->name : null;

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
            'objPKey' => $objPKey,
            'objPName' => $objPName,
            'listJs' => add_Js($listJs),
            'listCss' => add_css($listCss),
        );
        $this->parser->parse("admin/permissions/edit", $data);
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
            $result = $this->db->where('id', $id)->update($this->permissionModel, $pullClass);
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

        $sortMaps = array('id', 'permission_key', 'permission_name');
        $page = $this->input->post('page', true);
        $sort = $this->input->post('sort', true);
        $type = $this->input->post('type', true);
        $start = ($page-1)*$this->numRows;
        $query = "select `id`, `permission_key`, `permission_name` from ".$this->permissionModel;
        $query .= $this->criteria();
        $num = $this->db->query($query)->num_rows();
        $query .= " order by `".(empty($sortMaps[$sort]) ? 'id' : $sortMaps[$sort]) ."` ".$type;
        $query .= " limit $start, ".$this->numRows;
        $list = $this->db->query($query)->result_array();
        $this->smarty->assign('list', $list);
        $this->smarty->assign('permission', $permission);
        $html = $this->smarty->fetch("admin/permissions/data.tpl");
        $response = new stdClass();
        $response->html = $html;
        $response->num = ceil($num/$this->numRows);
        $response->total = number_format($num, 0, ",", ".");
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
        $key = $this->input->post('key', true);
        $name = $this->input->post('name', true);

        $criteria = " where `deleted` = 0 ";
        if(!empty($id)){
            $criteria .= " AND id = '".addslashes($id)."' ";
        }
        if(!empty($key)){
            $criteria .= " AND permission_key like '%".addslashes($key)."%' ";
        }
        if(!empty($name)){
            $criteria .= " AND permission_name like '%".addslashes($name)."%' ";
        }
        return $criteria;
    }

    /**
     * Modify data
     */
    function modify(){
        $key = $this->input->post('permission_key', true);
        $name = $this->input->post('permission_name', true);
        if(!empty($key)){
            $query = "
                INSERT INTO `".$this->permissionModel."` (`permission_key`, `permission_name`) VALUES ('".$key."', '".addslashes($name)."')
                ON DUPLICATE KEY UPDATE `permission_name` = '".addslashes($name)."', `deleted` = 0;
            ";
            $result = $this->db->query($query);
            return $result ? $result : 'Thực hiện không thành công!';
        }
        return 'Thực hiện không thành công!';
    }

    /**
     * Export data
     */
    public function export() {
        $this->check_permission($this->class, 'view');
        $this->layout->disable_layout();

        $cnfReports = $this->session->userdata('user_cnf_reports');
        $qc = '';
        $cnfs = array();
        $header = array();
        $filename = date("Y-m-d");
        if(!empty($cnfReports[$this->class])){
            $cnfs = $cnfReports[$this->class];
            foreach($cnfs as $clm=>$cnf){
                $qc .= ($qc == '' ? '' : ',')."`$clm`";
                $header[$clm] = isset($cnf['label']) ? $cnf['label'] : $clm;
            }
        }
        if(empty($qc)){
            $header = array(
                'phone' => 'SDT',
                'status' => 'Status',
                'modified' => 'Time'
            );
            $qc = '`phone`, `status`, `modified`';
        }
        $phone = $this->input->post('phone', true);
        $status = $this->input->post('status', true);
        $query = "select $qc from ".$this->tech4rumModel;
        $query .= $this->criteria($phone, $status);
        $list = $this->db->query($query)->result_array();
        $finalList = array_merge(array($header), $list);
//        print_r($finalList); exit;
        $this->load->library('excel');
        $this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->fromArray($finalList);
        $filename = $filename.'.xlsx';
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="'.$filename.'"');
        header('Cache-Control: max-age=0');
        $objWriter = new PHPExcel_Writer_Excel2007($this->excel, 'Excel2007');
        $objWriter->save('php://output');
//        print_r($finalList); exit;
    }

}
