<?php

defined('BASEPATH') OR exit('No direct script access allowed');
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Home extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('layouts');
        
        $this->layouts->add_include('js/jquery.min.js')
                ->add_include('css/custom.css')
                ->add_include('js/custom.js');
    }

    public function index() {
        $this->layouts->set_title('Welcome to Qatar');
        $this->data['content'] = 'Content Section';
        $this->layouts->view('home', $this->data, TRUE, array('latest' => 'sidebar/latest'));
    }

    public function dbtest(){
        $this->layouts->set_title('Welcome to DBTest Page');
        $this->data['content'] = 'Content Section';
        $this->layouts->view('home', $this->data, TRUE);
    }
}
