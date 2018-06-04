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
class Metadata extends MY_Controller {

    private $class;
    private $numRows;
    private $metadataModel;
    private $page;
    private $viewPath;

	function __construct() {
        parent::__construct();
        $this->class = strtolower(get_class());
        $this->numRows = 10;
        $this->page = 'metadata';
        $this->viewPath = 'admin/metadata/';
        $this->metadataModel = 'sys_metadata';
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
            '/static/admin/js/extra/metadata.js'
        );

        $data = array(
            'permission' => $permission,
            'listJs' => add_Js($listJs),
            'listCss' => add_css($listCss),
            'page' => $this->page
        );

        $this->parser->parse($this->viewPath."view", $data);
//        $this->parser->parse($this->viewPath."aio", $data);
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
            $result = $this->db->where_in('id', explode(',', $id))->update($this->metadataModel, $pullClass);
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
            $item = $this->db->select()->from($this->metadataModel)->where('id', $id)->where('deleted', 0)->get()->row();
            $response->status = 1;
            $response->item = $item;
            $this->response($response);
        }

        // listing case request
        $sortMaps = array('sort', 'id', 'section', 'title', 'des', 'detail', 'photo', 'sort');
        $order = $this->input->post('order', true);
        $sort = isset($order[0]['column']) ? $order[0]['column'] : 0;
        $type = isset($order[0]['dir']) ? $order[0]['dir'] : 'desc';
        $start = $this->input->post('start', true);
        $query = $this->db->select('`id`, `section` s, `title` t, `des` ds, `detail` dl, `photo` p, `sort` so')->from($this->metadataModel)->where('deleted', 0);
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
                array_push($set, array(null, $item->id, $item->s, $item->t, $item->ds, $item->dl, $item->p, $item->so));
            }
            $all = $this->db->select('id')->from($this->metadataModel)->where('deleted', 0)->get()->num_rows();
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
        $t = $this->input->post('t', true);/*title*/
        $s = $this->input->post('s', true);/*sub*/
        $b = $this->input->post('b', true);/*background*/
        $so = $this->input->post('so', true);/*sort*/
        if(!empty($id)){/*where like include: before(%pattern), after(pattern%) and both(%pattern%)*/
            $query = $query->like('id', $id, 'both');
        }
        if(!empty($k)){
            $query = $query->like('kind', $k, 'both');
        }
        if(!empty($t)){
            $query = $query->like('title', $t, 'both');
        }
        if(!empty($s)){
            $query = $query->like('sub', $s, 'both');
        }
        if(!empty($b)){
            $query = $query->like('background', $b, 'both');
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
        $title = $this->input->post('title', true);
        $sub = $this->input->post('sub', true);
        $background = $this->input->post('background', true);
        $sort = $this->input->post('sort', true);
        if(!empty($kind)){
            if(empty($sort)){
                $sort = 1;
            }
            $query = /** @lang text */
                "
                INSERT INTO `".$this->metadataModel."` (".(!empty($id) ? '`id`, ' : '')."`kind`,
                    `title`, `sub`, `background`, `sort`, `created`, `modified`)
                VALUES (".((!empty($id) ? addslashes($id).', ' : ''))."'".addslashes($kind)."', 
                    '".addslashes($title)."', '".addslashes($sub)."', '".addslashes($background)."', '".addslashes($sort)."', NOW(), NOW())
                ON DUPLICATE KEY UPDATE `kind` = '".addslashes($kind)."', 
                `title` = '".addslashes($title)."', `sub` = '".addslashes($sub)."', 
                `background` = '".addslashes($background)."', `sort` = '".addslashes($sort)."', `modified` = NOW();
            ";
            $result = $this->db->query($query);
            $response->status = $result ? 1 : 0;
        }
        $this->response($response);
    }

}
