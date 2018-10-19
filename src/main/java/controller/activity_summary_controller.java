package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import entity.activity;
import entity.activity_checkwork;
import entity.activity_operator;
import entity.activity_summary;
import entity.activity_user;
import service.activity_Service;
import service.activity_operator_Service;
import service.activity_summary_Service;
import service.activity_user_Service;
import utils.JsonInfo;
import utils.SearchInfo;


@Controller
@RequestMapping("activity_summary")
public class activity_summary_controller extends Basic_Controller<activity_summary> {
    
	@Resource(name="activity_summary_ServiceImpl")
	activity_summary_Service  service;
	
	@Resource(name="activity_ServiceImpl")
	activity_Service  aservice;
	
	@Resource(name="activity_operator_ServiceImpl")
	activity_operator_Service  oservice;
	
	@Resource(name="activity_user_ServiceImpl")
	activity_user_Service  uservice;
	
	@Override
	public void index(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		Integer select=info.getSelect();
		String txt=info.getTxt();
		if(select==null)
			select=0;
		String where="";
		if(txt!=null&&txt.length()>0){
			switch (select){
			case 1:
				where=" where a.activity_id ='"+txt+"' ";
				break;
			default:
				where=" where a.createdate ='"+txt+"' ";
			}
		}else {
			Date dt= new Date();
			SimpleDateFormat df= new  SimpleDateFormat("yyyy年MM月dd日");
			String date=df.format(dt);
			info.setTxt(date);
			txt=info.getTxt();
			where=" where a.createdate ='"+txt+"'";
		}
		m.put("select",select);
		m.put("txt",select==null?"'"+txt+"'":txt);
		info.setWhere(where);
		List<activity_summary> us=(List<activity_summary>) service.select(info);
		List<activity_summary> us2=(List<activity_summary>) service.select2(info);
		int size=us.size();//加了limit
		int size2=us2.size();//bujia limit
		int limit=info.getLimits();
		
		if(size2%limit==0){
			info.setLast_pageno(size2/limit);
		}else{
			info.setLast_pageno((size2/limit)+1);
		}
		info.setMaxPage(info.getLast_pageno());
		info.setFirst_pageno(1);
		info.setNext_pageno(info.getNext());
		info.setPrev_pageno(info.getPrev());
		info.setSize(size);
		info.setSize2(size2);
		m.put("result", info);
		
		
		SearchInfo info2= new SearchInfo();
		List<activity> act= aservice.select(info2);
		List<activity_operator> op= oservice.select(info2);
		List<activity_user> user= uservice.select(info2);
		m.put("smyList",us);
		m.put("aList",act);
		m.put("oList",op);
		m.put("uList",user);
		m.put("scxstatus",activity_summary.getScx_status());
		m.put("tstatus",activity_summary.getT_status());
		
		
		super.index(info, m, req);
	}
	

	
	@Override
	public String edit(int id, ModelMap m, HttpServletRequest req) throws Exception {
		activity_summary summary=service.selectById(id);
		String[] op=summary.getOptions().split(",");
		int num=op.length;
		int[] opt = new int[num];
		for(int i=0;i<num;i++) {
			Integer t=Integer.parseInt(op[i]);
			opt[i]=t;
		}
		m.put("infos", summary);
		m.put("opt", opt);
		return super.edit(id, m, req);
	}
	
	@Override
	public String add(ModelMap m, HttpServletRequest req) throws Exception {
		SearchInfo info= new SearchInfo();
		List<activity> act= aservice.select(info);
		List<activity_operator> op= oservice.select(info);
		List<activity_user> user= uservice.select(info);
		m.put("aList",act);
		m.put("oList",op);
		m.put("uList",user);
		m.put("scxstatus",activity_summary.getScx_status());
		m.put("tstatus",activity_summary.getT_status());
		m.put("questions",activity_summary.getQuestions());
		m.put("option1",activity_summary.getOption1());
		m.put("option2",activity_summary.getOption2());
		return super.add(m,req);
	}
	@RequestMapping("options")
	public void options(String options,ModelMap m, HttpServletRequest req) throws Exception {
		System.out.println(options);
		String[] opts=options.split(",");
		int num=opts.length;
		System.out.println(num);
		int[] opt = new int[num];
		for(int i=0;i<num;i++) {
			Integer t=Integer.parseInt(opts[i]);
			opt[i]=t;
		}
		m.put("opt", opt);
		
		SearchInfo info= new SearchInfo();
		List<activity> act= aservice.select(info);
		List<activity_operator> op= oservice.select(info);
		List<activity_user> user= uservice.select(info);
		m.put("aList",act);
		m.put("oList",op);
		m.put("uList",user);
		m.put("scxstatus",activity_summary.getScx_status());
		m.put("tstatus",activity_summary.getT_status());
		m.put("questions",activity_summary.getQuestions());
		m.put("option1",activity_summary.getOption1());
		m.put("option2",activity_summary.getOption2());
		
	}
	
	@Override
	public JsonInfo insert_json(activity_summary o, ModelMap m, HttpServletRequest req) throws Exception {
		return super.insert_json(o, m, req);
	}
	
	
	@Override
	public JsonInfo update_json(activity_summary o, ModelMap m, HttpServletRequest req) throws Exception {
		return super.update_json(o, m, req);
	}
	
}
