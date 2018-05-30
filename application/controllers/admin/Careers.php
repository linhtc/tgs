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
class Careers extends MY_Controller {

    private $class;
    private $numRows;
    private $careerModel;
    private $page;
    private $viewPath;

	function __construct() {
        parent::__construct();
        $this->class = strtolower(get_class());
        $this->numRows = 10;
        $this->page = 'career';
        $this->careerModel = 'sys_careers';
        $this->viewPath = 'admin/careers/';
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
            '/static/admin/js/extra/careers.js'
        );

        $data = array(
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
            $result = $this->db->where_in('id', explode(',', $id))->update($this->careerModel, $pullClass);
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
            $item = $this->db->select()->from($this->careerModel)->where('id', $id)->where('deleted', 0)->get()->row();
            $response->status = 1;
            $response->item = $item;
            $this->response($response);
        }

        // listing case request
        $sortMaps = array('sort', 'id', 'employer_name', 'employer_avatar', 'employer_email', 'employer_intro', 'employee_position', 'employee_skills', 'sort');
        $order = $this->input->post('order', true);
        $sort = isset($order[0]['column']) ? $order[0]['column'] : 0;
        $type = isset($order[0]['dir']) ? $order[0]['dir'] : 'desc';
        $start = $this->input->post('start', true);
        $query = $this->db->select('`id`, `employer_name` er_n, `employer_position` er_p, `employer_avatar` er_a, 
            `employer_email` er_e, `employer_intro` er_i, `employer_facebook` er_fa, `employer_twitter` er_tw, `employer_youtube` er_yu, 
            `employee_position` ee_p, `employee_skills` ee_s, `sort` so')
            ->from($this->careerModel)->where('deleted', 0)
        ;
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
                array_push($set, array(null, $item->id, $item->er_n.' ('.$item->er_p.')', $item->er_a, $item->er_e,
                    $item->er_i, $item->ee_p, $item->ee_s, 'Xem', $item->so));
            }
            $all = $this->db->select('id')->from($this->careerModel)->where('deleted', 0)->get()->num_rows();
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
        $er_n = $this->input->post('employer_name', true);
        $er_p = $this->input->post('employer_position', true);
        $er_e = $this->input->post('employer_email', true);
        $er_fa = $this->input->post('employer_facebook', true);
        $er_tw = $this->input->post('employer_twitter', true);
        $er_yo = $this->input->post('employer_youtube', true);
        $er_a = $this->input->post('employer_avatar', true);
        $er_i = $this->input->post('employer_intro', true);
        $ee_p = $this->input->post('employee_position', true);
        $ee_s1 = $this->input->post('skill_1', true);
        $ee_s2 = $this->input->post('skill_2', true);
        $ee_s3 = $this->input->post('skill_3', true);
        $ee_s4 = $this->input->post('skill_4', true);
        $sort = $this->input->post('sort', true);
        if(!empty($ee_p)){
            if(empty($sort)){
                $sort = 1;
            }
            $skills = new stdClass();
            $ee_s1 = explode(':', $ee_s1);
            if(count($ee_s1) === 2){
                $skills->{trim($ee_s1[0])} = trim($ee_s1[1]);
            }
            $ee_s2 = explode(':', $ee_s2);
            if(count($ee_s2) === 2){
                $skills->{trim($ee_s2[0])} = trim($ee_s2[1]);
            }
            $ee_s3 = explode(':', $ee_s3);
            if(count($ee_s3) === 2){
                $skills->{trim($ee_s3[0])} = trim($ee_s3[1]);
            }
            $ee_s4 = explode(':', $ee_s4);
            if(count($ee_s4) === 2){
                $skills->{trim($ee_s4[0])} = trim($ee_s4[1]);
            }
            $skills = json_encode($skills);
            $query = /** @lang text */
                "
                INSERT INTO `".$this->careerModel."` (".(!empty($id) ? '`id`, ' : '')."`employer_name`,
                    `employer_position`, `employer_avatar`, `employer_email`, `employer_intro`, `employer_facebook`, `employer_twitter`, 
                    `employer_youtube`, `employee_position`, `employee_skills`, 
                    `sort`, `created`, `modified`)
                VALUES (".((!empty($id) ? addslashes($id).', ' : ''))."'".addslashes($er_n)."', 
                    '".addslashes($er_p)."', '".addslashes($er_a)."', '".addslashes($er_e)."', '".addslashes($er_i)."', 
                    '".addslashes($er_fa)."', '".addslashes($er_tw)."', '".addslashes($er_yo)."', '".addslashes($ee_p)."', '".addslashes($skills)."',  
                    '".addslashes($sort)."', NOW(), NOW())
                ON DUPLICATE KEY UPDATE `employer_name` = '".addslashes($er_n)."', 
                `employer_position` = '".addslashes($er_p)."', `employer_avatar` = '".addslashes($er_a)."', `employer_email` = '".addslashes($er_e)."', 
                `employer_intro` = '".addslashes($er_i)."', `employer_facebook` = '".addslashes($er_fa)."', `employer_twitter` = '".addslashes($er_tw)."', 
                `employer_youtube` = '".addslashes($er_yo)."', `employee_position` = '".addslashes($ee_p)."', `employee_skills` = '".addslashes($skills)."', 
                `sort` = '".addslashes($sort)."', `modified` = NOW();
            ";
            $result = $this->db->query($query);
            $response->status = $result ? 1 : 0;
        }
        $this->response($response);
    }

}
