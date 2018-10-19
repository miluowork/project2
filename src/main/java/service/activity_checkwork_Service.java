package service;

import java.util.List;

import entity.activity_checkwork;
import utils.SearchInfo;

public interface activity_checkwork_Service extends Basic_Service<activity_checkwork> {
	
	public List<activity_checkwork> select2(SearchInfo info);
	
	public void allUpdate(activity_checkwork t);
	
	public void quickUpdate(activity_checkwork t);
	
	public void reset(activity_checkwork t);
    
}
