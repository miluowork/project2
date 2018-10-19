package service;

import java.util.List;


import utils.SearchInfo;

public interface Basic_Service <T>{
	public List<T> select(SearchInfo info);
    
	public T selectById(int id);
    
	public void insert(T t);
	
	public void update(T t);
	
	public void updateAll(T t);
	
	public void delete(int id); 
	
	public void deleteALL(SearchInfo info); 
	 
	public int Maxid();
}
