package com.library.dao;

import java.util.List;

import com.library.dto.Categories;

public interface Categoriesdao {
	
	void addcategory(Categories c);
	
	void updatecategory(Categories c);
	
	void deletecategory(Integer categoryId);
	
	List<Categories> getallcategories();
	
	Categories getbyidandname(Integer categoryId, String cName);

}
