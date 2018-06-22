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
class Backend extends MY_Controller {

	private $class;
	private $viewPath;

    private $pageModel;
	private $styleModel;
    private $metadataModel;

    function __construct() {
        parent::__construct(true);
        $this->load->helper('leon');
        $this->class = strtolower(get_class());
        $this->viewPath = 'frontend/home/';
        $this->pageModel = 'sys_pages';
        $this->styleModel = 'sys_styles';
        $this->metadataModel = 'sys_metadata';
    }
    
    /**
     * View
     */
    public function view($s1='') {
        if(!empty($s1)){
//            echo $s1; exit;
        }
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
                if($page->kind !== 'photo'){
                    $metadata[$page->section] = $section;
                } else{
                    $images = array();
                    foreach($section as $idx=>$item){
                        $image = new stdClass();
                        $image->url = $item->photo;
                        $image->thumbnail_url = $item->photo;
                        $image->width = 538;
                        $image->height = 720;
                        $image->caption_1 = $item->des;
                        $image->caption_2 = null;
                        $image->tags = new stdClass();
                        $image->link_url = null;
                        $image->slug = $page->section.$idx;
                        $image->meta = null;
                        $image->lightbox_url = $item->photo;
                        $image->lightbox_caption_1 = $item->des;
                        $image->lightbox_caption_2 = null;
                        $image->link_attr = new stdClass();
                        $image->options = null;
                        $image->attachment_id = null;
                        $image->data_section = $page->section;
                        $image->data_id = $item->id;
                        array_push($images, $image);
                    }
                    $metadata[$page->section] = json_encode($images/*, JSON_UNESCAPED_UNICODE*/);
                }
            }
        }
        $style = $this->db->select('style')
            ->from($this->styleModel)
            ->where('deleted', 0)
            ->where('page', 'home')
            ->get()
            ->row()
        ;
//        print_r($style); exit;

//        print_r($metadata); exit;

        $data = array(
            'style' => $style,
            'pages' => $pages,
            'metadata' => $metadata
        );

        $this->parser->parse($this->viewPath."view", $data);
    }

    /**
     * Shop
     */
    public function shop($s1='shop') {
        $this->layout->set_layout_dir('views/frontend/layouts/');
        $this->layout->set_layout('tgs');

        $metadata = array();
        $pages = $this->db->select('kind, section, title, des')
            ->from($this->pageModel)
            ->where('deleted', 0)
            ->where('page', $s1)
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;
        if(!empty($pages)){
            foreach($pages as $index=>$page){
                $section = $this->db->select('id, title, des, detail, photo')
                    ->from($this->metadataModel)
                    ->where('deleted', 0)
                    ->where('section', $page->section)
                    ->order_by('sort', 'asc')
                    ->get()
                    ->result()
                ;
                if($page->kind !== 'photo'){
                    $metadata[$page->section] = $section;
                } else{
                    $images = array();
                    foreach($section as $idx=>$item){
                        $image = new stdClass();
                        $image->url = $item->photo;
                        $image->thumbnail_url = $item->photo;
                        $image->width = 538;
                        $image->height = 720;
                        $image->caption_1 = $item->des;
                        $image->caption_2 = null;
                        $image->tags = new stdClass();
                        $image->link_url = null;
                        $image->slug = $page->section.$idx;
                        $image->meta = null;
                        $image->lightbox_url = $item->photo;
                        $image->lightbox_caption_1 = $item->des;
                        $image->lightbox_caption_2 = null;
                        $image->link_attr = new stdClass();
                        $image->options = null;
                        $image->attachment_id = null;
                        $image->data_section = $page->section;
                        $image->data_id = $item->id;
                        array_push($images, $image);
                    }
                    $metadata[$page->section] = json_encode($images/*, JSON_UNESCAPED_UNICODE*/);
                }
            }
        }
        $style = $this->db->select('style, title')
            ->from($this->styleModel)
            ->where('deleted', 0)
            ->where('page', $s1)
            ->get()
            ->row()
        ;
//        print_r($style); exit;

//        print_r($metadata); exit;

        $data = array(
            'style' => $style,
            'pages' => $pages,
            'metadata' => $metadata
        );

        $this->parser->parse($this->viewPath."view", $data);
    }

    /**
     * Product
     */
    public function product($string=null) {
        if(empty($string)){
            redirect(base_url()); exit;
        }
        $ids = explode('-', $string);
        $id = $ids[count($ids)-1];

        $this->layout->set_layout_dir('views/frontend/layouts/');
        $this->layout->set_layout('tgs');

        $product = $this->db->select('id, title, des, detail, photo')
            ->from($this->metadataModel)
            ->where('deleted', 0)
            ->where('id', $id)
            ->order_by('sort', 'asc')
            ->get()
            ->row()
        ;
        $style = $this->db->select('style, title')
            ->from($this->styleModel)
            ->where('deleted', 0)
            ->where('page', 'shop')
            ->get()
            ->row()
        ;
        $product->url = $string;

        $data = array(
            'style' => $style,
            'product' => $product
        );

        $this->parser->parse($this->viewPath."product", $data);
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
