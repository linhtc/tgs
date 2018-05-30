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

    public function show_404() {
        $this->checkPermission();
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');
        $data = array();
        $this->parser->parse("admin/errors/show_404", $data);
    }
    
    public function show_500() {
        $this->checkPermission();
        $this->layout->set_layout_dir('views/admin/layouts/');
        $this->layout->set_layout('default');
        $data = array();
        $this->parser->parse("admin/errors/show_500", $data);
    }

}
