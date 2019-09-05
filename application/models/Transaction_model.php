<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : Transaction_model (Transaction Model)
 * Transaction model class to get to handle transaction related data 
 * @author : Harry Agustiana
 * @version : 1.1
 * @since : 15 November 2016
 */
class Transaction_model extends CI_Model
{
    /**
     * This function is used to get the transaction listing count
     * @param string $searchText : This is optional search text
     * @return number $count : This is row count
     */
    function transactionListingCount($searchText = '')
    {
        $this->db->select('*');
        $this->db->from('tbl_transactions');
        if(!empty($searchText)) {
            $likeCriteria = "(name  LIKE '%".$searchText."%'
                            OR  description  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }
        $query = $this->db->get();
        
        return $query->num_rows();
    }

    /**
     * This function is used to get the transaction listing count
     * @param string $searchText : This is optional search text
     * @param number $page : This is pagination offset
     * @param number $segment : This is pagination limit
     * @return array $result : This is result
     */
    function transactionListing($searchText = '', $page, $segment)
    {
        $this->db->select('BaseTbl.id, BaseTbl.name, BaseTbl.description, BaseTbl.amount, BaseTbl.type, BaseTbl.transDate, BaseTbl.files, BaseTbl.createdBy, User.name as uname');
        $this->db->from('tbl_transactions as BaseTbl');
        $this->db->join('tbl_users as User', 'User.userId = BaseTbl.createdBy', 'left');
        if(!empty($searchText)) {
            $likeCriteria = "(BaseTbl.name  LIKE '%".$searchText."%'
                            OR  BaseTbl.description  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }
        $this->db->order_by('BaseTbl.transDate', 'DESC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
    }

    /**
     * This function is used to add new transaction to system
     * @return number $insert_id : This is last inserted id
     */
    function addNewTransaction($data)
    {
        $this->db->trans_start();
        $this->db->insert('tbl_transactions', $data);
        
        $insert_id = $this->db->insert_id();

        if (!empty($_FILES["files"]["name"])) {
            $file = $this->_uploadImage($insert_id);

            $this->db->where('id', $insert_id);
            $this->db->update('tbl_transactions', ['files' => $file]);
        }
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    /**
     * This function used to get transaction information by id
     * @param number $transactionId : This is transaction id
     * @return array $result : This is transaction information
     */
    function getTransactionInfo($userId)
    {
        $this->db->select('*');
        $this->db->from('tbl_transactions');
        $query = $this->db->get();
        
        return $query->row();
    }

    /**
     * This function is used to update the transaction information
     * @param array $data : This is transactions updated information
     * @param number $id : This is transaction id
     */
    function editTransaction($data, $id)
    {
        $this->db->trans_start();
        
        if (!empty($_FILES["files"]["name"])) {
            $file = $this->_uploadImage($id);
            $data['files'] = $file;
        }

        $this->db->where('id', $id);
        $this->db->update('tbl_transactions', $data);
        
        $this->db->trans_complete();
        
        return TRUE;
    }

    /**
     * This function is used to delete the transaction information
     * @param number $id : This is transaction id
     * @return boolean $result : TRUE / FALSE
     */
    function deleteTransaction($id)
    {
        $data = $this->db->where('id', $id)->get('tbl_transactions')->row();
        if (!empty($data->files)) {
            $related_files = $_SERVER["DOCUMENT_ROOT"] . '/assets/uploaded/receipts/' . $data->files;
        }

        $this->db->trans_start();

        $this->db->where('id', $id);
        $this->db->delete('tbl_transactions');

        if ($this->db->trans_status() !== FALSE)
        {
            $this->db->trans_commit();
            unlink($related_files);
        }
        
        return $this->db->affected_rows();
    }

    private function _uploadImage($id)
    {
        $config['upload_path']          = './assets/uploaded/receipts/';
        $config['allowed_types']        = 'gif|jpg|png';
        $config['file_name']            = $id;
        $config['overwrite']			= true;
        $config['max_size']             = 1024;

        $this->load->library('upload', $config);

        if ($this->upload->do_upload('files')) {
            return $this->upload->data("file_name");
        }
        
        return "default.jpg";
    }

}

  