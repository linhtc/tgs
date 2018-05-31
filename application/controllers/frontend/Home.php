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
    private $pageModel;
    private $metadataModel;
	
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

        $this->pageModel = 'sys_pages';
        $this->metadataModel = 'sys_metadata';
    }
    
    /**
     * View
     */
    public function view() {
        $this->layout->set_layout_dir('views/frontend/layouts/');
        $this->layout->set_layout('tgs');

        $metadata = array();
        $pages = $this->db->select('kind, section, title, des')
            ->from($this->pageModel)
            ->where('deleted', 0)
            ->where('page', 'home')
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;
        if(!empty($pages)){
            foreach($pages as $index=>$page){
                $section = $this->db->select('title, des, detail, photo')
                    ->from($this->metadataModel)
                    ->where('deleted', 0)
                    ->where('section', $page->section)
                    ->order_by('sort', 'asc')
                    ->get()
                    ->result()
                ;
                $metadata[$page->section] = $section;
            }
        }

//        print_r($metadata); exit;

        $data = array(
            'pages' => $pages,
            'metadata' => $metadata
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
