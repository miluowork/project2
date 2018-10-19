package serviceImpl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import dao.activity_college_Dao;
import entity.activity_college;
import service.activity_college_Service;
import utils.SearchInfo;


@Service("activity_college_ServiceImpl")
public class activity_college_ServiceImpl extends Basic_ServiceImpl<activity_college>  implements activity_college_Service{
@Resource(name="activity_college_Dao")
activity_college_Dao dao;

public List<activity_college> select2(SearchInfo info) {
	return dao.select2(info);
}

}
