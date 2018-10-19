package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.activity_Dao;
import entity.activity;
import entity.activity_user;
import service.activity_Service;
import utils.SearchInfo;

@Service("activity_ServiceImpl")
public class activity_ServiceImpl extends Basic_ServiceImpl<activity> implements activity_Service{
	@Resource(name="activity_Dao")
	activity_Dao dao;

	public int getMax(SearchInfo info) {
		return dao.getMax(info);
	}
	public String getName(int id) {
		return dao.getName(id);
	}
	public List<activity_user> userselect(SearchInfo info) {
		return dao.userselect(info);
	}
	public String getUsername(int id) {
		// TODO Auto-generated method stub
		return dao.getUsername(id);
	}
}
