package service;

import java.util.List;

import entity.activity_summary;
import utils.SearchInfo;

public interface activity_summary_Service extends Basic_Service<activity_summary> {

	public List<activity_summary> select2(SearchInfo info);
}
