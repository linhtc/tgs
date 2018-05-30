<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once(APPPATH.'controllers/frontend/Home.php');  

class Welcome extends Home {
	
    public function index() {
    	$this->view();
    }

}
