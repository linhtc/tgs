<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class User extends MY_Model {

    function __construct() {
        parent::__construct();
        $this->db_table = 'sys_users';
    }

    /**
     * 
     * @param type $username
     * @return type
     */
    public function get_by_username($username) {
    	return $this->db->get_where($this->db_table, array('username' => $username))->row();
    }

    /**
     * 
     * @param type $user_id
     * @return type
     */
    public function get_by_user_id($user_id) {
    	return $this->db->get_where($this->db_table, array('id' => $user_id))->row();
    }

}

?>
