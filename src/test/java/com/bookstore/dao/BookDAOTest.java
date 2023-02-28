package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.utils.DateUtils;
import com.bookstore.utils.FileUtils;

import jakarta.persistence.EntityNotFoundException;

public class BookDAOTest extends BaseDAOTest{
	private static BookDAO bookDAO;
	
	@BeforeClass
	public static void setupClass() {
		BaseDAOTest.setupClass();
		bookDAO = new BookDAO(entityManager);
	}

	@AfterClass 
	public static void tearDownClass( ) {
		BaseDAOTest.tearDownClass();
	}
	
	@Test
	public void testCreateBook() throws ParseException, IOException {
		Book newBook = new Book();
		
		Category category = new Category("Effective Java");
		category.setCategoryId(11);
		newBook.setCategory(category);
		
		newBook.setTitle("Effective Java (2nd Edition)");
		newBook.setAuthor("Joshua Bloch");
		newBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
		newBook.setPrice(38.87f);
		newBook.setIsbn("0321356683");
		
		Date publishDate = DateUtils.getDateFormatted("02/22/2023");
		newBook.setPublishDate(publishDate);
		
		Path currentRelativePath = Paths.get("");
		String currentPath = currentRelativePath.toAbsolutePath().toString();
		String imagePath = FileUtils.combinePath(currentPath,"src","main","webapp","assets","images","nguoinamcham.jpg");
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		
		
		Book createdBook = bookDAO.create(newBook);
		
		assertTrue(createdBook.getBookId() > 0);
	}
	
	@Test
	public void testUpdateeBook() throws ParseException, IOException {
		Book newBook = new Book();
		
		Category category = new Category("Effective Java");
		category.setCategoryId(11);
		newBook.setCategory(category);
		
		newBook.setTitle("Effective Java (3nd Edition2)");
		newBook.setAuthor("Joshua Bloch");
		newBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
		newBook.setPrice(38.87f);
		newBook.setIsbn("0321356683");
		
		Date publishDate = DateUtils.getDateFormatted("02/22/2023");
		newBook.setPublishDate(publishDate);
		
		Path currentRelativePath = Paths.get("");
		String currentPath = currentRelativePath.toAbsolutePath().toString();
		String imagePath = FileUtils.combinePath(currentPath,"src","main","webapp","assets","images","nguoinamcham.jpg");
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		
		
		Book updatedBook = bookDAO.create(newBook);
		
		assertEquals(updatedBook.getTitle(), "Effective Java (3nd Edition2)");
	}
	
	@Test(expected = EntityNotFoundException.class)
	public void testDeleteBookFail() {
		Integer bookId = 100;
		bookDAO.delete(bookId);
		
		assertTrue(true);
	}
	
	@Test
	public void testDeleteBookSuccess() {
		Integer bookId = 38;
		bookDAO.delete(bookId);
		
		assertTrue(true);
	}
	
	@Test
	public void testGetBookFail() {
		Integer bookId = 99;
		Book book = bookDAO.get(bookId);
		
		assertNull(book);
	}
	
	@Test
	public void testGetBookSuccess() {
		Integer bookId = 33;
		Book book = bookDAO.get(bookId);
		
		assertNotNull(book);
	} 
	
	@Test
	public void testLitAll() {
		List<Book> listBooks = bookDAO.listAll();
		
		for (Book aBook : listBooks) {
			System.out.println(aBook.getTitle() + " - " + aBook.getAuthor());
		}
		assertFalse(listBooks.isEmpty());		
	}
	
	@Test
	public void testFindByTitleNotExist() {
		String title = "Think in Java";
		Book book = bookDAO.findByTitle(title);
		
		assertNull(book);
	}
	
	@Test
	public void testFindByTitleExist() {
		String title = "Effective Java (2nd Edition)";
		Book book = bookDAO.findByTitle(title);
		
		System.out.println(book.getAuthor());
		System.out.println(book.getPrice());
		
		assertNotNull(book);
	}
	
	@Test
	public void testCount() {
		long totalBooks = bookDAO.count();
		
		assertEquals(totalBooks, 2);
	}
}
