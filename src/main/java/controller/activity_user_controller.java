package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import entity.activity_college;
import entity.activity_user;
import service.activity_college_Service;
import service.activity_school_Service;
import service.activity_user_Service;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("activity_user")
public class activity_user_controller extends Basic_Controller<activity_user> {
	
	@Resource(name="activity_user_ServiceImpl")
	activity_user_Service  service;
	
	@Resource(name="activity_college_ServiceImpl")
	activity_college_Service cservice;

	@Resource(name="activity_school_ServiceImpl")
	activity_school_Service sservice;
	
	@Override
	public void index(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
		Integer select=info.getSelect();
		String txt=info.getTxt();
		System.out.println("select: "+select+"txt: "+txt);
		
		if(select==null)
			select=0;
		String where="";
		if(txt!=null&&txt.length()>0){
			switch (select) {
			case 1:
				where=" where a.type = "+txt+" ";
				break;
			default:
				where=" where a.tel like '%"+txt+"%'";
			}
		}
		System.out.println(where);
		m.put("select",select);
		m.put("txt",select==0?"'"+txt+"'":txt);
		info.setWhere(where);
		
		List<activity_user> us=(List<activity_user>) service.select(info);
		List<activity_user> us2=(List<activity_user>) service.select2(info);
		int size=us.size();
		int size2=us2.size();
		int limit=info.getLimits();
		
		if(size2%limit==0){
			info.setLast_pageno(size2/limit);
		}else{
			info.setLast_pageno((size2/limit)+1);
		}
		info.setFirst_pageno(1);
		info.setNext_pageno(info.getNext());
		info.setPrev_pageno(info.getPrev());
		info.setSize(size);
		info.setSize2(size2);
		m.put("result", info);
		
		m.put("sex",activity_user.getGenders());
		m.put("type",activity_user.getTypes());
		m.put("status",activity_user.getStatuses());
		m.put("ylevel",activity_user.getYleveles());
		m.put("glevel",activity_user.getGleveles());
		m.put("slevel",activity_user.getSleveles());
		m.put("uList", us);
		
		SearchInfo info2= new SearchInfo();
		m.put("cList", cservice.select(info2));
		m.put("sList", sservice.select(info2));
		super.index(info, m, req);
	}
	

	
	@Override
	public String edit(int id, ModelMap m, HttpServletRequest req) throws Exception {
		activity_user us=service.selectById(id);
		List<activity_college> clist=service.selectBySchoolId(us.getSchool_id());
		m.put("infos", us);
		m.put("clist", clist);
		return super.edit(id, m, req);
	}
	
	@Override
	public String add(ModelMap m, HttpServletRequest req) throws Exception {
		SearchInfo info= new SearchInfo();
		m.put("sList", sservice.select(info));
		m.put("cList", cservice.select(info));
		m.put("sex",activity_user.getGenders());
		m.put("type",activity_user.getTypes());
		m.put("status",activity_user.getStatuses());
		m.put("ylevel",activity_user.getYleveles());
		m.put("glevel",activity_user.getGleveles());
		m.put("slevel",activity_user.getSleveles());
		return super.add(m, req);
	}
	
	@Override
	public JsonInfo insert_json(activity_user o, ModelMap m, HttpServletRequest req) throws Exception {
		Date date= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createdate=sdf.format(date);
		o.setCreatedate(createdate);
		o.setOperator_id(1);
		return super.insert_json(o, m, req);
	}
	
	@Override
	public JsonInfo update_json(activity_user o, ModelMap m, HttpServletRequest req) throws Exception {
		service.update(o);
		return super.update_json(o, m, req);
	}
	
	
	@RequestMapping(value="getCollegeList")
	@ResponseBody
	public  List<activity_college> getCollegeList(int school_id){
		List<activity_college> clist=service.selectBySchoolId(school_id);
		return clist ;
	}
	
}
