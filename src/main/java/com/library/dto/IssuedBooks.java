package com.library.dto;

import java.sql.Date;

public class IssuedBooks {
    
	    private int issueId;
	    private int userId;
	    private int copyId;
	    private Date issueDate;
	    private Date dueDate;
	    private Date returnDate;
	    private String status;
	    private Double fineAmount;

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

		public int getCopyId() {
			return copyId;
		}

		public void setCopyId(int copyId) {
			this.copyId = copyId;
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

		public Double getFineAmount() {
			return fineAmount;
		}

		public void setFineAmount(Double fineAmount) {
			this.fineAmount = fineAmount;
		}
		
		

}
