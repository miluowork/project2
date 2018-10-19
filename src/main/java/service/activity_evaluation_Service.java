package service;



import java.util.List;

import entity.activity_evaluation;


public interface activity_evaluation_Service extends Basic_Service<activity_evaluation>{
	
	public List<activity_evaluation> selectByUserid(int user_id);

	
}
