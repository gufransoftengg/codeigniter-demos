<?php

defined('BASEPATH') OR exit('No direct script access allowed');
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Agency extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('layouts');
        $this->load->model('agency_model');
        $this->layouts->add_include('js/jquery.min.js')
                ->add_include('css/custom.css')
                ->add_include('js/custom.js');
        
        //$this->lang->load('message','arabic');
    }

    public function index($user=null) {
        if(empty($user)){
            redirect('home');
        }
        $user_data = $this->agency_model->get_user_details($user);
       // print_r($user_data);
        $this->layouts->set_title('Welcome to '.$user_data['page_name']);
        $this->data['content'] = $user_data['page_description'].' '.$this->lang->line('welcome_message');
        $this->layouts->view('home', $this->data, TRUE, array('latest' => 'sidebar/latest'));
    }

    public function dbtest(){
        $this->layouts->set_title('Welcome to DBTest Page');
        $this->data['content'] = 'Content Section';
        $this->layouts->view('home', $this->data, TRUE);
    }
}
