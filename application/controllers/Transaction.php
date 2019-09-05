<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

/**
 * Class : Transaction (TransactionController)
 * Transaction Class to control all transaction related operations.
 * @author : Harry Agustiana
 * @version : 1.0
 * @since : 02 September 2019
 */
class Transaction extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('transaction_model');
        $this->isLoggedIn();   
    }
    
    /**
     * This function used to load the first screen of the transaction
     */
    public function index()
    {
        $searchText = $this->security->xss_clean($this->input->post('searchText'));
        $data['searchText'] = $searchText;
        
        $this->load->library('pagination');
        
        $count = $this->transaction_model->transactionListingCount($searchText);

        $returns = $this->paginationCompress ( "transactionListing/", $count, 10 );
        
        $data['transactionRecords'] = $this->transaction_model->transactionListing($searchText, $returns["page"], $returns["segment"]);
        
        $this->global['pageTitle'] = 'KeuanganKu : Daftar Transaksi';
        
        $this->loadViews("transactions", $this->global, $data, NULL);
    }
    
    /**
     * This function is used to load the add new form
     */
    function addNew()
    {
        $this->global['pageTitle'] = 'Tambah Transaksi Baru | KeuanganKu';

        $this->loadViews("transactions/addNew", $this->global, NULL, NULL);
    }

    /**
     * This function is used to add new transaction to the system
     */
    function addNewTransaction()
    {
        $this->load->library('form_validation');
            
        $this->form_validation->set_rules('name','Nama / Judul','trim|required');
        $this->form_validation->set_rules('amount','Jumlah','required|numeric');
        $this->form_validation->set_rules('type','Tipe','required');
        $this->form_validation->set_rules('transDate','Tanggal','trim|required');
        
        if($this->form_validation->run() == FALSE)
        {
            $this->addNew();
        }
        else
        {
            $name = $this->security->xss_clean($this->input->post('name'));
            $description = $this->security->xss_clean($this->input->post('description'));
            $amount = $this->input->post('amount');
            $type = $this->input->post('type');
            $transDate = $this->security->xss_clean($this->input->post('transDate'));
            
            $transInfo = array('name'=>$name, 'description'=>$description, 'amount'=>$amount, 'type'=> $type, 'createdBy'=>$this->vendorId, 'transDate'=>date('Y-m-d',strtotime($transDate)));
            
            $this->load->model('transaction_model');
            $result = $this->transaction_model->addNewTransaction($transInfo);
            
            if($result > 0)
            {
                $this->session->set_flashdata('success', 'Transaksi baru telah berhasil tersimpan');
            }
            else
            {
                $this->session->set_flashdata('error', 'Transaksi gagal tersimpan');
            }
            
            redirect('transaction/add');
        }
    }

    /**
     * This function is used load transaction edit information
     * @param number $transactionId : Optional : This is transaction id
     */
    function editOld($transactionId = NULL)
    {
        if($transactionId == null)
        {
            redirect('transactionListing');
        }
        
        $data['transactionInfo'] = $this->transaction_model->getTransactionInfo($transactionId);
        
        $this->global['pageTitle'] = 'Ubah Transaksi | KeuanganKu';
        
        $this->loadViews("transactions/editOld", $this->global, $data, NULL);
    }

    /**
     * This function is used to edit the transaction information
     */
    function editTransaction()
    {
        $this->load->library('form_validation');
            
        $id = $this->input->post('id');
        
        $this->form_validation->set_rules('name','Nama / Judul','trim|required');
        $this->form_validation->set_rules('amount','Jumlah','required|numeric');
        $this->form_validation->set_rules('type','Tipe','required');
        $this->form_validation->set_rules('transDate','Tanggal','trim|required');
        
        if($this->form_validation->run() == FALSE)
        {
            $this->editOld($id);
        }
        else
        {
            $name = $this->security->xss_clean($this->input->post('name'));
            $description = $this->security->xss_clean($this->input->post('description'));
            $amount = $this->input->post('amount');
            $type = $this->input->post('type');
            $transDate = $this->security->xss_clean($this->input->post('transDate'));
            
            $transInfo = array('name'=>$name, 'description'=>$description, 'amount'=>$amount, 'type'=> $type, 'createdBy'=>$this->vendorId, 'transDate'=>date('Y-m-d',strtotime($transDate)));
            
            $result = $this->transaction_model->editTransaction($transInfo, $id);
            
            if($result == true)
            {
                $this->session->set_flashdata('success', 'Transaksi berhasil diperbaharui');
            }
            else
            {
                $this->session->set_flashdata('error', 'Transaksi gagal diperbaharui');
            }
            
            redirect('transactionListing');
        }
    }

    /**
     * This function is used to delete the transaction using transaction Id
     * @return boolean $result : TRUE / FALSE
     */
    function deleteTransaction()
    {
        $transactionId = $this->input->post('id');
            
        $result = $this->transaction_model->deleteTransaction($transactionId);
        
        if ($result > 0) { echo(json_encode(array('status'=>TRUE))); }
        else { echo(json_encode(array('status'=>FALSE))); }
    }

}

?>