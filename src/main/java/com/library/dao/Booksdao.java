package com.library.dao;

import java.util.List;

import com.library.dto.Books;

public interface Booksdao {
	
	void addbook(Books b);
	
	void updatebook(Books b);
	
	void deletebook(Integer bookId);
	
	List<Books> getallbooks();
	
	Books getbytitleandcategoryid(String title, Integer categoryId);

}
