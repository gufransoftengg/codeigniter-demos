<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * Description of search_model
 *
 * @author Gufran
 */
class search_model extends CI_Model {

    function search_view($row) {
        $st_name = $this->session->userdata('search_word');
        $conditions = array();
        if (!empty($st_name)) {
            $conditions[] = 'searchpaging.name  LIKE "%' . $st_name . '%"';
            $conditions[] = 'searchpaging.descrip  LIKE "%' . $st_name . '%"';
            $conditions[] = 'searchpaging.FileName  LIKE "%' . $st_name . '%"';
            $sqlStatement = "SELECT * FROM searchpaging WHERE " . implode(' OR ', $conditions) . " LIMIT $row,10";
            $result = $this->db->query($sqlStatement)->result_array();
        } else {
            $result = '';
        }

        return $result;
    }

    function search_counter() {
        $st_name = $this->session->userdata('search_word');

        $conditions = array();
        if (!empty($st_name)) {
            $conditions[] = 'searchpaging.name  LIKE "%' . $st_name . '%"';
            $conditions[] = 'searchpaging.descrip  LIKE "%' . $st_name . '%"';
            $conditions[] = 'searchpaging.FileName  LIKE "%' . $st_name . '%"';
            $sqlStatement = "SELECT * FROM searchpaging WHERE " . implode(' OR ', $conditions) . " ORDER BY id";
            $result = $this->db->query($sqlStatement)->num_rows();
        } else {
            $result = '';
        }
        return $result;
    }

}
