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
class Notifications extends MY_Controller {

    private $class;
    private $numRows;
    private $configModel;
    private $page;
    private $viewPath;

	function __construct() {
        parent::__construct();
        $this->class = strtolower(get_class());
        $this->numRows = 10;
        $this->page = 'notification';
        $this->configModel = 'sys_messages';
        $this->viewPath = 'admin/notifications/';
    }
	
    /**
     * View
     */
    public function index() {
		$permission = $this->check_permission($this->class, 'view');
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('portal');

        $listCss = array(
            '/static/admin/css/buttons.dataTables.min.css',
            '/static/admin/css/select.dataTables.min.css'
        );
        $listJs = array(
            '/static/admin/js/plugins/jquery.dataTables.min.js',
            '/static/admin/js/plugins/dataTables.buttons.min.js',
            '/static/admin/js/plugins/dataTables.select.min.js',
            '/static/admin/js/plugins/dataTables.pipeline.js',
            '/static/admin/js/plugins/buttons.html5.min.js',
            '/static/admin/js/extra/notifications.js'
        );

        $campaignList = array();//$this->db->select('id, campaign_name `name`')->from($this->campaignModel)->where('status', 1)->get()->result_array();

        $data = array(
            'campaignList' => $campaignList,
            'permission' => $permission,
            'listJs' => add_Js($listJs),
            'listCss' => add_css($listCss),
            'page' => $this->page
        );

        $this->parser->parse($this->viewPath."view", $data);
    }

    /**
     * Remove object
     */
    public function remove() {
        $this->check_permission($this->class, 'delete');
        $this->layout->disable_layout();
        $response = new stdClass();
        $response->status = 0;

        $id = $this->input->post('list', true);
        if(!empty($id)){
            $pullClass = array('deleted' => 1);
            $result = $this->db->where_in('id', explode(',', $id))->update($this->configModel, $pullClass);
            $response->status = $result ? 1 : 0;
        }
        $this->response($response);
    }

    /**
     * Get data with ajax
     */
    public function data() {
//        $permission = $this->check_permission($this->class, 'view');
        $this->layout->disable_layout();
        $response = new stdClass();
        $response->status = 0;

        // editing case request
        $id = $this->input->post('_id', true);
        if(!empty($id)){
            $item = $this->db->select()->from($this->configModel)->where('id', $id)->where('deleted', 0)->get()->row();
            $response->status = 1;
            $response->item = $item;
            $this->response($response);
        }

        // listing case request
        $sortMaps = array('id', 'id', 'usr_name', 'usr_email', 'usr_message');
        $order = $this->input->post('order', true);
        $sort = isset($order[0]['column']) ? $order[0]['column'] : 0;
        $type = isset($order[0]['dir']) ? $order[0]['dir'] : 'desc';
        $start = $this->input->post('start', true);
        $query = $this->db->select('`id`, `usr_name` n, `usr_email` e, `usr_message` m')->from($this->configModel)->where('deleted', 0);
        $this->criteria($query);
        $num = $this->db->count_all_results('', false);
        $query = $query->order_by(empty($sortMaps[$sort]) ? 'id' : $sortMaps[$sort], !empty($type) ? $type : 'desc');
        $query = $query->limit($start, $this->numRows);

        $set = array();
        $all = 0;
        if($num){
            $response->status = 1;
            $list = $query->get()->result();
            foreach($list as $index=>$item){
                array_push($set, array(null, $item->id, $item->n, $item->e, $item->m));
            }
            $all = $this->db->select('id')->from($this->configModel)->where('deleted', 0)->get()->num_rows();
        }
        $response->data = $set;
        $response->draw = $this->input->post('draw', true);
        $response->recordsTotal = $all;
        $response->recordsFiltered = $num;

        echo json_encode($response); exit;
    }

    /**
     * Create criteria string for query
     */
    function criteria(&$query){
        $id = $this->input->post('id', true);
        $k = $this->input->post('k', true);
        $n = $this->input->post('n', true);
        $v1 = $this->input->post('v1', true);
        $v2 = $this->input->post('v2', true);
        if(!empty($id)){/*where like include: before(%pattern), after(pattern%) and both(%pattern%)*/
            $query = $query->like('id', $id, 'both');
        }
        if(!empty($k)){
            $query = $query->like('apply_key', $k, 'both');
        }
        if(!empty($n)){
            $query = $query->like('apply_name', $n, 'both');
        }
        if(!empty($v1)){
            $query = $query->like('apply_value', $v1, 'both');
        }
        if(!empty($v2)){
            $query = $query->like('apply_value2', $v2, 'both');
        }
    }

    /**
     * Save data
     */
    function save(){
        $response = new stdClass();
        $response->status = 0;
        $id = $this->input->post('id', true);
        $key = $this->input->post('apply_key', true);
        $name = $this->input->post('apply_name', true);
        $value = $this->input->post('apply_value', true);
        $value2 = $this->input->post('apply_value2', true);
        if(!empty($name) && !empty($key)){
            $query = /** @lang text */
                "
                INSERT INTO `".$this->configModel."` (".(!empty($id) ? '`id`, ' : '')."`apply_key`, `apply_name`, 
                    `apply_value`, `apply_value2`, `created`, `modified`)
                VALUES (".((!empty($id) ? addslashes($id).', ' : ''))."'".addslashes($key)."', '".addslashes($name)."', 
                    '".addslashes($value)."', '".addslashes($value2)."', NOW(), NOW())
                ON DUPLICATE KEY UPDATE `apply_name` = '".addslashes($name)."', 
                `apply_value` = '".addslashes($value)."', `apply_value2` = '".addslashes($value2)."', `modified` = NOW();
            ";
            $result = $this->db->query($query);
            $response->status = $result ? 1 : 0;
        }
        $this->response($response);
    }

}
