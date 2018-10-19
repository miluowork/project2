package serviceImpl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import dao.activity_school_Dao;
import entity.activity_school;
import service.activity_school_Service;

@Service("activity_school_ServiceImpl")
public class activity_school_ServiceImpl extends Basic_ServiceImpl<activity_school>  implements activity_school_Service{
@Resource(name="activity_school_Dao")
activity_school_Dao dao;




}
