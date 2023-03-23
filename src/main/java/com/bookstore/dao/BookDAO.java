package com.bookstore.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bookstore.entity.Book;

import jakarta.persistence.EntityManager;

public class BookDAO extends JpaDAO<Book> implements GenericDAO<Book> {

	public BookDAO() {
		super();
	}

	@Override
	public Book create(Book book) {
		book.setLastUpdateTime(new Date());
		return super.create(book);
	}

	@Override
	public Book update(Book book) {
		book.setLastUpdateTime(new Date());
		return super.update(book);
	}

	@Override
	public Book get(Object bookId) {
		return super.find(Book.class, bookId);
	}

	@Override
	public void delete(Object bookId) {
		super.delete(Book.class, bookId);
	}

	@Override
	public List<Book> listAll() {
		return super.findWithNameQuery("Book.findAll");
	}
	
	@Override
	public long count() {
		return super.countWithNameQuery("Book.countAll");
	}
	
	public List<Book> listNewBooks() {
		
		return super.findWithNameQuery("Book.listNew", 0, 4);
	}
	
	public Book findByTitle(String title) {
		List<Book> result = super.findWithNameQuery("Book.findByTitle", "title", title);
		
		if (!result.isEmpty()) {
			return result.get(0);
		}
		
		return null;
	}
	
	public List<Book> listByCategory (int categoryId){
		return super.findWithNameQuery("Book.findByCategory", "catId", categoryId);
	}
	
	public List<Book> search(String keyword){
		return super.findWithNameQuery("Book.search", "keyword", keyword);
	}
	
	public long countByCategory (int categoryId) {
		return super.countWithNamedQuery("Book.countByCategory", "catId", categoryId);
	}
	
	public List<Book> listBestSellingBooks() {
		return super.findWithNameQuery("OrderDetail.bestSelling", 0, 4);
	}
	
	public List<Book> listMostFavoredBooks() {
		List<Book> mostFavoredBooks = new ArrayList<>();
		List<Object[]>result = super.findWithNameQueryObjects("Review.mostFavoredBooks", 0, 4);
		
		if (!result.isEmpty()) {
			for (Object[] elements : result) {
				Book book = (Book) elements[0];
				mostFavoredBooks.add(book);
			}
		}
		
		return mostFavoredBooks;
	}

}
