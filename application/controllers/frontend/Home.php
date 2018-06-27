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
    public function view($s1='home') {
//        if(!empty($s1)){
//            echo $s1; exit;
//        }
        $this->layout->set_layout_dir('views/frontend/layouts/');
        $this->layout->set_layout('tgs');

        $contact = $this->db->select('id, title, des, detail, photo, sort')
            ->from($this->metadataModel)
            ->where('deleted', 0)
            ->where('section', 99)
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;

        $metaTags = $this->db->select('id, title, des, detail, photo, sort')
            ->from($this->metadataModel)
            ->where('deleted', 0)
            ->where('section', 100)
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;

        $metaArticle = $this->db->select('id, title, des, detail, photo, sort')
            ->from($this->metadataModel)
            ->where('deleted', 0)
            ->where('section', 101)
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;
//        print_r($contact); exit;
        $metadata = array();
        $pages = $this->db->select('id, kind, section, title, des')
            ->from($this->pageModel)
            ->where('deleted', 0)
            ->where('page', $s1)
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;
        if(!empty($pages)){
            foreach($pages as $index=>$page){
                $section = $this->db->select('id, title, des, detail, photo, sort')
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
                        $image->data_sort = $item->sort;
                        array_push($images, $image);
                    }
                    $metadata[$page->section] = json_encode($images/*, JSON_UNESCAPED_UNICODE*/);
                }
            }
        }
        $style = $this->db->select('title, id, style, head, page')
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
            'metadata' => $metadata,
            'metacontact' => $contact,
            'metatag' => $metaTags,
            'metaarticle' => $metaArticle
        );

        $this->parser->parse($this->viewPath."view", $data);
    }

    /**
     * Shop
     */
    public function shop($s1='shop') {
        $this->layout->set_layout_dir('views/frontend/layouts/');
        $this->layout->set_layout('tgs');

        $contact = $this->db->select('id, title, des, detail, photo, sort')
            ->from($this->metadataModel)
            ->where('deleted', 0)
            ->where('section', 99)
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;

        $metaTags = $this->db->select('id, title, des, detail, photo, sort')
            ->from($this->metadataModel)
            ->where('deleted', 0)
            ->where('section', 100)
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;

        $metaArticle = $this->db->select('id, title, des, detail, photo, sort')
            ->from($this->metadataModel)
            ->where('deleted', 0)
            ->where('section', 101)
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;

        $metadata = array();
        $pages = $this->db->select('id, kind, section, title, des')
            ->from($this->pageModel)
            ->where('deleted', 0)
            ->where('page', $s1)
            ->order_by('sort', 'asc')
            ->get()
            ->result()
        ;
        if(!empty($pages)){
            foreach($pages as $index=>$page){
                $section = $this->db->select('id, title, des, detail, photo, sort')
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
                        $image->attachment_id = $item->id;
                        array_push($images, $image);
                    }
                    $metadata[$page->section] = json_encode($images/*, JSON_UNESCAPED_UNICODE*/);
                }
            }
        }
        $style = $this->db->select('title, id, style, head, page')
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
            'metadata' => $metadata,
            'metacontact' => $contact,
            'metatag' => $metaTags,
            'metaarticle' => $metaArticle
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
        $style = $this->db->select('title, id, style, head, page')
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
     * Product
     */
    public function news($string=null) {
        if(empty($string)){
            redirect(base_url()); exit;
        }
        $ids = explode('-', $string);
        $id = $ids[count($ids)-1];

        $this->layout->set_layout_dir('views/backend/layouts/');
        $this->layout->set_layout('tgs');

        $product = $this->db->select('id, title, des, detail, photo')
            ->from($this->metadataModel)
            ->where('deleted', 0)
            ->where('id', $id)
            ->order_by('sort', 'asc')
            ->get()
            ->row()
        ;
        $style = $this->db->select('title, id, style, head, page')
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

        $this->parser->parse($this->viewPath."news", $data);
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
