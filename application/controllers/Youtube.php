<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Youtube extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function index($user=null,$country=null)
    {
		$data = array(
				'user'=> $user,
				'country' => $country
		);
		
		$this->load->view('youtube',$data);
	
	}
}