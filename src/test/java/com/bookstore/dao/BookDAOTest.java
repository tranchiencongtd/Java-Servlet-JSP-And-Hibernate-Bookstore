package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.util.Date;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.utils.DateUtils;
import com.bookstore.utils.FileUtils;

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
		Book existBook = new Book();
		existBook.setBookId(33);
		
		Category category = new Category();
		category.setCategoryId(12);
		existBook.setCategory(category);
		
		existBook.setTitle("Effective Java (3rd Edition)");
		
		Book updatedBook = bookDAO.update(existBook);
		
		assertEquals(updatedBook.getTitle(), "Effective Java (3rd Edition");
	}
}
