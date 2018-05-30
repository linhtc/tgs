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
class Languages extends MY_Controller {

    private $class;
    private $numRows;
    private $languageModel;
    private $page;
    private $viewPath;

	function __construct() {
        parent::__construct();
        $this->class = strtolower(get_class());
        $this->numRows = 10;
        $this->page = 'language';
        $this->languageModel = 'sys_languages';
        $this->viewPath = 'admin/languages/';
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
            '/static/admin/js/extra/languages.js'
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
            $result = $this->db->where_in('id', explode(',', $id))->update($this->languageModel, $pullClass);
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
            $item = $this->db->select()->from($this->languageModel)->where('id', $id)->where('deleted', 0)->get()->row();
            $response->status = 1;
            $response->item = $item;
            $this->response($response);
        }

        // listing case request
        $sortMaps = array('id', 'id', 'lang', 'note', 'vi', 'en', 'jp', 'cn');
        $order = $this->input->post('order', true);
        $sort = isset($order[0]['column']) ? $order[0]['column'] : 0;
        $type = isset($order[0]['dir']) ? $order[0]['dir'] : 'desc';
        $start = $this->input->post('start', true);
        $query = $this->db->select('`id`, `lang`, `note`, `vi`, `en`, `jp`, `cn`')->from($this->languageModel)->where('deleted', 0);
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
                array_push($set, array(null, $item->id, $item->lang, $item->note, $item->vi, $item->en, $item->jp, $item->cn));
            }
            $all = $this->db->select('id')->from($this->languageModel)->where('deleted', 0)->get()->num_rows();
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
        $lang = $this->input->post('lang', true);
        $note = $this->input->post('note', true);
        $vi = $this->input->post('vi', true);
        $en = $this->input->post('en', true);
        $jp = $this->input->post('jp', true);
        $cn = $this->input->post('cn', true);
        if(!empty($id)){/*where like include: before(%pattern), after(pattern%) and both(%pattern%)*/
            $query = $query->like('id', $id, 'both');
        }
        if(!empty($lang)){
            $query = $query->like('lang', $lang, 'both');
        }
        if(!empty($note)){
            $query = $query->like('note', $note, 'both');
        }
        if(!empty($vi)){
            $query = $query->like('vi', $vi, 'both');
        }
        if(!empty($en)){
            $query = $query->like('en', $en, 'both');
        }
        if(!empty($jp)){
            $query = $query->like('jp', $jp, 'both');
        }
        if(!empty($cn)){
            $query = $query->like('cn', $cn, 'both');
        }
    }

    /**
     * Save data
     */
    function save(){
        $response = new stdClass();
        $response->status = 0;
        $id = $this->input->post('id', true);
        $lang = $this->input->post('lang', true);
        $note = $this->input->post('note', true);
        $vi = $this->input->post('vi', true);
        $en = $this->input->post('en', true);
        $jp = $this->input->post('jp', true);
        $cn = $this->input->post('cn', true);
        if(!empty($lang)){
            $query = /** @lang text */
                "
                INSERT INTO `".$this->languageModel."` (".(!empty($id) ? '`id`, ' : '')."`lang`, `note`, 
                    `vi`, `en`, `jp`, `cn`, `created`, `modified`)
                VALUES (".((!empty($id) ? addslashes($id).', ' : ''))."'".addslashes($lang)."', '".addslashes($note)."', 
                    '".addslashes($vi)."', '".addslashes($en)."', '".addslashes($jp)."', '".addslashes($cn)."', NOW(), NOW())
                ON DUPLICATE KEY UPDATE `note` = '".addslashes($note)."', 
                `vi` = '".addslashes($vi)."', `en` = '".addslashes($en)."', `jp` = '".addslashes($jp)."', `cn` = '".addslashes($cn)."', `modified` = NOW();
            ";
            $result = $this->db->query($query);
            $response->status = $result ? 1 : 0;
        }
        $this->response($response);
    }

}
