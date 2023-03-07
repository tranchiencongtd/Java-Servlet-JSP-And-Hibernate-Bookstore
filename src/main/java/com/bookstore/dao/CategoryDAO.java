package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.Category;
import com.bookstore.entity.Users;

import jakarta.persistence.EntityManager;

public class CategoryDAO extends JpaDAO<Category> implements GenericDAO<Category> {

	public CategoryDAO() {
		super();
	}
	
	@Override
	public Category create(Category category) {
		return super.create(category);
	}

	@Override
	public Category update(Category category) {
		return super.update(category);
	}

	@Override
	public Category get(Object categoryId) {
		return super.find(Category.class, categoryId);
	}

	@Override
	public void delete(Object categoryId) {
		super.delete(Category.class, categoryId);
	}

	@Override
	public List<Category> listAll() {
		return super.findWithNameQuery("Category.findAll");
	}

	@Override
	public long count() {
		return super.countWithNameQuery("Category.countAll");
	}
	
	public Category findByName(String categoryName) {
		List<Category> result = super.findWithNameQuery("Category.findByName", "name", categoryName);
		
		if (result != null && result.size() > 0) {
			return result.get(0);
		}
		
		return null;
	}
}
