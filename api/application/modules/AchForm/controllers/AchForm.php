<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class AchForm extends CI_Controller {

    public function __construct(){
        parent::__construct();
        
  	 	$this->load->model('Adddata_model');
       
    }
	public function index()
	{
       
          $this->load->view('AchForm');
        
     }
  
    function check_filetype()
    {
       if(isset($_FILES['pan_card']['name']) && $_FILES['pan_card']['name']!=""){
    
            $pancard = $this->input->post('pan_card');
            $file_name = $_FILES['pan_card']['name'];

            $docFileType = strtolower(pathinfo($file_name,PATHINFO_EXTENSION));

            if($docFileType != "png" && $docFileType != "pdf" && $docFileType != "jpeg" && $docFileType != "jpg") {
            $this->form_validation->set_message('check_filetype','Please select only pdf/jpeg/jpg/png file.');
            return false;
            }
            

        }

         if(isset($_FILES['address_proof']['name']) && $_FILES['address_proof']['name']!=""){
    
            $pancard = $this->input->post('address_proof');
            $file_name = $_FILES['address_proof']['name'];

            $docFileType = strtolower(pathinfo($file_name,PATHINFO_EXTENSION));

            if($docFileType != "png" && $docFileType != "pdf" && $docFileType != "jpeg" && $docFileType != "jpg") {
            $this->form_validation->set_message('check_filetype','Please select only pdf/jpeg/jpg/png file.');
            return false;
            }

        } 
    }
    public function validate()
    {
        
        $this->form_validation->set_rules('first_name','FirstName','required|alpha',
        array(
           
            'required'     => 'First Name is required.',
            'alpha'     => 'First Name is not allowed special characters.'
           
            ));
        $this->form_validation->set_rules('last_name','LastName','required|alpha',
        array(
           
            'required'     => 'Last Name is required.',
            'alpha'     => 'Last Name is not allowed special characters.'
           
            )
        );
        $this->form_validation->set_rules('home_address','HomeAddress','required',
        array(
           
            'required'     => 'Home Address is required.',
           
            )
        );

        $this->form_validation->set_rules('phone','Phone','required|min_length[10]|max_length[10]|integer',
        array(
           
            'required'     => 'Phone Number is required.',
            'min_length' => 'Phone Number  must be at least 10 characters in length.',
            'max_length' =>  'Phone Number cannot exceed 10 characters in length.',
            'integer' =>  'Phone Number not allowed special characters.'
           
            )
        );
        $this->form_validation->set_rules('email','Email','required|valid_email',
        array(

            'required'     => 'Email is required.',
            'valid_email'     => 'Please enter valid email.'
          )
    );
        
        $this->form_validation->set_rules('bank_name','BankName','required',
        array(
           
            'required'     => 'Bank Name is required.',
           
           )
        );
        $this->form_validation->set_rules('bank_address','BankAddress','required',
        array(
           
            'required'     => 'Bank Name is required.',
            )
        );

        $this->form_validation->set_rules('bank_acno','BankAcno','required|min_length[8]|max_length[18]|integer',
        array(
            'required'     => 'Bank Account Number is required.',
            'min_length'     => 'Bank account number should be minimum 8.',
            'max_length'     => 'Bank account should be minimum 18.',
            'integer'     => 'Bank account number should be only number'
            )

    );
        $this->form_validation->set_rules('ifsc_code','IFSC Code','required|min_length[11]|max_length[11]',
        array(
           
            'required'     => 'IFSC code is required.',
            'min_length' => 'IFSC code must be at least 11 characters in length.',
            'max_length' => 'IFSC code cannot exceed 11 characters in length.'
           
            )
        );
        $this->form_validation->set_rules('actype','Account type','required',
        array(
           
            'required'     => 'Account Type is required.',
           
            )
        );
        $this->form_validation->set_rules('bank_phone','BankPhone','required|min_length[10]|max_length[10]',
        array(
           
            'required'     => 'Bank Phone Number is required.',
            'min_length' => 'Bank Phone Number  must be at least 10 characters in length.',
            'max_length' => 'Bank Phone Number cannot exceed 10 characters in length.'
           
            )
        );
        $uploads_dir = 'pancard_data/';
        if(isset($_FILES['pan_card']['name']) && $_FILES['pan_card']['name']!=""){
    
            $pancard = $this->input->post('pan_card');
            $file_name = $_FILES['pan_card']['name'];

            $docFileType = strtolower(pathinfo($file_name,PATHINFO_EXTENSION));
       
            if($docFileType != "png" && $docFileType != "pdf" && $docFileType != "jpeg" && $docFileType != "jpg") {
                $this->form_validation->set_rules('pan_card','PAN card','callback_check_filetype');
            }
           
        }
        else
        {
          
        $this->form_validation->set_rules('pan_card','PAN card','required',
            array(
               
                'required'     => 'PAN card is required.',
               
                )
            );
        }

        if(isset($_FILES['address_proof']['name']) && $_FILES['address_proof']['name']!=""){
    
            $pancard = $this->input->post('address_proof');
            $file_name = $_FILES['address_proof']['name'];
            
            $docFileType = strtolower(pathinfo($file_name,PATHINFO_EXTENSION));
          //  echo $docFileType; exit();
 
 
            if($docFileType != "png" && $docFileType != "pdf" && $docFileType != "jpeg" && $docFileType != "jpg") {
                 $this->form_validation->set_rules('address_proof','Address proof','callback_check_filetype');
             }
           
        }
        else
        {
       
        $this->form_validation->set_rules('address_proof','Address proof','required',
              array(
                 
                  'required'     => 'Address proof is required.',
                 
                  )
              ); 
        
        }
       $this->form_validation->set_error_delimiters('<span class="error_span">', '</span>');

        if($this->form_validation->run() == FALSE)
        {
            redirect(base_url().'AchForm');
        }
        else{
      
        try{
           
           if($this->input->post()) {
           
            $uploads_dir ='pancard_data/';
           
            if(isset($_FILES['pan_card'])){
        
             $file_name = $_FILES['pan_card']['name'];
             $file_size =$_FILES['pan_card']['size'];
             $file_tmp =$_FILES['pan_card']['tmp_name'];
             $file_type=$_FILES['pan_card']['type'];
          
            
                     if( move_uploaded_file($file_tmp,$uploads_dir.$file_name))
                     {
                         $path = "$uploads_dir$file_name";
                         //echo "Success";
                     }
                     else
                     {
                         return false;
                     }
                    
             }

             /*uploading address proof */
         
          $address_proof_uploads_dir ='address_proof_data/';
   
          if(isset($_FILES['address_proof'])){
            
            $address_file_name = $_FILES['address_proof']['name'];
            $address_file_size =$_FILES['address_proof']['size'];
            $address_file_tmp =$_FILES['address_proof']['tmp_name'];
            $address_file_type=$_FILES['address_proof']['type'];
         
                if(move_uploaded_file($address_file_tmp,$address_proof_uploads_dir.$address_file_name))
                {
                    $addresspath = "$address_proof_uploads_dir$address_file_name";
                    
                }
                else
                {
                    return false;
                }
            
           } 

           $user=array(
            'firstname'=>trim($this->input->post('first_name')),
            'lastname'=>trim($this->input->post('last_name')),
            'homeaddress'=>trim($this->input->post('home_address')),
            'phone'=>trim($this->input->post('phone')),
            'email'=>trim($this->input->post('email')),
            'pancard'=> $path,
            'address_proof'=> $addresspath,
            'bankname'=>trim($this->input->post('bank_name')),
            'bankaddress'=>trim($this->input->post('bank_address')),
            'bankacno'=>trim($this->input->post('bank_acno')),
            'ifsc_code'=>trim($this->input->post('ifsc_code')),
            'account_type'=>trim($this->input->post('actype')),
            'bank_phone'=>trim($this->input->post('bank_phone'))
              );

              if($user)
              {
                  $this->Adddata_model->addData($user);
  
                  $this->session->set_flashdata('record','Record Saved.');

                  $db_error = $this->db->error();
                  if(!empty($db_error) && !empty($db_error['code']))
                  {
                      throw new Exception('Database Error ! Error Code :[' . $db_error['code'] . '] Error: ' . $db_error['message']);
                      return false;
                  }
                  redirect(base_url().'Ach_List');
              }
              else
              {
                  return false;
              }

            }
        }
        catch(Exception $e){
            trigger_error($e->getMessage(),E_USER_ERROR);
        }
           
          
    } 
        
    }
    
}
?>
