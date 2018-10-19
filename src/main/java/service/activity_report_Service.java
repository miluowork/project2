package service;


import java.util.List;

import entity.activity_college;
import entity.activity_report;
import entity.activity_user;
import utils.SearchInfo;

public interface activity_report_Service extends Basic_Service<activity_report> {
	public int getMax(SearchInfo info);
	public List<activity_user> getIds(SearchInfo info);
	public String getjson(int id);
	public String updatejson(String s);
}
