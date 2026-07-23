package com.library.dao;

import java.util.List;

import com.library.dto.BookCopies;

public interface Bookcopiesdao {
	
	void addbookcopies(BookCopies bc);
	
	void updatebookcopies(BookCopies bc);
	
	void deletebookcopies(Integer copyId);
	
	List<BookCopies> getallbookcopies();
	
	BookCopies getbybookid(Integer bookId);

}
