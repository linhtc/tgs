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
class Profile extends MY_Controller {
	
	function __construct() {
        parent::__construct();
        $this->class = strtolower(get_class());
        $this->numRows = 10;
        $this->groupModel = 'sys_groups';
        $this->moduleModel = 'sys_modules';
        $this->userModel = 'sys_users';
        $this->menuModel = 'sys_menus';
        $this->page = 'profile';
    }

    /**
     * sign_out
     * @author Leon Tran <leon@agikigi.com>
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
     * View
     */
    public function index() {
        $permission = null;//$this->check_permission($this->class, 'view');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('portal');

        $listCss = array(
            '/static/admin/css/buttons.dataTables.min.css',
            '/static/admin/css/select.dataTables.min.css',
            '/static/admin/template/lightbox/css/lightbox.css'
        );
        $listJs = array(
            '/static/admin/js/plugins/jquery.dataTables.min.js',
            '/static/admin/js/plugins/dataTables.buttons.min.js',
            '/static/admin/js/plugins/dataTables.select.min.js',
            '/static/admin/js/plugins/dataTables.pipeline.js',
            '/static/admin/js/plugins/buttons.html5.min.js',
            '/static/admin/template/lightbox/js/lightbox.js',
            '/static/admin/js/extra/profile.js?v=3'
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
            'page' => $this->page
        );

        $this->parser->parse("admin/users/profile", $data);
    }

    /**
     * Cap nhat thong tin
     */
    public function save() {
//        $this->check_permission($this->class, 'view');
        $this->layout->disable_layout();

        $response = new stdClass();
        $response->status = 0;

        $username = $this->session->userdata('user_username');
        if(empty($username)){ /* Neu khong co session username */
            $response->message = 'Không có quyền thực hiện';
            $this->response($response);
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
            $this->load->helper('hashpassword');
            $hashpass = new hashpassword();
            $pullClass['password'] = $hashpass->hash($password);
        }

        $updated = $this->db->where('username', $username)->update($this->userModel, $pullClass);
        $response->status = $updated ? 1 : 0;
        $response->message = $updated ? 'Đã lưu lại thông tin' : 'Thông tin chưa được lưu!';
        $this->response($response);
    }

}
