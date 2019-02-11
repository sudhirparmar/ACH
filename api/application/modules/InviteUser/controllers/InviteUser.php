<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use \Firebase\JWT\JWT;

class InviteUser extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('InviteUser_model');
		include APPPATH . 'vendor/firebase/php-jwt/src/JWT.php';
	}

	public function getUserData()
	{
		$data=$this->InviteUser_model->getUserData();
		if($data){
			echo json_encode($data);
		}else{
			echo json_encode('error');
		}
	}
	public function getBankDetails()
	{
		$post_data= json_decode(trim(file_get_contents('php://input')), true);
		if ($post_data)
		{
			$data=$this->InviteUser_model->getBankDetails($post_data);			
			echo json_encode($data);
		}		
	}
	public function getAddressDetails()
	{
		$post_data= json_decode(trim(file_get_contents('php://input')), true);
		if ($post_data)
		{
			$data=$this->InviteUser_model->getAddressDetails($post_data);			
			echo json_encode($data);
		}		
	}
	
	public function getUserInvitationList()
	{
		$data=$this->InviteUser_model->getUserInvitationList();
		if($data){
			echo json_encode($data);
		}else{
			echo json_encode('error');
		}
	}
	public function RevokeUser()
	{
		$data = json_decode(trim(file_get_contents('php://input')), true);
		if ($data) {
			
				$result = $this->InviteUser_model->RevokeUser($data); 
				if($result) {
					echo json_encode($data);	
				}
			}
			else {
			echo "no data";
			return false;
			}		
	}
	
	public function isActiveChange()
	{
		$data = json_decode(trim(file_get_contents('php://input')), true);
		if ($data) {
			
				$result = $this->InviteUser_model->isActiveChange($data); 
				if($result) {
					echo json_encode($data);	
				}
			}
			else {
			echo "no data";
			return false;
			}		
	}
	public function ReInviteUser()
	{
		$data = json_decode(trim(file_get_contents('php://input')), true);		
		if ($data) {
			$chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			$password = "";
			for ($i = 0; $i < 8; $i++) {
				$password .= $chars[mt_rand(0, strlen($chars)-1)];
			}			
			$data['Password']= $password;

			$result = $this->InviteUser_model->ReInviteUser($data);

			if($result) {
				$UserId=$result;
				$this->db->select('tu.UserId, CONCAT(tu.FirstName, " ", tu.LastName) as UserName, tu.EmailAddress');
				$this->db->where('tu.UserId',$UserId);
				$data = $this->db->get('tbluser as tu');
				foreach($data->result() as $row) {
					$UserName = $row->UserName;
					$EmailAddress = $row->EmailAddress;
				}

				$config['protocol'] = SMTP_PROTOCOL;
				$config['smtp_host'] = SMTP_HOST;
				$config['smtp_port'] = SMTP_PORT;
				$config['smtp_user'] = SMTP_EMAIL;
				$config['smtp_pass'] = SMTP_PASSWORD;  //sender's password
				$config['mailtype'] = 'html';
				$config['charset'] = 'iso-8859-1';
				$config['newline']="\r\n";
				$config['wordwrap'] = 'TRUE';

				$loginpath = BASE_URL.'/login/';
				$subject = 'OpenEyes Software Soluations - Invitation';
				$message = '
					<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px">
						<tbody>
							<tr>
								<td style="background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center"><img alt="" style="width:130px" src="https://devbyopeneyes.com/emailer_images/oess.png" /></td>
							</tr>
							<tr>
								<td style="border-width:0; padding:20px 10px 10px 10px; text-align:center">
								<p style="color:#000; font-size: 25px; line-height: 25px; font-weight: bold;padding: 0; margin: 0 0 10px;">Welcome, <strong>'.$UserName.'!</strong></p>

								<p style="color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;">Find your login credential for ACH below:</p>

								<table border="0" cellpadding="0" cellspacing="0" style="margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;">
									<tbody>
										<tr>
											<td style="padding:5px; text-align:right; width:35%">Login Id</td>
											<td style="padding:5px; text-align:center; width:4%">:</td>
											<td style="padding:5px; text-align:left; width:48%">'.$EmailAddress.'</td>
										</tr>
										<tr>
											<td style="padding:5px; text-align:right; width:35%">Password</td>
											<td style="padding:5px; text-align:center; width:4%">:</td>
											<td style="padding:5px; text-align:left; width:48%">'.$password.'</td>
										</tr>
									</tbody>
								</table>
								<p style="color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;">Use the button below to access your account:</p>
								</td>
							</tr>
							<tr>
								<td style="border-width:0; padding:0; text-align:center; vertical-align:middle">
								<table border="0" cellpadding="0" cellspacing="0" style="border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto">
									<tbody>
										<tr>
											<td style="background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px"><a href="'.$loginpath.'" style="color:#fff; text-decoration:none;">Login to Account</a></td>
										</tr>
									</tbody>
								</table>
								</td>
							</tr>
							<tr>
								<td style="border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle">
									<p style="color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href="'.$loginpath.'" style="cursor:pointer;">click here</a></p>
								</td>
							</tr>
							<tr>
								<td style="background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center">Copyright &copy; 2019 OpenEyes Software Solutions</td>
							</tr>
						</tbody>
					</table>
					';
				$this->email->initialize($config); 
				$this->email->from(FROM_EMAIL,FROM_USER);
				$this->email->to($EmailAddress);
				$this->email->subject($subject);
				$this->email->message($message);
				if($this->email->send()){
					$email_log = array(
						'From' => SMTP_EMAIL,
						'To' => $EmailAddress,
						'Subject' => $subject,
						'MessageBody' => $message,
					);
					$res = $this->db->insert('tblemaillog',$email_log);
					echo json_encode("success");
				}else{
					return false;
				}
			} else {				
				echo json_encode("email duplicate");
			}										
		}
	}
	
	public function userInvite() {
								
		$post_Invitation = json_decode(trim(file_get_contents('php://input')), true);		
		if ($post_Invitation) {
			$chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			$password = "";
			for ($i = 0; $i < 8; $i++) {
				$password .= $chars[mt_rand(0, strlen($chars)-1)];
			}			
			$post_Invitation['Password']= $password;

			$result = $this->InviteUser_model->userInvite($post_Invitation);

			if($result) {

				$UserId=$result;
				$this->db->select('tu.UserId, CONCAT(tu.FirstName, " ", tu.LastName) as UserName, tu.EmailAddress');
				$this->db->where('tu.UserId',$UserId);
				$data = $this->db->get('tbluser as tu');
				foreach($data->result() as $row) {
					$UserName = $row->UserName;
					$EmailAddress = $row->EmailAddress;
				}

				$config['protocol'] = SMTP_PROTOCOL;
				$config['smtp_host'] = SMTP_HOST;
				$config['smtp_port'] = SMTP_PORT;
				$config['smtp_user'] = SMTP_EMAIL;
				$config['smtp_pass'] = SMTP_PASSWORD;  //sender's password
				$config['mailtype'] = 'html';
				$config['charset'] = 'iso-8859-1';
				$config['newline']="\r\n";
				$config['wordwrap'] = 'TRUE';

				$loginpath = BASE_URL.'/login/';
				$subject = 'OpenEyes Software Soluations - Invitation';
				$message = '
					<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px">
						<tbody>
							<tr>
								<td style="background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center"><img alt="" style="width:130px" src="https://devbyopeneyes.com/emailer_images/oess.png" /></td>
							</tr>
							<tr>
								<td style="border-width:0; padding:20px 10px 10px 10px; text-align:center">
								<p style="color:#000; font-size: 25px; line-height: 25px; font-weight: bold;padding: 0; margin: 0 0 10px;">Welcome, <strong>'.$UserName.'!</strong></p>

								<p style="color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;">Find your login credential for ACH below:</p>

								<table border="0" cellpadding="0" cellspacing="0" style="margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;">
									<tbody>
										<tr>
											<td style="padding:5px; text-align:right; width:35%">Login Id</td>
											<td style="padding:5px; text-align:center; width:4%">:</td>
											<td style="padding:5px; text-align:left; width:48%">'.$EmailAddress.'</td>
										</tr>
										<tr>
											<td style="padding:5px; text-align:right; width:35%">Password</td>
											<td style="padding:5px; text-align:center; width:4%">:</td>
											<td style="padding:5px; text-align:left; width:48%">'.$password.'</td>
										</tr>
									</tbody>
								</table>
								<p style="color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;">Use the button below to access your account:</p>
								</td>
							</tr>
							<tr>
								<td style="border-width:0; padding:0; text-align:center; vertical-align:middle">
								<table border="0" cellpadding="0" cellspacing="0" style="border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto">
									<tbody>
										<tr>
											<td style="background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px"><a href="'.$loginpath.'" style="color:#fff; text-decoration:none;">Login to Account</a></td>
										</tr>
									</tbody>
								</table>
								</td>
							</tr>
							<tr>
								<td style="border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle">
									<p style="color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href="'.$loginpath.'" style="cursor:pointer;">click here</a></p>
								</td>
							</tr>
							<tr>
								<td style="background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center">Copyright &copy; 2019 OpenEyes Software Solutions</td>
							</tr>
						</tbody>
					</table>
					';
				$this->email->initialize($config); 
				$this->email->from(FROM_EMAIL,FROM_USER);
				$this->email->to($EmailAddress);
				$this->email->subject($subject);
				$this->email->message($message);
				if($this->email->send()){
					$email_log = array(
						'From' => SMTP_EMAIL,
						'To' => $EmailAddress,
						'Subject' => $subject,
						'MessageBody' => $message,
					);
					$res = $this->db->insert('tblemaillog',$email_log);
					echo json_encode("success");
				}else{
					return false;
				}
			} else {				
				echo json_encode("email duplicate");
			}										
		}		
	}
}	

?>