<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * 
 * @package Errors
 * 
 * 
 * @author Leon Tran <leon@agikigi.com>
 * @copyright (c) 2016, 500BITS
 * @link http://agikigi.com
 * @license MIT
 * @version beta.0.1
 */
class Errors extends MY_Controller {

    function __construct() {
        parent::__construct();
    }
    
    public function show_404bk() {
    	debug('show_404');
    }
    
    public function show_404() {
    	
//     	$this->layout->set_layout_dir('views/frontend/layouts/');
//     	$this->layout->set_layout('default');
    	$this->layout->disable_layout(); // disable layout
    	
    	$listCss = array(
    			'static/default/template/lightbox/css/lightbox.css',
    	);
    	$listJs = array(
    			'static/default/template/lightbox/js/lightbox.js',
    	);
    	
    	$data = array(
    			'listJs' => add_Js($listJs),
    			'listCss' => add_css($listCss)
    	);
    	
    	$this->parser->parse("frontend/error/view404", $data);
    }

}
