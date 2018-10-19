package service;

import java.util.List;

import entity.activity_user;
import entity.activity_usergroup;
import utils.SearchInfo;

public interface activity_usergroup_Service extends Basic_Service<activity_usergroup> {

	public List<activity_usergroup> select2(SearchInfo info);
	
	public List<activity_user> selectByActId(int activity_id);
	
	public List<activity_usergroup> groupIds(int activity_id);
	
	public List<activity_user> finalList(SearchInfo info);
}
