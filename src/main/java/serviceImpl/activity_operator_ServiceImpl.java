package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.activity_operator_Dao;
import entity.activity_operator;
import entity.activity_school;
import service.activity_operator_Service;
import utils.SearchInfo;

@Service("activity_operator_ServiceImpl")
public class activity_operator_ServiceImpl extends Basic_ServiceImpl<activity_operator> implements activity_operator_Service{
	@Resource(name="activity_operator_Dao")
	activity_operator_Dao dao;

	public int getMax(SearchInfo info) {
		return dao.getMax(info);
	}
	
}
