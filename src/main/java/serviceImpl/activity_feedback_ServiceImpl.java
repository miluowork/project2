package serviceImpl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import dao.activity_feedback_Dao;
import entity.activity_feedback;
import service.activity_feedback_Service;




@Service("activity_feedback_ServiceImpl")
public class activity_feedback_ServiceImpl extends Basic_ServiceImpl<activity_feedback>  implements activity_feedback_Service{
@Resource(name="activity_feedback_Dao")
activity_feedback_Dao dao;

public void updatestatus(activity_feedback ac) {
	dao.updatestatus(ac);
	
}

}
