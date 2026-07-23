package com.library.dto;

public class BookCopies {
    
	    private int copyId;
	    private int bookId;
	    private String location;
	    private String status;

	    public int getCopyId() {
	        return copyId;
	    }

	    public void setCopyId(int copyId) {
	        this.copyId = copyId;
	    }

	    public int getBookId() {
	        return bookId;
	    }

	    public void setBookId(int bookId) {
	        this.bookId = bookId;
	    }

	    public String getLocation() {
	        return location;
	    }

	    public void setLocation(String location) {
	        this.location = location;
	    }

	    public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	        this.status = status;
	    }

	}

