package service;

import java.util.List;

import entity.activity_college;
import entity.activity_operator;
import utils.SearchInfo;

public interface activity_operator_Service  extends Basic_Service<activity_operator>{
	public int getMax(SearchInfo info);
}
