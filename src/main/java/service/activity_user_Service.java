package service;


import java.util.List;

import org.springframework.ui.ModelMap;

import entity.activity_college;
import entity.activity_user;
import utils.SearchInfo;

public interface activity_user_Service extends Basic_Service<activity_user> {
	
	public List<activity_user> select2(SearchInfo info);
	
	public List<activity_college> selectBySchoolId(int id);
	
	
	public void updatepass(activity_user t);
	
	public void pack(ModelMap m,SearchInfo info);
	
}
