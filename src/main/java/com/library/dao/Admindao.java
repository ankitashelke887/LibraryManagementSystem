package com.library.dao;

import java.util.List;

import com.library.dto.Admin;

public interface Admindao {
	
	void addadmin(Admin a);
	
	void updateadmin(Admin a);
	
	void deleteadmin(Integer adminId);
	
	List<Admin> getalladmin();
	
	Admin getbymailandpassword(String email,String password);

}
