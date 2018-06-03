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
class Users extends MY_Controller {
	
	function __construct() {
        parent::__construct();
        $this->class = strtolower(get_class());
        $this->numRows = 10;
        $this->groupModel = 'sys_groups';
        $this->moduleModel = 'sys_modules';
        $this->userModel = 'sys_users';
        $this->menuModel = 'sys_menus';
    }
	
    /**
     * Index page
     */
    public function login() {
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('login');

        $data = array();
        $r = $this->input->get('r');
        $data['r'] = $r;

        if ($this->checkSignIn() == TRUE) {
            $administrator = $this->session->userdata('administrator');
            $permission = $this->session->userdata('user_group_permission');
            $language = $this->session->userdata('user_lang');
            if($administrator || !empty($permission['homes']['view'])){
                redirect(base_url() .$language. "admin/homes");
            } else{
                redirect(base_url() .$language. "admin/profiles");
            }
        }

        $this->load->helper('form');
//        $this->load->library('form_validation');
//        $this->form_validation->set_rules('username', 'Username', 'required');
//        $this->form_validation->set_rules('password', 'Password', 'required');

        $username = $this->input->post('username', TRUE);
        $password = $this->input->post('password', TRUE);
//        if ($this->form_validation->run() == TRUE) {
        if (!empty($username && !empty($password))) {
            $language = $this->input->post('language', TRUE);
            $r = $this->input->post('r', TRUE);

            $this->load->model('users/User');
            $this->model_name = 'User';

//            $username = $this->input->post('username', TRUE);
//            $password = $this->input->post('password', TRUE);
//            $language = $this->input->post('language', TRUE);
//            $r = $this->input->post('r', TRUE);

            $data_user_post = array(
                'username' => $username,
                'password' => $password,
            );

            $user = (array) $this->User->get_by_username($data_user_post['username']);
//            print_r($user); exit;
            if(count($user) > 0){
                $this->load->helper('hashpassword');
                $hashpass = new hashpassword();
                if ($hashpass->checkPassword($user['password'], $data_user_post['password']) == TRUE) {
//                    echo 1; exit;
                    /* Cai dat ngon ngu */
                    global $CFG;
                    $config = & $CFG->config;
//                    $language_abbr = $config['language_abbr'];
//                    $language = ($language != $language_abbr && !empty($language_abbr)) ? $language.'/' : '';
                    $language = '';
                    // lay permission tu group id
                    $this->load->model('groups/Group');
                    $this->model_name = 'Group';
                    $groupObj = $this->db->select('id, permission, menus_view, cnf_reports, locked')
                        ->from('sys_groups')
                        ->where('id', $user['group_id'])
                        ->get()
                        ->row_array()
                    ;
                    // neu tai khoan/nhom cua tai khoan bi locked hoac khong phai admin
                    if(!empty($user["locked"]) || !empty($groupObj["locked"])){
                        $data['error_submit'] = 'Tài khoản đang bị khóa';
                    } else{
                        //Set session_data đăng nhập
                        $this->session->set_userdata('user_id', $user["id"]);
                        $this->session->set_userdata('user_username', $user["username"]);
                        $this->session->set_userdata('user_fullname', $user["full_name"]);
                        $this->session->set_userdata('user_avatar', $user["avatar"]);
                        $this->session->set_userdata('user_group_id', $user["group_id"]);
                        $this->session->set_userdata('administrator', $user["is_administrator"]);
                        if(!empty($groupObj['permission'])){
                            if(!empty($user['permission'])){
                                $this->session->set_userdata('user_group_permission', json_decode($user['permission'], true));
                            } else {
                                $this->session->set_userdata('user_group_permission', json_decode($groupObj['permission'], true));
                            }
                        }
                        if(!empty($groupObj['cnf_reports'])){
                            $this->session->set_userdata('user_cnf_reports', json_decode($groupObj['cnf_reports'], true));
                        }
                        $menuView = !empty($user['menus_view']) ? $user['menus_view'] : $groupObj['menus_view'];
                        $menuList = $this->db->select('id, parent_id, menu_name, module, router, icon')
                            ->from('sys_menus')
                            ->where('deleted', 0)
                            ->where_in('id', explode(',', $menuView))
                            ->order_by('sort', 'ASC')
                            ->get()
                            ->result()
                        ;
                        $this->session->set_userdata('user_mn_text', $menuList);

                        //Write system log
                        $this->load->model('system_logs/System_log');
                        $this->model_name = 'System_log';
                        $this->System_log->insert_system_log('users', 'sign_in', 'n/a', 1, 1);

                        $this->session->set_userdata('user_lang', $language);
//                        echo 2; exit;
                        if(!empty($r)){
                            redirect(urldecode($r));
                        } else{
                            $administrator = $this->session->userdata('administrator');
                            $permission = $this->session->userdata('user_group_permission');
                            if($administrator || !empty($permission['homes']['view'])){
                                redirect(base_url() .$language. "admin/homes");
                            } else{
                                redirect(base_url() .$language. "admin/profiles");
                            }
                        }
                    }
                }else{
                    $data['error_submit'] = 'Mật khẩu với tài khoản không đúng';
                }

            }else{
                $data['error_submit'] = 'Tài khoản không tồn tại trong hệ thống';
            }
        }

        $this->parser->parse("admin/users/login", $data);
    }

    /**
     * sign_out
     */
    public function logout() {
        $this->checkPermission();
        $this->layout->disable_layout();

        //Write system log
        $this->load->model('system_logs/System_log');
        $this->model_name = 'System_log';
        $this->System_log->insert_system_log('users', 'sign_out', 'n/a', 1, 1);

        $this->session->sess_destroy();
        redirect(base_url() . "admin");
    }

    /**
     * change_password
     */
    public function change_password($id = 0) {
//        $this->checkPermission();
        $this->check_permission($this->class, 'execute');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');
		$data = array(
            'active_menu_users' => 'true',
            'active_menu_users_change_password' => 'true',
        );
		if(!empty($id)){ // co truyen id => click doi mat khau tu danh sach
//			$permission = $this->check_permission($this->class, 'execute');
			$this->session->set_userdata('user_id_update', $id);
			$this->parser->parse("admin/users/change_password_admin", $data);
		}
		else{
//			$permission = $this->check_permission($this->class, 'execute');
			$this->parser->parse("admin/users/change_password", $data);
		}
    }

    /**
     * submit_change_password
     */
    public function submit_change_password() {
        $this->check_permission($this->class, 'execute');
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
     */
	public function submit_change_password_admin() {
        $this->check_permission($this->class, 'execute');
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

    /**
     * list_view
     */
    public function views() {
        // $this->checkPermission();
		$permission = $this->check_permission($this->class, 'view');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');

        $this->load->model('users/User');
        $this->model_name = 'User';

        $query = "
			SELECT u.*, (SELECT g.group_name FROM sys_groups g WHERE g.id = u.group_id) group_name
			FROM users u;
		";
		$users = $this->db->query($query)->result_array();
		// print_r($users); exit;
        $data = array(
			'active_menu_account' => 'true',
            'active_menu_account_view' => 'true',
            'users' => $users,
            'permission' => $permission,
        );

        $this->parser->parse("admin/users/view", $data);
    }

    /**
     * View
     */
    public function view() {
        $permission = $this->check_permission($this->class, 'view');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('portal');

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

        $groupList = $this->db->select('id, group_name gname')
            ->from($this->groupModel)
            ->where('deleted', 0)
            ->order_by('group_name', 'asc')
            ->get()
            ->result_array()
        ;
        $data = array(
            'groupList' => $groupList,
            'permission' => $permission,
            'listJs' => add_Js($listJs),
            'listCss' => add_css($listCss),
        );

        $this->parser->parse("admin/users/view", $data);
    }

    /**
     * View
     */
    public function permission_denied() {
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');

        $data = array(

        );

        $this->parser->parse("admin/users/denied", $data);
    }

    /**
     * View
     */
    public function profile() {
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

        $group = ", (select g.group_name from $this->groupModel g where g.id = u.group_id) group_name";
        $uid = $this->session->userdata('user_id');
        $userClass = $this->db->select('id, username, full_name, dob, phone, email, avatar, is_administrator admin'.$group)
            ->from($this->userModel.' u')
            ->where('id', $uid)
            ->get()
            ->row_array()
        ;
        $data = array(
            'user' => $userClass,
            'permission' => $permission,
            'listJs' => add_Js($listJs),
            'listCss' => add_css($listCss),
        );

        $this->parser->parse("admin/users/profile", $data);
    }

    /**
     * Doi avatar profile
     */
    public function avatar() {
//        $this->check_permission($this->class, 'view');
        $this->layout->disable_layout();

        $username = $this->session->userdata('user_username');
        if(empty($username)){ /* Neu khong co session username */
            echo 0; exit;
        }
        $path_parts = pathinfo($_FILES["upfiles"]["name"]);
        $extension = $path_parts['extension'];
        $fileLocation = $_FILES['upfiles']['tmp_name'];
        $file = $username.'.'.$extension;
        if (move_uploaded_file($fileLocation, MEDIAPATH. 'images/profiles/'.$file)) {
            $pullClass = array(
                'avatar' => $file,
                'modified' => date('Y-m-d H:i:s', time())
            );
            echo $this->db->where('username', $username)->update($this->userModel, $pullClass);
            exit;
        }
        echo 0; exit;
    }

    /**
     * Cap nhat thong tin
     */
    public function set() {
//        $this->check_permission($this->class, 'view');
        $this->layout->disable_layout();

        $username = $this->session->userdata('user_username');
        if(empty($username)){ /* Neu khong co session username */
            echo 0; exit;
        }
        $pullClass = array(
            'modified' => date('Y-m-d H:i:s', time())
        );
        $full_name = $this->input->get_post('full_name', true);
        $phone = $this->input->get_post('phone', true);
        $email = $this->input->get_post('email', true);
        $dob = $this->input->get_post('dob', true);
        $password = $this->input->get_post('password', true);

        if(!empty($full_name)){ /* Neu co truyen full name */
            $pullClass['full_name'] = $full_name;
        }
        if(!empty($phone)){ /* Neu co truyen phone */
            $pullClass['phone'] = $phone;
        }
        if(!empty($email)){ /* Neu co truyen email */
            $pullClass['email'] = $email;
        }
        if(!empty($dob)){ /* Neu co truyen dob */
            $pullClass['dob'] = date('Y-m-d', strtotime($dob));
        }
        if(!empty($password)){ /* Neu co truyen password */
            if($password != $this->input->get_post('confirm-password', true)){
                echo 'Xác nhận password không đúng!'; exit;
            }
            $this->load->helper('hashpassword');
            $hashpass = new hashpassword();
            $pullClass['password'] = $hashpass->hash($password);
        }

        echo $this->db->where('username', $username)->update($this->userModel, $pullClass);
        exit;
    }

    /**
     * Get data with ajax
     */
    public function data() {
        $permission = $this->check_permission($this->class, 'view');
        $this->layout->disable_layout();

        $sortMaps = array('id', 'username', 'full_name', 'group_name', 'locked');
        $page = $this->input->post('page', true);
        $sort = $this->input->post('sort', true);
        $type = $this->input->post('type', true);
        $start = ($page-1)*$this->numRows;
        $query = "select u.id, u.username, u.full_name, u.locked, u.group_id, g.group_name from ".$this->userModel." u LEFT JOIN ".$this->groupModel." g ON u.group_id = g.id";
        $query .= $this->criteria();
        $num = $this->db->query($query)->num_rows();
        $query .= " order by `".(empty($sortMaps[$sort]) ? 'id' : $sortMaps[$sort]) ."` ".$type;
        $query .= " limit $start, ".$this->numRows;
        $list = $this->db->query($query)->result_array();
        $this->smarty->assign('list', $list);
        $this->smarty->assign('permission', $permission);
        $html = $this->smarty->fetch("admin/users/data.tpl");
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
        $username = $this->input->post('username', true);
        $fullName = $this->input->post('surname', true);
        $group = $this->input->post('group', true);
        $locked = $this->input->post('locked', true);
        $criteria = " where u.is_delete = 0 ";
        if(is_array($group) && count($group)){
            $mdString = '';
            foreach($group as $gid){
                $mdString .= ($mdString == "" ? "" : ",")."'$gid'";
            }
            $criteria .= " AND u.group_id IN($gid) ";
        }
        if(is_array($locked) && count($locked)){
            $mdString = '';
            foreach($locked as $module){
                $mdString .= ($mdString == "" ? "" : ",")."'$module'";
            }
            $criteria .= " AND u.locked IN($mdString) ";
        }
        if(!empty($username)){
            $criteria .= " AND u.username = '$username' ";
        }
        if(!empty($fullName)){
            $criteria .= " AND u.full_name = '$fullName' ";
        }
        return $criteria;
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
            'locked' => $status ? 0 : 1
        );
        $status = $this->db->update($this->userModel, $dataPull, array('id' => $id));
        echo $status; exit;
    }

    /**
     * Hiên thị trang phân quyền cho nhóm
     */
    public function change_permission($id = 0) {
        $permission = $this->check_permission($this->class, 'edit');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');

        $userClass = $this->db->select('id, group_id group, permission')
            ->from($this->userModel)
            ->where('id', $id)
            ->get()
            ->row()
        ;
        $groupClass = $this->db->select('id, permission')
            ->from($this->groupModel)
            ->where('id', $userClass->group)
            ->get()
            ->row()
        ;
        $moduleList = $this->db->select('id, functions, module_key')
            ->from($this->moduleModel)
            ->where('deleted', 0)
            ->get()
            ->result_array()
        ;
        $permissionList = json_decode(!empty($userClass->permission) ? $userClass->permission : $groupClass->permission, true) ;

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

        $this->parser->parse("admin/users/change_permission", $data);
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
        $likeGroup = $this->input->post('like_group', true);
        if(empty($likeGroup)){
            $permissionList = json_decode($permissionList);
            $finalPermissionList = array();
            $menuViewString = '';
            $menuViewFlag = new stdClass();
            if(count($permissionList)){
                foreach($permissionList as $module=>$iPermissionList){
                    $idString = $iPermissionList->id;
                    $parentID = $iPermissionList->parent;
                    if(empty($menuViewFlag->$parentID)) {
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
                            if(empty($menuViewFlag->$idString)) {
                                $menuViewString .= (empty($menuViewString) ? '' : ',') . $idString;
                                $menuViewFlag->$idString = 1;
                            }
                        }
                    } else{
                        if(empty($menuViewFlag->$idString)) {
                            $menuViewString .= (empty($menuViewString) ? '' : ',') . $idString;
                            $menuViewFlag->$idString = 1;
                        }
                    }
                }
            }
            $finalPermissionList = json_encode($finalPermissionList);
        } else {
            $finalPermissionList = '';
            $menuViewString = '';
        }

        $dataPull = array(
            'user_id' => $this->session->userdata('user_id'),
            'user_ip' => $_SERVER['REMOTE_ADDR'],
//            'modified' => mdate('%Y-%m-%d %H:%i:%s', now()),
            'permission' => $finalPermissionList,
            'menus_view' => $menuViewString
        );

        $result = $this->db->where('id', $id)->update($this->userModel, $dataPull);
        echo $result; exit;
    }

    public function add() {
        // $this->checkPermission();
		$permission = $this->check_permission($this->class, 'add');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');

        $this->load->model('users/User');
        $this->model_name = 'User';

        $users = $this->User->find('all', array());
		$groups = $this->db->select('id, group_name')
			->from('sys_groups')
			->where('deleted', 0)
			->get()
			->result_array()
		;
		// print_r($groups); exit;
        $data = array(
            'users' => $users,
            'groups' => $groups,
        );

        $this->parser->parse("admin/users/add_new_user", $data);
    }

    public function submit_add_new_user() {
        $this->checkPermission();
        $this->layout->disable_layout();

        $this->load->model('users/User');
        $this->model_name = 'User';

        $this->load->helper('hashpassword');
        $hashpass = new hashpassword();

        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->form_validation->set_rules('username', 'username', 'required');
        $this->form_validation->set_rules('fullname', 'fullname', 'required');
        $this->form_validation->set_rules('password-1', 'password-1', 'required');
        $this->form_validation->set_rules('password-2', 'password-2', 'required');
        $this->form_validation->set_rules('is_administrator', 'is_administrator', 'required');
        $this->form_validation->set_rules('group_id', 'group_id', 'required');

        if ($this->form_validation->run() == TRUE) {
            $username = $this->input->post('username', TRUE);
            $fullname = $this->input->post('fullname', TRUE);
            $password_1 = $this->input->post('password-1', TRUE);
            $password_2 = $this->input->post('password-2', TRUE);
            $is_administrator = $this->input->post('is_administrator', TRUE);
            $group_id = $this->input->post('group_id', TRUE);

            $user_log = $this->User->find('first_array', array(
                "where" => array(
                    'username' => $username,
                ),
            ));

            if(!$user_log) {
                $data_user_post = array(
                    'user_id' => $this->session->userdata('user_id'),
                    'user_ip' => $_SERVER['REMOTE_ADDR'],
                    'username' => $username,
                    'full_name' => $fullname,
                    'password' => $hashpass->hash($password_2),
                    'is_administrator' => $is_administrator,
                    'group_id' => $group_id,
                );

                $user_id = $this->User->create($data_user_post, TRUE);

                if ($user_id > 0) {
                    echo 2;
                    die();
                } else {
                    echo 3;
                    die();
                }
            } else {
                echo 1;
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
	
	/**
     * edit
     * @param type 
     */
    public function edit($id = 0) {
        // $this->checkPermission();
		$permission = $this->check_permission($this->class, 'edit');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');

        $this->load->model('users/User');
        $this->model_name = 'User';

        $user = $this->User->find('first_array', array(
            "where" => array(
                'id' => $id,
            ),
        ));
		$groups = $this->db->select('id, group_name')
			->from($this->groupModel)
			->where('deleted', 0)
			->get()
			->result_array()
		;
        $data = array(
            'user' => $user,
            'groups' => $groups,
        );

        $this->parser->parse("admin/users/edit", $data);
    }
	
	/**
     * submit_edit
     */
    public function submit_edit($id = 0) {
        $this->checkPermission();
        $this->layout->disable_layout();

        $this->load->model('users/User');
        $this->model_name = 'User';


        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->form_validation->set_rules('full_name', 'full_name', 'required');

        if ($this->form_validation->run() == TRUE) {
            $full_name = $this->input->post('full_name', TRUE);
            $is_administrator = $this->input->post('is_administrator', TRUE);
            $group_id = $this->input->post('group_id', TRUE);

            $id = $this->input->post('id', TRUE);

            $data_user_post = array(
                'user_id' => $this->session->userdata('user_id'),
                'user_ip' => $_SERVER['REMOTE_ADDR'],
                // 'username' => $this->session->userdata('user_username'),

                'full_name' => $full_name,
                'is_administrator' => $is_administrator,
                'group_id' => $group_id
            );

            $status = $this->User->update($data_user_post, array('id' => $id));
            if ($status) {
                //Write system log
                $this->load->model('system_logs/System_log');
                $this->model_name = 'System_log';
                $this->System_log->insert_system_log('User', 'edit', 'User id ' . $id , 1, 1);

                echo $id;
                die();
            } else {
                echo 0;
                die();
            }
        }
    }

	/**
     * Đổi trạng thái
     */
    public function change_status($id=0, $status=0) {
        // $this->checkPermission();
		$permission = $this->check_permission($this->class, 'add');
        $this->layout->disable_layout();

        $this->load->model('users/User');
        $this->model_name = 'User';

        $data_post = array(
			'user_id' => $this->session->userdata('user_id'),
			'user_ip' => $_SERVER['REMOTE_ADDR'],
			// 'username' => $this->session->userdata('user_username'),
			'locked' => $status ? 0 : 1
		);

		$status = $this->User->update($data_post, array('id' => $id));
		redirect(base_url() . "admin/users/list_view");
    }

    /**
     * Doi ngon ngu
     * Chi switch 2 ngon ngu Anh-Viet, them 1 ngon ngu nua se co van de. haha
     */
    public function language($lang='vi'){
        global $CFG;
        if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') {
            $host = "https://" . $_SERVER['HTTP_HOST'] . '/';
        } else{
            $host = "http://" . $_SERVER['HTTP_HOST'] . '/';
        }
        $referer = $_SERVER['HTTP_REFERER'];
        $referer = str_replace($host, '', $referer);
        $old = substr($referer, 0, strpos($referer, '/'));
        $config = & $CFG->config;
        $lang_uri_abbr = $config['lang_uri_abbr'];
        $referer = isset($lang_uri_abbr[$old]) ? str_replace($old.'/', '', $referer) : $referer;
        $lang = ($lang == $config['language_abbr']) ? '' : $lang.'/';
        $url = $host.$lang.$referer;
        $this->session->set_userdata('user_lang', $lang);
        redirect($url);
        exit;
    }

	
}
