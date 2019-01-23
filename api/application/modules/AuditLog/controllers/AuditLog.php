<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class AuditLog extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('AuditLog_model');
		include APPPATH . 'vendor/firebase/php-jwt/src/JWT.php';
	}

	public function getLoginLog()
	{
		$data=$this->AuditLog_model->getLoginLog();
		if($data){
			echo json_encode($data);
		}else{
			return false;
		}
	}
}	

?>