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

	    public int getIssueId() {
			return issueId;
		}

		public void setIssueId(int issueId) {
			this.issueId = issueId;
		}

		public int getUserId() {
			return userId;
		}

		public void setUserId(int userId) {
			this.userId = userId;
		}

		public int getBookId() {
			return bookId;
		}

		public void setBookId(int bookId) {
			this.bookId = bookId;
		}

		public Date getIssueDate() {
			return issueDate;
		}

		public void setIssueDate(Date issueDate) {
			this.issueDate = issueDate;
		}

		public Date getDueDate() {
			return dueDate;
		}

		public void setDueDate(Date dueDate) {
			this.dueDate = dueDate;
		}

		public Date getReturnDate() {
			return returnDate;
		}

		public void setReturnDate(Date returnDate) {
			this.returnDate = returnDate;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

}
