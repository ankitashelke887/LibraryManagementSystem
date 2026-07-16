package com.library.dto;

public class Books {
   
	private int bookId;
    private String title;
    private int authorId;
    private int categoryId;
    private int publisherId;
    private String isbn;
    private int publicationYear;
    private int quantity;

    public Books() {
    }

    public Books(int bookId, String title, int authorId, int categoryId,
                 int publisherId, String isbn, int publicationYear, int quantity) {
        this.bookId = bookId;
        this.title = title;
        this.authorId = authorId;
        this.categoryId = categoryId;
        this.publisherId = publisherId;
        this.isbn = isbn;
        this.publicationYear = publicationYear;
        this.quantity = quantity;
    }
}
