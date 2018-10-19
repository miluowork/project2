package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.activity;
import entity.activity_checkwork;
import entity.activity_operator;
import entity.activity_user;
import service.activity_Service;
import service.activity_checkwork_Service;
import service.activity_operator_Service;
import service.activity_user_Service;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("activity_checkwork")
public class activity_checkwork_controller extends Basic_Controller<activity_checkwork> {

	@Resource(name="activity_checkwork_ServiceImpl")
	activity_checkwork_Service  service;
	
	@Resource(name="activity_ServiceImpl")
	activity_Service  aservice;
	
	@Resource(name="activity_operator_ServiceImpl")
	activity_operator_Service  oservice;
	
	@Resource(name="activity_user_ServiceImpl")
	activity_user_Service  uservice;
	
	@Override
	public void index(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
		SearchInfo info2= new SearchInfo();
		String where2="where type=0 and status=1 order by id desc ";
		info2.setWhere(where2);
		List<activity> act= aservice.select(info2);
		//txt1空值判断并赋值
		Integer txt1=null;
		if(req.getParameter("txt1")==null) {
			txt1=act.get(0).getId();
		}else {
			txt1=Integer.parseInt(req.getParameter("txt1"));
		}
		//txt空值判断并赋值
		String txt=info.getTxt();
		if(txt=="") {
			Date dt= new Date();
			SimpleDateFormat df= new  SimpleDateFormat("yyyy年MM月dd日");
			String date=df.format(dt);
			info.setTxt(date);
			txt=info.getTxt();
		}
		//查重并插入当天数据
		SearchInfo info0= new SearchInfo();
		String where0=" where a.activity_id ='"+txt1+"' and a.date ='"+txt+"'";
		info0.setWhere(where0);
		List<activity_checkwork> us0=(List<activity_checkwork>) service.select(info0);
		int num0=us0.size();
		if(num0==0) {//无当天人员的考勤记录则插入数据
			Integer operator_id=1;
			String str=aservice.selectById(txt1).getIds();
			String[] pp=str.split(",");
			int num=pp.length;
			ArrayList<activity_user> uL= new ArrayList<activity_user>();
			for(int i=0;i<num;i++) {
				//获取组员id
				Integer t=Integer.parseInt(pp[i]);
				//创建当前日期
				Date dt= new Date();
				SimpleDateFormat df= new  SimpleDateFormat("yyyy年MM月dd日");
				String date=df.format(dt);
				activity_checkwork check= new activity_checkwork();
				check.setActivity_id(txt1);
				check.setUser_id(t);
				check.setDate(txt);
				check.setLastdate(date);
				check.setOperator_id(operator_id);
				service.insert(check);
			}
		}
		//查询
		String where=" where a.activity_id ='"+txt1+"' and a.date ='"+txt+"' ";
		System.out.println("where"+where);
		m.put("txt1",txt1);
		m.put("txt",txt1==null?"'"+txt+"'":txt);
		info.setWhere(where);
		info.setLimit(999999999);
		//分页
		List<activity_checkwork> us=(List<activity_checkwork>) service.select(info);
		List<activity_checkwork> us2=(List<activity_checkwork>) service.select2(info);
		int size=us.size();//当前页记录     有limit
		int size2=us2.size();//所有记录   无limit
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
		m.put("result",info);
		
		SearchInfo info3= new SearchInfo();
		List<activity_operator> op= oservice.select(info3);
		List<activity_user> user= uservice.select(info3);
		m.put("check",activity_checkwork.getCheckes());
		m.put("ckList",us);
		m.put("aList",act);
		m.put("oList",op);
		m.put("uList",user);
		
		
		super.index(info, m, req);
	}
	

	
	@Override
	public String edit(int id, ModelMap m, HttpServletRequest req) throws Exception {
		
		String ids="";
		if(req.getParameter("ids")!=null) {
			ids=req.getParameter("ids");
			m.put("ids",ids);
			m.put("name","活动选中成员");
		}else {
			activity_checkwork ck=service.selectById(id);
			m.put("infos", ck);
		}
		return super.edit(id, m, req);
	}
	
	@Override
	public String add(ModelMap m, HttpServletRequest req) throws Exception {
		SearchInfo info= new SearchInfo();
		List<activity>act= aservice.select(info);
		List<activity_operator> op= oservice.select(info);
		List<activity_user> user= uservice.select(info);
		m.put("aList",act);
		m.put("oList",op);
		m.put("uList",user);
		m.put("checkes",activity_checkwork.getCheckes());
		return super.add(m, req);
	}
	
	
	@Override
	public JsonInfo update_json(activity_checkwork o, ModelMap m, HttpServletRequest req) throws Exception {
		Date dt1= new Date();
		SimpleDateFormat df= new  SimpleDateFormat("yyyy年MM月dd日");
		String date1=df.format(dt1);
		o.setLastdate(date1);
		service.update(o);
		return super.update_json(o, m, req);
	}
	@RequestMapping("AllUpdate_json")
	@ResponseBody
	public JsonInfo AllUpdate_json(activity_checkwork o, ModelMap m, HttpServletRequest req) throws Exception {
		String ids="";
		Date dt1= new Date();
		SimpleDateFormat df= new  SimpleDateFormat("yyyy年MM月dd日");
		String date1=df.format(dt1);
		
		
		
		if(req.getParameter("ids")!=null) {
			ids=req.getParameter("ids");
			String[] op=ids.split(",");
			int num=op.length;
			
			
			for(int i=0;i<num;i++) {
				Integer t=Integer.parseInt(op[i]);
				activity_checkwork ack=service.selectById(t);
				System.out.println();
				if(o.getCheck1()==null) {
					o.setCheck1(ack.getCheck1());
				}
				if(o.getCheck2()==null) {
					o.setCheck2(ack.getCheck2());
				}
				if(o.getCheck3()==null) {
					o.setCheck3(ack.getCheck3());
				}
				
				
				o.setId(ack.getId());
				o.setUser_id(t);
				o.setOperator_id(1);
				o.setActivity_id(ack.getActivity_id());
				o.setDate(ack.getDate());
				o.setLastdate(date1);
				service.allUpdate(o);
			}
		}
		return new JsonInfo(1,"");
	}
	
	@RequestMapping("quickCheck")
	@ResponseBody
	public JsonInfo quickCheck(@Param("code") Integer code,@Param("activity_id") Integer activity_id,@Param("date") String date,HttpServletRequest req) throws Exception {
		Date dt1= new Date();
		SimpleDateFormat df= new  SimpleDateFormat("yyyy年MM月dd日");
		String date1=df.format(dt1);
		//对考勤时段进行判断并给其他时段赋默认值
		activity act=aservice.selectById(activity_id);
		String check="";
		Integer checkValue=0;
		if(code==1) {
			check="check1";
			checkValue=1;
			
		}else if(code==2) {
			check="check2";
			checkValue=1;
		}else {
			check="check3";
			checkValue=1;
		}
		//查询该活动的所有成员
		String ids=act.getIds();
		
		String[] op=ids.split(",");
			activity_checkwork ack=new activity_checkwork();
			ack.setOperator_id(1);
			ack.setDate(date);
			ack.setLastdate(date1);
			ack.setActivity_id(activity_id);
			ack.setCheck(check);
			ack.setCheckValue(checkValue);
			service.quickUpdate(ack);
		return new JsonInfo(1,"");
	}
	
	@RequestMapping("resetCheck")
	@ResponseBody
	public JsonInfo resetCheck(@Param("activity_id") Integer activity_id,@Param("date") String date,HttpServletRequest req) throws Exception {
		Date dt1= new Date();
		SimpleDateFormat df= new  SimpleDateFormat("yyyy年MM月dd日");
		String date1=df.format(dt1);
		//对考勤时段进行判断并给其他时段赋默认值
		activity act=aservice.selectById(activity_id);
		//查询该活动的所有成员
		String ids=act.getIds();
		String[] op=ids.split(",");
			activity_checkwork ack=new activity_checkwork();
			ack.setOperator_id(1);
			ack.setDate(date);
			ack.setLastdate(date1);
			ack.setActivity_id(activity_id);
			ack.setCheck1(0);
			ack.setCheck2(0);
			ack.setCheck3(0);
			service.reset(ack);
		return new JsonInfo(1,"");
	}
	
	@RequestMapping("resetPerson")
	@ResponseBody
	public JsonInfo resetPerson(@Param("id") Integer id,HttpServletRequest req) throws Exception {
		Date dt1= new Date();
		SimpleDateFormat df= new  SimpleDateFormat("yyyy年MM月dd日");
		String date1=df.format(dt1);
		//对考勤时段进行判断并给其他时段赋默认值
		activity_checkwork ack=service.selectById(id);
		//查询该活动的所有成员
			ack.setOperator_id(1);
			ack.setLastdate(date1);
			ack.setCheck1(0);
			ack.setCheck2(0);
			ack.setCheck3(0);
			service.update(ack);;
		return new JsonInfo(1,"");
	}
	
	
	
}
