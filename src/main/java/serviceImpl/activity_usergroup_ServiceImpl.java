package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.activity_usergroup_Dao;
import entity.activity_user;
import entity.activity_usergroup;
import service.activity_usergroup_Service;
import utils.SearchInfo;

@Service("activity_usergroup_ServiceImpl")
public class activity_usergroup_ServiceImpl extends Basic_ServiceImpl<activity_usergroup> implements activity_usergroup_Service {

	@Resource(name="activity_usergroup_Dao")
	activity_usergroup_Dao dao;

	public List<activity_usergroup> select2(SearchInfo info) {
		return dao.select2(info);
	}

	public List<activity_user> selectByActId(int activity_id) {
		return dao.selectByActId(activity_id);
	}

	public List<activity_usergroup> groupIds(int activity_id) {
		return dao.groupIds(activity_id);
	}

	public List<activity_user> finalList(SearchInfo info) {
		return dao.finalList(info);
	}
}
