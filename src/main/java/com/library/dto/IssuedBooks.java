package com.library.dto;

import java.sql.Date;

public class IssuedBooks {
    
	 private int issueId;
	    private int userId;
	    private int bookId;
	    private Date issueDate;
	    private Date dueDate;
	    private Date returnDate;
	    private String status;

	    public IssuedBooks() {
	    }

	    public IssuedBooks(int issueId, int userId, int bookId,
	                       Date issueDate, Date dueDate,
	                       Date returnDate, String status) {
	        this.issueId = issueId;
	        this.userId = userId;
	        this.bookId = bookId;
	        this.issueDate = issueDate;
	        this.dueDate = dueDate;
	        this.returnDate = returnDate;
	        this.status = status;
	    }
}
