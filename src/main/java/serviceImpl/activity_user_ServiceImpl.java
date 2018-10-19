package serviceImpl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import dao.activity_user_Dao;
import entity.activity_college;
import entity.activity_user;
import service.activity_college_Service;
import service.activity_school_Service;
import service.activity_user_Service;
import utils.SearchInfo;



@Service("activity_user_ServiceImpl")
public class activity_user_ServiceImpl extends Basic_ServiceImpl<activity_user>  implements activity_user_Service{
@Resource(name="activity_user_Dao")
activity_user_Dao dao;

public List<activity_user> select2(SearchInfo info) {
	return dao.select2(info);
}

public List<activity_college> selectBySchoolId(int id) {
	return dao.selectBySchoolId(id);
}


public void updatepass(activity_user t) {
	dao.updatepass(t);
	
}



@Resource(name = "activity_school_ServiceImpl")
activity_school_Service sservice;
@Resource(name = "activity_college_ServiceImpl")
activity_college_Service cservice;

public void pack(ModelMap m,SearchInfo info) {
	m.put("sList", sservice.select(info));
	m.put("cList", cservice.select(info));
	m.put("sex", activity_user.getGenders());
	m.put("type", activity_user.getTypes());
	m.put("status", activity_user.getStatuses());
	m.put("ylevel", activity_user.getYleveles());
	m.put("glevel", activity_user.getGleveles());
	m.put("slevel", activity_user.getSleveles());
}


}

