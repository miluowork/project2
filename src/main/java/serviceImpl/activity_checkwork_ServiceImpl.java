package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.activity_checkwork_Dao;
import entity.activity_checkwork;
import service.activity_checkwork_Service;
import utils.SearchInfo;

@Service("activity_checkwork_ServiceImpl")
public class activity_checkwork_ServiceImpl extends Basic_ServiceImpl<activity_checkwork> implements activity_checkwork_Service{
	
	@Resource(name="activity_checkwork_Dao")
	activity_checkwork_Dao dao;
	
	public List<activity_checkwork> select2(SearchInfo info) {
		return dao.select2(info);
	}

	public void allUpdate(activity_checkwork t) {
		dao.allUpdate(t);
	}

	public void quickUpdate(activity_checkwork t) {
		dao.quickUpdate(t);
		
	}

	public void reset(activity_checkwork t) {
        dao.reset(t);		
	}

}
