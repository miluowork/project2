package serviceImpl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.activity_report_dao;
import entity.activity_report;
import entity.activity_user;
import service.activity_report_Service;
import utils.SearchInfo;



@Service("activity_report_ServiceImpl")
public class activity_report_ServiceImpl extends Basic_ServiceImpl<activity_report>  implements activity_report_Service{
@Resource(name="activity_report_dao")
activity_report_dao dao;

public int getMax(SearchInfo info) {
	return dao.getMax(info);
}

public List<activity_user> getIds(SearchInfo info) {
	return dao.getIds(info);
}

public String getjson(int id) {
	return dao.getjson(id);
}

public String updatejson(String s) {
	return dao.updatejson(s);
}

}

