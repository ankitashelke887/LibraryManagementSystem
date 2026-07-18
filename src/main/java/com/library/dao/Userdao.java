package com.library.dao;

import java.util.List;

import com.library.dto.Users;

public interface Userdao {
	
	void adduser(Users u);
	
	void updateuser(Users u);
	
	void deleteuser(Integer userId);
	
	List<Users> getallusers();
	
	Users getbymailandpassword(String email, String password);

}
