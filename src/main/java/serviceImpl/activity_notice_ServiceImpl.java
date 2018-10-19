package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.activity_notice_Dao;
import entity.activity_notice;
import service.activity_notice_Service;

@Service("activity_notice_ServiceImpl")
public class activity_notice_ServiceImpl extends Basic_ServiceImpl<activity_notice> implements activity_notice_Service {
 @Resource(name="activity_notice_Dao")
 activity_notice_Dao dao;

public void updateStatus(activity_notice c) {
	dao.updateStatus(c);
	
}


 
}
