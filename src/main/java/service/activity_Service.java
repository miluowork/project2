package service;

import java.util.List;

import entity.activity;
import entity.activity_user;
import utils.SearchInfo;

public interface activity_Service  extends Basic_Service<activity>{
	public int getMax(SearchInfo info);
	public String getName(int id);
	public List<activity_user> userselect(SearchInfo info);
	public String getUsername(int id);
	
}
