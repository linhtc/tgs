<?php

/**
 * Description of MY_Model
 *
 * @package Model of 500CISAN
 * @subpackage core
 * @author Leon Tran <leon@agikigi.com>
 * @copyright (c) 2016, 500BITS
 * @link http://agikigi.com
 * @license MIT
 * @version beta.0.1
 */
class MY_Model extends CI_Model {

    // main table on database
    protected $db_table = '';
    // require field
    protected $required_fields = array();
    // config cache
    protected $db_cache = FALSE;
    // config query pagination
    protected $paginator = array('limit' => 20);
    // count all query
    protected $count_record;

    function __construct() {
        parent::__construct();
    }

    /**
     * 
     * @param type $type
     * @param type $options
     * @return int
     */
    public function find($type = 'all', $options = array()) {

        // get select -> query
        if (isset($options['select']) && $options['select']) {
            $this->db->select($options['select']);
        } else {
            $this->db->select('*');
        }

        // get table join
        // inner join
        if (isset($options['join']) && !empty($options['join'])) {
            foreach ($options['join'] as $table => $cond) {
                $this->db->join($table, $cond);
            }
        }

        // left join
        if (isset($options['leftjoin']) && !empty($options['leftjoin'])) {
            foreach ($options['leftjoin'] as $table => $cond) {
                $this->db->join($table, $cond, 'left');
            }
        }

        // right join
        if (isset($options['rightjoin']) && !empty($options['rightjoin'])) {
            foreach ($options['rightjoin'] as $table => $cond) {
                $this->db->join($table, $cond, 'right');
            }
        }

        // from table
        if (isset($options['from']) && $options['from']) {
            $this->db->from($options['from']);
        } else {
            $this->db->from($this->db_table);
        }

        // where
        if (isset($options['where']) && !empty($options['where'])) {
            $this->db->where($options['where']);
        }

        //where wild
        if (isset($options['where_wild']) && !empty($options['where_wild'])) {
            foreach ($options['where_wild'] as $key => $opt) {
                $this->db->where($key, $opt, FALSE);
            }
        }

        // wherefalse
        if (!empty($options['wherefalse'])) {
            $wherefalses = $options['wherefalse'];
            foreach ($wherefalses as $key_wherefalse => $value_wherefalse) {
                $this->db->where($key_wherefalse, $value_wherefalse, FALSE);
            }
        }

        // or
        if (!empty($options['or'])) {
            $this->db->or_where($options['or']);
        }

        // where in
        if (isset($options['where_in']) && !empty($options['where_in'])) {
            foreach ($options['where_in'] as $key => $key_value) {
                $this->db->where_in($key, $key_value);
            }
        }

        // where not in
        if (isset($options['where_not_in']) && !empty($options['where_not_in'])) {
            foreach ($options['where_not_in'] as $key => $key_value) {
                $this->db->where_not_in($key, $key_value);
            }
        }

        // where like
        if (isset($options['like']) && !empty($options['like'])) {
            foreach ($options['like'] as $key => $key_value) {
                // where put wildcard
                if (is_array($key_value)) {
                    $this->db->like($key, $key_value[0], $key_value[1]);
                } else {
                    $this->db->like($key, $key_value);
                }
            }
        }

        // where or_like by Kinh Luan
        if (isset($options['or_like']) && !empty($options['or_like'])) {
            foreach ($options['or_like'] as $key => $key_value) {
                // where put wildcard
                if (is_array($key_value)) {
                    $this->db->or_like($key, $key_value[0], $key_value[1]);
                } else {
                    $this->db->or_like($key, $key_value);
                }
            }
        }

        // count all result query
        if ($type == 'count') {
            if (!empty($options['count_all'])) {
                $this->db->select($options['count_all'] . ' AS count_all');
                $query = $this->db->get();
                if (isset($query->row()->count_all))
                    return $query->row()->count_all;
                else
                    return 0;
            } else {

                return $this->db->count_all_results();
                // return $this->db->
            }
        }

        // group by
        if (isset($options['groupby']) && !empty($options['groupby'])) {
            $this->db->group_by($options['groupby']);
        }

        // having
        if (isset($options['having']) && !empty($options['having'])) {
            $this->db->having($options['having']);
        }

        // order
        if (isset($options['order']) && !empty($options['order'])) {
            foreach ($options['order'] as $field_order => $type_order) {
                $this->db->order_by($field_order, $type_order);
            }
        }

        // limit
        if (isset($options['limit']) && $options['limit']) {
            if (isset($options['offset']) && $options['offset']) {
                $this->db->limit($options['limit'], $options['offset']);
            } else {
                $this->db->limit($options['limit']);
            }
        }

        // query
        $query = $this->db->get();

        // get result
        if ($query->num_rows() == 0) {
            return array();
        }

        switch ($type) {
            case 'first':
                return $query->row();
                break;

            case 'first_array':
                return $query->row_array();
                break;

            case 'list':
                return $this->changAllToList($query->result_array());
                break;

            case 'all':
                return $query->result_array();
                break;

            default:
                return array();
                break;
        }
    }

    /**
     * 
     * @param type $dataAll
     * @return boolean
     */
    public function create($dataAll) {
        $data = $dataAll;

        // check empty data
        if (empty($data)) {
            return FALSE;
        }

        $this->load->helper('date');

        // field default: created / modified / user_id
        $data['created'] = mdate('%Y-%m-%d %H:%i:%s', now());
        $data['modified'] = mdate('%Y-%m-%d %H:%i:%s', now());

        if (empty($data['user_id']) || $data['user_id'] < 0) {
            $data['user_id'] = $this->session->userdata('user_id');
        }

        // insert record
        if ($this->db->insert($this->db_table, $data)) {
            // get id
            $id = $this->db->insert_id();

            // get id
            return $id;
        }

        return FALSE;
    }

    

    /**
     * 
     * @param type $dataAll
     * @param type $where
     * @return boolean
     */
    public function update($dataAll, $where) {
        $data = $dataAll;

        // check empty data
        if (empty($data)) {
            return FALSE;
        }

        $this->load->helper('date');

        // update date modified
        $data['modified'] = mdate('%Y-%m-%d %H:%i:%s', now());

        // update data
        $this->db->where($where);
        $this->db->update($this->db_table, $data);

        return TRUE;
    }

}
