package com.library.dao;

import java.util.List;

import com.library.dto.IssuedBooks;

public interface IssuedBooksdao {
	
	void addissuedbook(IssuedBooks ib);
	
	void updateibooks(IssuedBooks ib);
	
	void deleteibooks(Integer issueId);
	
	List<IssuedBooks> getallibooks();
	
	IssuedBooks getbybookid(Integer bookId); 
	

}
