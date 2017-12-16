<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Agency_model extends CI_Model{
    //hold the table names
    private $pages;
            
    function __construct() {
        parent::__construct();
        $this->pages = 'pages';        
    }
    public function get_user_details($slug=null){
        
        $query = $this->db->get_where($this->pages, array('is_active'=> '1', 'page_slug'=>$slug));
        return $query->row_array();
    }
}