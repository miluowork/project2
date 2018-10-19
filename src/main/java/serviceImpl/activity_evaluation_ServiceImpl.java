package serviceImpl;


import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import dao.activity_evaluation_Dao;
import entity.activity_evaluation;
import service.activity_evaluation_Service;



@Service("activity_evaluation_ServiceImpl")
public class activity_evaluation_ServiceImpl extends Basic_ServiceImpl<activity_evaluation>  implements activity_evaluation_Service{
@Resource(name="activity_evaluation_Dao")
activity_evaluation_Dao dao;

public List<activity_evaluation> selectByUserid(int user_id) {
	// TODO Auto-generated method stub
	return dao.selectByUserid(user_id);
}




}