<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class System_log extends MY_Model {

    function __construct() {
        parent::__construct();
        $this->db_table = 'system_logs';
    }

    public function insert_system_log($module, $action, $description = 'n/a', $level = 0, $priority = 0) {
    	$data = array(
    		'created' => date("Y-m-d H:i:s"),
        	'modified' => date("Y-m-d H:i:s"),
    		'user_id' => $this->session->userdata('user_id'),
            'user_ip' => $_SERVER['REMOTE_ADDR'],
            'username' => $this->session->userdata('user_username'),
            'module' => $module,
            'action' => $action,
            'description' => $description,
            'level' => $level,
            'priority' => $priority,
            'is_status' => 1,
            'status_log' => 'n/a',
    	);
    	return $this->db->insert('system_logs', $data);
    }

    public function insert_system_log_distributor($module, $action, $description = 'n/a', $level = 0, $priority = 0) {
        $data = array(
            'created' => date("Y-m-d H:i:s"),
            'modified' => date("Y-m-d H:i:s"),
            'user_id' => $this->session->userdata('distributor_user_id'),
            'user_ip' => $_SERVER['REMOTE_ADDR'],
            'username' => $this->session->userdata('distributor_user_username'),
            'module' => $module,
            'action' => $action,
            'description' => $description,
            'level' => $level,
            'priority' => $priority,
            'is_status' => 1,
            'status_log' => 'n/a',
        );
        return $this->db->insert('system_logs', $data);
    }

}

?>
