package service;

import java.util.List;

import entity.activity_college;
import utils.SearchInfo;

public interface activity_college_Service extends Basic_Service<activity_college>{
	
	public List<activity_college> select2(SearchInfo info);

}
