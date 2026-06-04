package com.library.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="book")
public class Book {
	  @Id
	    private int bookId;

	    public int getBookId() {
		return bookId;
	}
	  public void setBookId(int bookId) {
		  this.bookId = bookId;
	  }
	  public String getBookName() {
		  return bookName;
	  }
	  public void setBookName(String bookName) {
		  this.bookName = bookName;
	  }
	  public String getAuthor() {
		  return author;
	  }
	  public void setAuthor(String author) {
		  this.author = author;
	  }
	  public double getPrice() {
		  return price;
	  }
	  public void setPrice(double price) {
		  this.price = price;
	  }
		private String bookName;
	    private String author;
	    private double price;
}
