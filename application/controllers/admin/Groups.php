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
class Groups extends MY_Controller {
	
	function __construct() {
        parent::__construct();
        $this->class = strtolower(get_class());
        $this->numRows = 10;
        $this->groupModel = 'cnc_groups';
        $this->moduleModel = 'cnc_modules';
        $this->menuModel = 'cnc_menus';
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
        );

        $data = array(
            'permission' => $permission,
            'listJs' => add_Js($listJs),
            'listCss' => add_css($listCss),
        );

        $this->parser->parse("admin/groups/view", $data);
    }

    /**
     * Get data with ajax
     */
    public function data() {
        $permission = $this->check_permission($this->class, 'view');
        $this->layout->disable_layout();

        $sortMaps = array('id', 'group_name', 'locked');
        $page = $this->input->post('page', true);
        $sort = $this->input->post('sort', true);
        $type = $this->input->post('type', true);
        $start = ($page-1)*$this->numRows;
        $query = "select `id`, `group_name`, `locked` from ".$this->groupModel;
        $query .= $this->criteria();
        $num = $this->db->query($query)->num_rows();
        $query .= " order by `".(empty($sortMaps[$sort]) ? 'id' : $sortMaps[$sort]) ."` ".$type;
        $query .= " limit $start, ".$this->numRows;
//        echo $query; exit;
        $list = $this->db->query($query)->result_array();
        $this->smarty->assign('list', $list);
        $this->smarty->assign('permission', $permission);
        $html = $this->smarty->fetch("admin/groups/data.tpl");
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
        $groupName = $this->input->post('gname', true);
        $locked = $this->input->post('locked', true);
        $criteria = " where `deleted` = 0 ";
        if(is_array($locked) && count($locked)){
            $mdString = '';
            foreach($locked as $module){
                $mdString .= ($mdString == "" ? "" : ",")."'$module'";
            }
            $criteria .= " AND locked IN($mdString) ";
        }
        if(!empty($groupName)){
            $criteria .= " AND group_name = '$groupName' ";
        }
        return $criteria;
    }

    /**
     * Danh sách nhóm
     */
    public function views() {
		$permission = $this->check_permission($this->class, 'view');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');
        $list = $this->db->select()
            ->from($this->groupModel)
            ->get()
            ->result_array()
        ;
        $data = array(
            'list' => $list,
            'permission' => $permission,
        );

        $this->parser->parse("admin/groups/view", $data);
    }

	/**
     * Thêm một nhóm mới
     */
    public function add_new() {
		$permission = $this->check_permission($this->class, 'add');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');

        $data = array(
			'active_menu_groups' => 'true',
            'active_menu_groups_new_view' => 'true',
        );

        $this->parser->parse("admin/groups/add_new", $data);
    }

	/**
     * Thêm một nhóm mới
     */
    public function add() {
		$permission = $this->check_permission($this->class, 'add');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');

        $data = array(
			'active_menu_groups' => 'true',
            'active_menu_groups_new_view' => 'true',
        );

        $this->parser->parse("admin/groups/add", $data);
    }

	/**
     * Thực hiện thêm một nhóm mới
     */
    public function submit_add_new() {
		$permission = $this->check_permission($this->class, 'add');
        $this->layout->disable_layout();

        $this->load->model('groups/Group');
        $this->model_name = 'Group';

        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->form_validation->set_rules('group_name', 'group_name', 'required');
        $this->form_validation->set_rules('locked', 'locked', 'required');

        if ($this->form_validation->run() == TRUE) {
            $group_name = $this->input->post('group_name', TRUE);
            $locked = $this->input->post('locked', TRUE);

            $user_obj = $this->Group->find('first_array', array(
                "where" => array(
                    'group_name' => $group_name,
                ),
            ));

            if(!$user_obj) {
				$this->load->helper('date');
                $data_post = array(
                    'user_id' => $this->session->userdata('user_id'),
                    'user_ip' => $_SERVER['REMOTE_ADDR'],
                    'group_name' => $group_name,
                    'created' => mdate('%Y-%m-%d %H:%i:%s', now()),
                    'locked' => $locked,
                );

                $group_id = $this->Group->create($data_post, TRUE);

                if ($group_id > 0) {
                    echo 1; // them thanh cong
                    die();
                } else {
                    echo 0; // them that bai
                    die();
                }
            } else {
                echo 2; // da ton tai
                die();
            }

        } else {
            echo 0; // loi params
            die();
        }
    }
	
	/**
     * Sửa một nhóm
     */
    public function edit($id = 0) {
        // $this->checkPermission();
		$permission = $this->check_permission($this->class, 'edit');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');

		$this->load->model('groups/Group');
        $this->model_name = 'Group';

        $obj = $this->Group->find('first_array', array(
            "where" => array(
                'id' => $id,
            ),
        ));
        $data = array(
            'obj' => $obj,
        );

        $this->parser->parse("admin/groups/edit", $data);
    }
	
	/**
     * Thực thi đổi tên nhóm
     */
    public function submit_edit($id = 0) {
        // $this->checkPermission();
		$permission = $this->check_permission($this->class, 'edit');
        $this->layout->disable_layout();

        $this->load->model('groups/Group');
        $this->model_name = 'Group';


        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->form_validation->set_rules('group_name', 'group_name', 'required');

        if ($this->form_validation->run() == TRUE) {
            $group_name = $this->input->post('group_name', TRUE);
            $locked = $this->input->post('locked', TRUE);
            $id = $this->input->post('id', TRUE);

			// kiem tra xem co ton tai ten nhom nay chua
			$group_obj = $this->Group->find('first_array', array(
                "where" => array(
                    'group_name' => $group_name,
                    'id !=' => $id,
                ),
            ));
			if($group_obj){
				echo 2; // da ton tai
                die();
			}
            $data_post = array(
                'user_id' => $this->session->userdata('user_id'),
                'user_ip' => $_SERVER['REMOTE_ADDR'],
                'username' => $this->session->userdata('user_username'),
                'group_name' => $group_name,
                'locked' => $locked
            );

            $status = $this->Group->update($data_post, array('id' => $id));
            if ($status) {
                //Write system log
                $this->load->model('system_logs/System_log');
                $this->model_name = 'System_log';
                $this->System_log->insert_system_log('Group', 'edit', 'Group id ' . $id , 1, 1);
                echo $id;
                die();
            } else {
                echo 0;
                die();
            }
        }
    }
	
	/**
     * Hiên thị trang phân quyền cho nhóm
     */
    public function change_permission($id = 0) {
		$permission = $this->check_permission($this->class, 'edit');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');

        $groupClass = $this->db->select('id, permission')
            ->from($this->groupModel)
            ->where('id', $id)
            ->get()
            ->row()
        ;
        $moduleList = $this->db->select('id, functions, module_key')
			->from($this->moduleModel)
			->where('deleted', 0)
			->get()
			->result_array()
		;

        $permissionList = json_decode($groupClass->permission, true);

        $menuListTmp = $this->db->select('id, if(parent_id = 0, "#", parent_id) parent, menu_name text, module, functions')
            ->from($this->menuModel)
            ->where('deleted', 0)
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;
        $menuList = array();
        if(count($menuListTmp)){
            foreach($menuListTmp as $menu){
                if(!empty($menu->functions)){
                    $functionList = json_decode($menu->functions);
                    if($functionList){
                        if(count((array)$functionList) > 1){
                            foreach($functionList as $funcKey=>$funcName){
                                $elementTree = new stdClass();
                                $elementTree->id = $menu->module.'_X_'.$funcKey.'_X_'.$menu->id;
                                $elementTree->parent = $menu->id;
                                $elementTree->text = $funcName;

                                $selected = !empty($permissionList[$menu->module][$funcKey]) ? true : false;
                                $state = new stdClass();
                                $state->opened = false;
                                $state->disabled = false;
                                $state->selected = $selected;

                                $elementTree->state = $state;

                                array_push($menuList, $elementTree);
                            }
                            unset($menu->module);
                            unset($menu->functions);
                            array_push($menuList, $menu);
                        } else{
                            foreach($functionList as $funcKey=>$funcName){
                                $menu->id = $menu->module.'_X_'.$funcKey.'_X_'.$menu->id;

                                $selected = !empty($permissionList[$menu->module][$funcKey]) ? true : false;
                                $state = new stdClass();
                                $state->opened = false;
                                $state->disabled = false;
                                $state->selected = $selected;
                                $menu->state = $state;

                                unset($menu->module);
                                unset($menu->functions);
                                array_push($menuList, $menu);
                            }
                        }
                    }
                } else{
                    unset($menu->module);
                    unset($menu->functions);
                    array_push($menuList, $menu);
                }
            }
        }

//		 print_r($menuList); exit;
        $listCss = array(
            'static/admin/template/plugins/toastr/toastr.min.css',
        );
        $listJs = array(
            'static/admin/template/plugins/jstree/jstree.min.js',
            'static/admin/template/plugins/toastr/toastr.min.js',
            'static/admin/template/plugins/blockui/jquery.blockUI.js',
        );
        $data = array(
            'id' => $id,
            'listPermission' => $permissionList,
            'permission' => $permission,
            'moduleList' => $moduleList,
            'menuList' => json_encode($menuList),
            'listJs' => add_Js($listJs),
            'listCss' => add_css($listCss),
        );

        $this->parser->parse("admin/groups/change_permission", $data);
    }
	
	/**
     * submit_change_password
     * @author Leon Tran <leon@agikigi.com>
     */
    public function submit_change_permission() {
        // kiem tra quyen
		// $this->checkPermission();
		$permission = $this->check_permission($this->class, 'edit');
        $this->layout->disable_layout();

		$id = $this->input->post('id', true); // returns all POST items without XSS filter
		$permissionList = $this->input->post('permissions', true); // returns all POST items without XSS filter
        $permissionList = json_decode($permissionList);
		$finalPermissionList = array();
        $menuViewString = '';
        $menuViewFlag = new stdClass();
		if(count($permissionList)){
			foreach($permissionList as $module=>$iPermissionList){
			    $idString = $iPermissionList->id;
                $parentID = $iPermissionList->parent;
                if(empty($menuViewFlag->$parentID)) {
                    if($parentID == '#'){
                        $parentID = 0;
                    }
                    $menuViewString .= (empty($menuViewString) ? '' : ',') . $parentID;
                    $menuViewFlag->$parentID = 1;
                }
                if(!is_numeric($idString)){
                    $objTmp = explode('_X_', $idString);
                    if(!empty($objTmp[0]) && !empty($objTmp[1])){
                        $finalPermissionList[$objTmp[0]][$objTmp[1]] = 1;
                    }
                    if(!empty($objTmp[2])){
                        $idString = $objTmp[2];
                    } elseif(is_numeric($objTmp[1])){
                        $idString = $objTmp[1];
                    }
                    if(empty($menuViewFlag->$idString)) {
                        $menuViewString .= (empty($menuViewString) ? '' : ',') . $idString;
                        $menuViewFlag->$idString = 1;
                    }
                } else{
                    if(empty($menuViewFlag->$idString)) {
                        $menuViewString .= (empty($menuViewString) ? '' : ',') . $idString;
                        $menuViewFlag->$idString = 1;
                    }
                }
                $parents = $iPermissionList->parents;
                if(is_array($parents) && count($parents)){
                    foreach($parents as $parentID){
                        if($parentID == '#'){
                            continue;
                        }
                        if(empty($menuViewFlag->$parentID)) {
                            $menuViewString .= (empty($menuViewString) ? '' : ',') . $parentID;
                            $menuViewFlag->$parentID = 1;
                        }
                    }
                }
			}
		}
		$dataPull = array(
            'user_id' => $this->session->userdata('user_id'),
            'user_ip' => $_SERVER['REMOTE_ADDR'],
//            'modified' => mdate('%Y-%m-%d %H:%i:%s', now()),
            'permission' => json_encode($finalPermissionList),
            'menus_view' => $menuViewString
        );
		$result = $this->db->where('id', $id)->update('cnc_groups', $dataPull);
		echo $result; exit;
    }
	
	/**
     * Đổi trạng thái
     */
    public function change_status($id=0, $status=0) {
        // $this->checkPermission();
		$permission = $this->check_permission($this->class, 'add');
        $this->layout->disable_layout();

        $this->load->model('groups/Group');
        $this->model_name = 'Group';

        $data_post = array(
			'user_id' => $this->session->userdata('user_id'),
			'user_ip' => $_SERVER['REMOTE_ADDR'],
			'username' => $this->session->userdata('user_username'),
			'locked' => $status ? 0 : 1
		);

		$status = $this->Group->update($data_post, array('id' => $id));
		redirect(base_url() . "admin/groups/list_view");
    }

	/**
     * Đổi trạng thái
     */
    public function status() {
        $this->check_permission($this->class, 'status');
        $this->layout->disable_layout();

        $id = $this->input->post('id', TRUE);
        $status = $this->input->post('status', TRUE);
        $dataPull = array(
			'user_id' => $this->session->userdata('user_id'),
			'user_ip' => $_SERVER['REMOTE_ADDR'],
			'username' => $this->session->userdata('user_username'),
			'locked' => $status ? 0 : 1
		);
        $status = $this->db->update($this->groupModel, $dataPull, array('id' => $id));
        echo $status; exit;
    }

    /**
     * change_password
     * @author Leon Tran <leon@agikigi.com>
     */
    public function change_password($id = 0) {
        $this->checkPermission();
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');
		$data = array(
            'active_menu_users' => 'true',
            'active_menu_users_change_password' => 'true',
        );
		if(!empty($id)){ // co truyen id => click doi mat khau tu danh sach
			$permission = $this->check_permission($this->class, 'change_pw_admin');
			$this->session->set_userdata('user_id_update', $id);
			$this->parser->parse("admin/users/change_password_admin", $data);
		}
		else{
			$permission = $this->check_permission($this->class, 'change_pw');
			$this->parser->parse("admin/users/change_password", $data);
		}
    }

    /**
     * submit_change_password
     * @author Leon Tran <leon@agikigi.com>
     */
    public function submit_change_password() {
        $this->checkPermission();
        $this->layout->disable_layout();

        $this->load->model('users/User');
        $this->model_name = 'User';

        $this->load->helper('hashpassword');
        $hashpass = new hashpassword();

        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->form_validation->set_rules('password-1', 'password-1', 'required');
        $this->form_validation->set_rules('password-2', 'password-2', 'required');
        $this->form_validation->set_rules('password-3', 'password-3', 'required');

        if ($this->form_validation->run() == TRUE) {
            $password_1 = $this->input->post('password-1', TRUE);
            $password_2 = $this->input->post('password-2', TRUE);
            $password_3 = $this->input->post('password-3', TRUE);

            $data_user_post = array(
                'password-1' => $password_1,
                'password-2' => $password_2,
                'password-3' => $password_3,
            );

            $user_id = $this->session->userdata('user_id');
            $user = (array) $this->User->get_by_user_id($user_id);

            if ($user) {
                if ($hashpass->checkPassword($user["password"], $data_user_post["password-1"]) == TRUE) {
                    if ($data_user_post["password-2"] == $data_user_post["password-3"]) {
                        $this->User->update(array(
                            // 'user_id' => $this->session->userdata('user_id'),
                            'user_id' => $user_id,
                            'user_ip' => $_SERVER['REMOTE_ADDR'],
                            'password' => $hashpass->hash($data_user_post["password-3"])
                        ), array('id' => $user["id"]));

                        //Write system log
                        $this->load->model('system_logs/System_log');
                        $this->model_name = 'System_log';
                        $this->System_log->insert_system_log('users', 'change_password', 'n/a', 1, 1);
						
						// Remove user_id_update session
						$this->session->unset_userdata('user_id_update');

                        echo 1;
                        die();
                    } else {
                        echo 2;
                        die();
                    }
                } else {
                    echo 3;
                    die();
                }
            } else {
                echo 2;
                die();
            }
        } else {
            echo 0;
            die();
        }
    }
    
	/**
     * submit_change_password_admin
     * @author 
     */
	public function submit_change_password_admin() {
        $this->checkPermission();
        $this->layout->disable_layout();

        $this->load->model('users/User');
        $this->model_name = 'User';

        $this->load->helper('hashpassword');
        $hashpass = new hashpassword();

        $this->load->helper('form');
        $this->load->library('form_validation');
        // $this->form_validation->set_rules('password-1', 'password-1', 'required');
        $this->form_validation->set_rules('password-2', 'password-2', 'required');
        $this->form_validation->set_rules('password-3', 'password-3', 'required');

        if ($this->form_validation->run() == TRUE) {
            // $password_1 = $this->input->post('password-1', TRUE);
            $password_2 = $this->input->post('password-2', TRUE);
            $password_3 = $this->input->post('password-3', TRUE);

            $data_user_post = array(
                // 'password-1' => $password_1,
                'password-2' => $password_2,
                'password-3' => $password_3,
            );

            $user_id = $this->session->userdata('user_id_update');
            $user = (array) $this->User->get_by_user_id($user_id);

            if ($user) {
                if ($data_user_post["password-2"] == $data_user_post["password-3"]) {
					$this->User->update(array(
						// 'user_id' => $this->session->userdata('user_id'),
						'user_id' => $user_id,
						'user_ip' => $_SERVER['REMOTE_ADDR'],
						'password' => $hashpass->hash($data_user_post["password-3"])
					), array('id' => $user["id"]));

					//Write system log
					$this->load->model('system_logs/System_log');
					$this->model_name = 'System_log';
					$this->System_log->insert_system_log('users', 'change_password', 'n/a', 1, 1);
					
					// Remove user_id_update session
					$this->session->unset_userdata('user_id_update');

					echo 1;
					die();
				} else {
					echo 2;
					die();
				}
            } else {
                echo 2;
                die();
            }
        } else {
            echo 0;
            die();
        }
    }

    public function user() {
        $this->load->model('users/User');
        $this->model_name = 'User';

        $users = $this->User->find('all', array());
        debug($users);
    }

    public function change_avatar() {
        $this->checkPermission();
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');

        $this->load->model('users/User');
        $this->model_name = 'User';

        $user_id = $this->session->userdata('user_id');
        $user = (array) $this->User->get_by_user_id($user_id);

        $data = array(
            'active_menu_users' => 'true',
            'user' => $user,
        );

        $this->parser->parse("admin/users/change_avatar", $data);
    }

    public function submit_change_avatar() {
        $this->checkPermission();
        $this->layout->disable_layout();

        $this->load->model('users/User');
        $this->model_name = 'User';

        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->form_validation->set_rules('article_thumbnail', 'article_thumbnail', 'required');

        if ($this->form_validation->run() == TRUE) {
            $avatar = $this->input->post('article_thumbnail', TRUE);

            $user_id = $this->session->userdata('user_id');
            $user = (array) $this->User->get_by_user_id($user_id);

            if ($user) {

                $this->User->update(array('avatar' => $avatar), array('id' => $user["id"]));

                $this->session->set_userdata('user_avatar', $avatar);

                //Write system log
                $this->load->model('system_logs/System_log');
                $this->model_name = 'System_log';
                $this->System_log->insert_system_log('users', 'change_avatar', 'n/a', 1, 1);

                echo 1;
                die();

            } else {
                echo 2;
                die();
            }

        } else {
            echo 0;
            die();
        }
    }
	
}
