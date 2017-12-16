<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Description of Search
 *
 * @author Gufran
 */
class Search extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $this->data['title'] = 'CodeIgniter Search Example';
        $this->load->model('search_model');
        $st_name = $this->input->post('st_name');
// save search word in the session to use it with highlight jquery library in results
        $this->session->set_tempdata("search_word", "$st_name");

        //  echo 'if no input fields';
        if ($st_name == NULL) {
            // if no pagination and new empty search redirect
            $this->session->set_flashdata('notice_msg', 'Sorry you should use at least One word to Search');
            redirect('search/no_data/');
        } else {
            // drop first - create new - paginate view
            $this->paginate_view();
        }
        $this->load->view('results', $this->data);
    }

    public function convert(){
        
        $this->load->library('CurrencyConverter');
        $this->CurrencyConverter = new CurrencyConverter();
        $amount = '64.50';
        $result = $this->CurrencyConverter->convert( 'INR','USD', $amount, 1, 1);
        
        echo 'V: '.$result;
    }

        protected function paginate_view($row = 0) {

        // print session
        $this->load->library('pagination');
        $config['base_url'] = base_url() . "search";
        $config['total_rows'] = $this->search->search_counter();
        $config['per_page'] = '10';
        $config['uri_segment'] = 4;
        $config['full_tag_open'] = '<ul class="pagination">';
        $config['full_tag_close'] = '</ul>';
        $config['first_link'] = false;
        $config['last_link'] = false;
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['prev_link'] = '&laquo';
        $config['prev_tag_open'] = '<li class="prev">';
        $config['prev_tag_close'] = '</li>';
        $config['next_link'] = '&raquo';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="active"><a href="#">';
        $config['cur_tag_close'] = '</a></li>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $this->pagination->initialize($config);
        $data['row'] = $row;
        $data['total_rows'] = $this->search->search_counter();
        $data['links'] = $this->pagination->create_links();
        $data['result1'] = $this->search->search_view($row);
        $data['no_results'] = '';
        if (!$data['result1']) {
            $data['no_results'] = TRUE;
        } else {
            $data['no_results'] = FALSE;
        }
        $this->view('results', $data);
    }

}
