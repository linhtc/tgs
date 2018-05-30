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
class Lists extends MY_Controller {

    private $class;
    private $numRows;
    private $listModel;
    private $page;
    private $viewPath;

	function __construct() {
        parent::__construct();
        $this->class = strtolower(get_class());
        $this->numRows = 10;
        $this->page = 'list';
        $this->listModel = 'sys_lists';
        $this->viewPath = 'admin/lists/';
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
            '/static/admin/js/extra/lists.js'
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
            $result = $this->db->where_in('id', explode(',', $id))->update($this->listModel, $pullClass);
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
            $item = $this->db->select()->from($this->listModel)->where('id', $id)->where('deleted', 0)->get()->row();
            $response->status = 1;
            $response->item = $item;
            $this->response($response);
        }

        // listing case request
        $sortMaps = array('sort', 'id', 'kind', 'icon', 'title', 'sub', 'content', 'sort');
        $order = $this->input->post('order', true);
        $sort = isset($order[0]['column']) ? $order[0]['column'] : 0;
        $type = isset($order[0]['dir']) ? $order[0]['dir'] : 'desc';
        $start = $this->input->post('start', true);
        $query = $this->db->select('`id`, `kind` k, `icon` i, `title` t, `sub` s, `content` c, `sort` so')->from($this->listModel)->where('deleted', 0);
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
                array_push($set, array(null, $item->id, $item->k, $item->i, $item->t, $item->s, $item->c, $item->so));
            }
            $all = $this->db->select('id')->from($this->listModel)->where('deleted', 0)->get()->num_rows();
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
        $k = $this->input->post('k', true);/*kind*/
        $i = $this->input->post('i', true);/*icon*/
        $t = $this->input->post('t', true);/*title*/
        $s = $this->input->post('s', true);/*sub*/
        $c = $this->input->post('c', true);/*content*/
        $so = $this->input->post('so', true);/*sort*/
        if(!empty($id)){/*where like include: before(%pattern), after(pattern%) and both(%pattern%)*/
            $query = $query->like('id', $id, 'both');
        }
        if(!empty($k)){
            $query = $query->like('kind', $k, 'both');
        }
        if(!empty($i)){
            $query = $query->like('icon', $i, 'both');
        }
        if(!empty($t)){
            $query = $query->like('title', $t, 'both');
        }
        if(!empty($s)){
            $query = $query->like('sub', $s, 'both');
        }
        if(!empty($c)){
            $query = $query->like('content', $c, 'both');
        }
        if(!empty($so)){
            $query = $query->like('sort', $so, 'both');
        }
    }

    /**
     * Save data
     */
    function save(){
        $response = new stdClass();
        $response->status = 0;
        $id = $this->input->post('id', true);
        $kind = $this->input->post('kind', true);
        $icon = $this->input->post('icon', true);
        $title = $this->input->post('title', true);
        $sub = $this->input->post('sub', true);
        $content = $this->input->post('content', true);
        $sort = $this->input->post('sort', true);
        if(!empty($kind)){
            if(empty($icon)){
                $icon = 'fa-star';
            }
            if(empty($sort)){
                $sort = 1;
            }
            $query = /** @lang text */
                "
                INSERT INTO `".$this->listModel."` (".(!empty($id) ? '`id`, ' : '')."`kind`, `icon`, 
                    `title`, `sub`, `content`, `sort`, `created`, `modified`)
                VALUES (".((!empty($id) ? addslashes($id).', ' : ''))."'".addslashes($kind)."', '".addslashes($icon)."', 
                    '".addslashes($title)."', '".addslashes($sub)."', '".addslashes($content)."', '".addslashes($sort)."', NOW(), NOW())
                ON DUPLICATE KEY UPDATE `kind` = '".addslashes($kind)."', 
                `icon` = '".addslashes($icon)."', `title` = '".addslashes($title)."', `sub` = '".addslashes($sub)."', 
                `content` = '".addslashes($content)."', `sort` = '".addslashes($sort)."', `modified` = NOW();
            ";
            $result = $this->db->query($query);
            $response->status = $result ? 1 : 0;
        }
        $this->response($response);
    }

}
