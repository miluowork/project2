package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import entity.activity_notice;
import service.activity_Service;
import service.activity_notice_Service;
import service.activity_operator_Service;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("activity_notice")
public class activity_notice_Controller extends Basic_Controller<activity_notice> {
	@Resource(name="activity_notice_ServiceImpl")
	activity_notice_Service service;
	
	
	
	@Resource(name="activity_ServiceImpl")
	activity_Service aservice;
	
	@Resource(name="activity_operator_ServiceImpl")
	activity_operator_Service oservice;
	
	activity_notice entity;
	
	
	@Override
	public void index(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
		
		super.index(info, m, req);
	}
	
	
	
	@Override
	public String add(ModelMap m, HttpServletRequest req) throws Exception {

		m.put("alist", aservice.select(new SearchInfo()));
		m.put("olist", oservice.select(new SearchInfo()));
		m.put("statuses", activity_notice.statuses);
		return super.add(m, req);
	}
	
	
	@Override
	public String edit(int id, ModelMap m, HttpServletRequest req) throws Exception {
		
		return super.edit(id, m, req);
	}
	
	
	
	@Override
	public JsonInfo insert_json(activity_notice o, ModelMap m, HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		return super.insert_json(o, m, req);
	}
	
	
	@Override
	public JsonInfo update_json(activity_notice o, ModelMap m, HttpServletRequest req) throws Exception {
		
		return super.update_json(o, m, req);
	}
	
	
	
	@RequestMapping("updateStatus")
	public @ResponseBody JsonInfo updateStatus(ModelMap m,activity_notice c){
		service.updateStatus(c);
		
		return new JsonInfo(1, "");
		
	}
	
	
	
	
	
	@Override
	public List<activity_notice> index_json(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
		
	
	  
		String where="where activity_id=1";
		info.setWhere(where);
		
		return super.index_json(info, m, req);
	}
	
	@RequestMapping("info")
	public String info(ModelMap m,int id) {
		
		m.put("nlist", service.selectById(id));
		return "activity_notice/info";
		
	}
	
	
	@RequestMapping("notice")
	public String notice(ModelMap m,SearchInfo info,HttpSession session) {
		int activity_id=(Integer) session.getAttribute("activity_id");
		
		info.setWhere("where acno.status=1 and acno.activity_id="+activity_id);
		m.put("nlist", service.select(info).get(0));
		
		return "activity_notice/notice";
		
	}
	
	

}
