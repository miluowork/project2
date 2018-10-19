package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.activity_time_Dao;
import entity.activity_time;
import service.activity_time_Service;

@Service("activity_time_ServiceImpl")
public class activity_time_ServiceImpl extends Basic_ServiceImpl<activity_time> implements activity_time_Service {
	@Resource(name="activity_time_Dao")
	activity_time_Dao dao; 
}
