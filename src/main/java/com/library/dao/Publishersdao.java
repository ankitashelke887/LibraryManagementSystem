package com.library.dao;

import java.util.List;

import com.library.dto.Publishers;

public interface Publishersdao {
	
	void addpublisher(Publishers p);
	
	void updatepublisher(Publishers p);
	
	void deletepublisher(Integer publisherId);
	
	List<Publishers> getallpublishers();
	
	Publishers getbymail(String pEmail);

}
