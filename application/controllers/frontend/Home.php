<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Books
 *
 * @author CPU10890-local
 */
class Home extends MY_Controller {

	private $class;
	private $viewPath;

	private $messageModel;
	private $sliderModel;
	private $designModel;
	private $listModel;
	private $careerModel;
    private $photoModel;
	
    function __construct() {
        parent::__construct(true);
        $this->class = strtolower(get_class());
        $this->viewPath = 'frontend/home/';
        $this->sliderModel = 'sys_sliders';
        $this->designModel = 'sys_designs';
        $this->listModel = 'sys_lists';
        $this->careerModel = 'sys_careers';
        $this->messageModel = 'sys_messages';
        $this->photoModel = 'sys_photos';
    }
    
    /**
     * View
     */
    public function view() {
        $this->layout->set_layout_dir('views/frontend/layouts/');
        $this->layout->set_layout('tgs');

        $logo = $this->db->select('title, sub, background')
            ->from($this->sliderModel)
            ->where('deleted', 0)
            ->where('kind', 'logo')
            ->order_by('sort', 'asc')
            ->get()
            ->row()
        ;
        $this->session->set_userdata('logo', $logo);

        $team = $this->db->select('title, sub, background')
            ->from($this->sliderModel)
            ->where('deleted', 0)
            ->where('kind', 'team')
            ->order_by('sort', 'asc')
            ->get()
            ->row()
        ;

        $sliders = $this->db->select('title, sub, background')
            ->from($this->sliderModel)
            ->where('deleted', 0)
            ->where('kind', 'slider')
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;

        $designs = $this->db->select('kind, title, sub, background')
            ->from($this->designModel)
            ->where('deleted', 0)
            ->order_by('kind', 'asc')
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;

        $abouts = $this->db->select('kind, title, content, background')
            ->from($this->photoModel)
            ->where('deleted', 0)
            ->where('kind', 'introduction')
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;

        $designPros = $this->db->select('kind, title, content, background')
            ->from($this->photoModel)
            ->where('deleted', 0)
            ->where('kind', 'design_pro')
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;

        $customers = $this->db->select('kind, title, content, background')
            ->from($this->photoModel)
            ->where('deleted', 0)
            ->where('kind', 'customer')
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;

        $comments = $this->db->select('kind, title, content, background')
            ->from($this->photoModel)
            ->where('deleted', 0)
            ->where('kind', 'comment')
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;

        $intros = $this->db->select('icon, title, sub, content')
            ->from($this->listModel)
            ->where('deleted', 0)
            ->where('kind', 'intro')
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;

        $designServices = $this->db->select('icon, title, sub, content')
            ->from($this->listModel)
            ->where('deleted', 0)
            ->where('kind', 'design')
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;

        $technologyServices = $this->db->select('icon, title, sub, content')
            ->from($this->listModel)
            ->where('deleted', 0)
            ->where('kind', 'technology')
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;

        $careers = $this->db->select('employer_name, employer_position, employer_email, employer_facebook, employer_twitter, employer_youtube, employer_avatar, 
            employer_intro, employee_position, employee_skills')
            ->from($this->careerModel)
            ->where('deleted', 0)
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;
        if(!empty($careers)){
            foreach($careers as $index=>$career){
                $career->employee_skills = json_decode($career->employee_skills);
                $careers[$index] = $career;
            }
        }

        $data = array(
            'team' => $team,
            'sliders' => $sliders,
            'designs' => $designs,
            'start' => 1,
            'designServices' => $designServices,
            'technologyServices' => $technologyServices,
            'intros' => $intros,
            'careers' => $careers,
            'abouts' => $abouts,
            'designPros' => $designPros,
            'customers' => $customers,
            'comments' => $comments
        );

        $this->parser->parse($this->viewPath."view", $data);
    }

    /**
     * Contact
     */
    public function contact() {
        $this->layout->disable_layout();

        $pullClass = $this->input->post();
        $pullClass['created'] = date('y-m-d H:i:s', time());
        $pullClass['modified'] = date('y-m-d H:i:s', time());
        $result = $this->db->insert($this->messageModel, $pullClass);

        $response = new stdClass();
        $response->status = $result ? 1 : 0;

        $this->response($response);
    }
}
