package serviceImpl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.activity_market_Dao;
import entity.activity_market;
import entity.activity_user;
import service.activity_market_Service;
import utils.SearchInfo;



@Service("activity_market_ServiceImpl")
public class activity_market_ServiceImpl extends Basic_ServiceImpl<activity_market>  implements activity_market_Service{
@Resource(name="activity_market_Dao")
activity_market_Dao dao;

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

