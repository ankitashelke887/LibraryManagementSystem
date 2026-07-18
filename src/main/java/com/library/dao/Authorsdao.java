package com.library.dao;

import java.util.List;

import com.library.dto.Authors;

public interface Authorsdao {
	
	void addauthors(Authors au);
	
	void updateauthor(Authors au);
	
	void deleteauthor(Integer authorId);
	
	List<Authors> getallauthors();
	
	Authors getbyname(String authorname);

}
