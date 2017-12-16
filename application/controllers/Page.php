<?php

defined('BASEPATH') OR exit('No direct script access allowed');
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Page extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->library('layouts');
    }

    public function not_found() {
        
        $this->layouts->view('not_found',array(),FALSE);
    }
}