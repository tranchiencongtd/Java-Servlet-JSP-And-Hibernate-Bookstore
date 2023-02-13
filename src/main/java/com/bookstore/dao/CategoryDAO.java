package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.Category;
import com.bookstore.entity.Users;

import jakarta.persistence.EntityManager;

public class CategoryDAO extends JpaDAO<Category> implements GenericDAO<Category> {

	public CategoryDAO(EntityManager entityManager) {
		super(entityManager);
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
}
