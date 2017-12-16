<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */

	public function index()
    {

        /* $fb_config = array(
            'appId'  => '796585017136532',
            'secret' => '520235122027c427b2a37aecc116608a'
        );

        $this->load->library('facebook', $fb_config);

        $user = $this->facebook->getUser();
			print_r($user);exit;
        if ($user) {
            try {
                $data['user_profile'] = $this->facebook
                    ->api('/me');
            } catch (FacebookApiException $e) {
                $user = null;
            }
        }

        if ($user) {
            $data['logout_url'] = $this->facebook
                ->getLogoutUrl();
        } else {
            $data['login_url'] = $this->facebook
                ->getLoginUrl();
        }

        $this->load->view('view',$data);
    } */
		$this->load->view('welcome_message');
	
}

	public function do_action($param=null){
			$segments = $this->uri->segment_array();
			print_r($segments);
			echo 'Param: '.$param;
			//$this->load->view('welcome_message');
	}

}