package service;


import java.util.List;

import entity.activity_college;
import entity.activity_market;
import entity.activity_user;
import utils.SearchInfo;

public interface activity_market_Service extends Basic_Service<activity_market> {
	public int getMax(SearchInfo info);
	public List<activity_user> getIds(SearchInfo info);
	public String getjson(int id);
	public String updatejson(String s);
}
