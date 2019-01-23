<?php

class Login_model extends CI_Model {

	public function check_login($data) {
		
		$this->db->select('AdminUserId,FirstName,LastName,EmailAddress');
		$this->db->from('tbladminuser');
		$this->db->where('EmailAddress',trim($data['EmailAddress']));
		$this->db->where('Password',md5(trim($data['Password'])));
		$this->db->where('IsActive',1);
		$this->db->limit(1);
		$query = $this->db->get();
		$res=$query->result();
		if ($query->num_rows() == 1) {
			$login_data = array(
				'UserId ' => trim($res[0]->AdminUserId),
				'LoginType' => 1
			);
			$res = $this->db->insert('tblloginlog',$login_data);
			return $query->result();
		} else {
			return false;
		}
	}	
	
}
