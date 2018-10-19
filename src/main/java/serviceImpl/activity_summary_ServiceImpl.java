package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.activity_Dao;
import dao.activity_summary_Dao;
import entity.activity_summary;
import service.activity_summary_Service;
import utils.SearchInfo;

@Service("activity_summary_ServiceImpl")
public class activity_summary_ServiceImpl extends Basic_ServiceImpl<activity_summary> implements activity_summary_Service {
	@Resource(name="activity_summary_Dao")
	activity_summary_Dao dao;

	public List<activity_summary> select2(SearchInfo info) {
		return dao.select2(info);
	}
}
