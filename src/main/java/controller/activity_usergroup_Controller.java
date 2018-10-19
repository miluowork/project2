package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import entity.activity;
import entity.activity_checkwork;
import entity.activity_operator;
import entity.activity_user;
import entity.activity_usergroup;
import service.activity_Service;
import service.activity_operator_Service;
import service.activity_user_Service;
import service.activity_usergroup_Service;
import utils.JsonInfo;
import utils.SearchInfo;


@Controller
@RequestMapping("activity_usergroup")
public class activity_usergroup_Controller extends Basic_Controller<activity_usergroup> {
	
	@Resource(name="activity_usergroup_ServiceImpl")
	activity_usergroup_Service  service;
	
	@Resource(name="activity_ServiceImpl")
	activity_Service aservice;

	@Resource(name="activity_operator_ServiceImpl")
	activity_operator_Service oservice;
	
	@Resource(name="activity_user_ServiceImpl")
	activity_user_Service  uservice;
	
	
	@Override
	public void index(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
		/*Integer select=info.getSelect();*/
		String txt=info.getTxt();
		Integer user_id=1;//登录人员id;
		Integer type_id=1;
		/*if(select==null)
			select=0;*/
		String where="";
		if(txt!=null&&txt.length()>0){
			/*switch (select) {
			case 1:
				where=" where a.activity_id ='"+txt+"' order by a.id desc  ";
				break;
			default:*/
				switch (type_id) {
				case 3:
					where=" where a.activity_id ='"+txt+"' and b.type=2 and b.instructor_user_id='"+user_id+"' and b.`status`=1  order by a.id desc ";
					break;
				default:
					where=" where a.activity_id ='"+txt+"' and b.type=2  and b.`status`=1 order by a.id desc ";
				}
			/*}*/
		}else {
				Date dt= new Date();
				SimpleDateFormat df= new SimpleDateFormat("yyyy年MM月dd日");
				String date=df.format(dt);
				info.setTxt(date);
				SearchInfo info5= new SearchInfo();
				String where5="where type=2  and `status`=1 order by id desc";
				info5.setWhere(where5);
				List<activity> act5= aservice.select(info5);
				txt=act5.get(0).getId()+"";
				
				where=" where a.activity_id ='"+txt+"'" ;
		}
		/*m.put("select",select);*/
		m.put("txt",txt==null?"'"+txt+"'":txt);
		info.setWhere(where);
		//分页
		List<activity_usergroup> us=(List<activity_usergroup>) service.select(info);
		List<activity_usergroup> us2=(List<activity_usergroup>) service.select2(info);
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
		m.put("result", info);
		
		//导员登录,根据导员id查找对应的有效的比赛
		SearchInfo info2= new SearchInfo();
		List<activity> act =null;
		if(type_id==3) {
			String where2="where type=2 and instructor_user_id='"+user_id+"' and `status`=1  order by id desc";
			info2.setWhere(where2);
			 act= aservice.select(info2);
		}else {
			String where2="where type=2  and `status`=1 order by id desc";
			info2.setWhere(where2);
			act= aservice.select(info2);
			
		}
		
		SearchInfo info3= new SearchInfo();
		String where3="order by id desc";
		info3.setWhere(where3);
		List<activity_operator> op= oservice.select(info2);
		List<activity_user> user= uservice.select(info2);
	    int num=us.size();
	    
	    for(int i=0;i<num;i++) {
	    	String str=us.get(i).getIds();
	    	String[] args=str.split(",");
	    	String members="";
	    	int num1=args.length;
	    	for(int t=0;t<num1;t++) {
	    		Integer member=Integer.parseInt(args[t]);
	    		members +=t+1+"."+uservice.selectById(member).getName();
	    	}
	    	members.substring(0,members.length()-1);
	    	us.get(i).setMembers(members);
	    }
	    if(type_id==4) {
	    	
	    }
		m.put("ugList",us);
		m.put("aList",act);
		m.put("oList",op);
		m.put("points",activity_usergroup.getPoints());
		m.put("uList",user);
		m.put("type",type_id);
		
		
		super.index(info, m, req);
	}
	
	@Override
	public String edit(int id, ModelMap m, HttpServletRequest req) throws Exception {
		activity_usergroup ug=service.selectById(id);
		String ids0=ug.getIds();
		String[] ids1=ids0.split(",");
		int num=ids1.length;
		String  ids="";
		for(int i=0;i<num;i++) {
			int t=Integer.parseInt(ids1[i]);
			String name=uservice.selectById(t).getName();
			ids +=name+",";
		}
		ids =ids.substring(0, ids.length()-1);
		System.out.println("ids:"+ids);
		m.put("ids",ids);
		m.put("infos", ug);
		return super.edit(id, m, req);
	}
	
	@Override
	public String add(ModelMap m, HttpServletRequest req) throws Exception {
		SearchInfo info= new SearchInfo();
		String where="order by id desc";
		info.setWhere(where);
		List<activity> act= aservice.select(info);
		List<activity_operator> op= oservice.select(info);
		List<activity_user> user= uservice.select(info);
		int num=act.size();
		m.put("aList",act);
		m.put("oList",op);
		m.put("uList",user);
		m.put("points",activity_usergroup.getPoints());
		m.put("checkes",activity_checkwork.getCheckes());
		return super.add(m, req);
	}
	
	@Override
	public JsonInfo insert_json(activity_usergroup o, ModelMap m, HttpServletRequest req) throws Exception {
		Date dt= new Date();
		SimpleDateFormat df= new  SimpleDateFormat("yyyy年MM月dd日");
		String date=df.format(dt);
		o.setCreatedate(date);
		o.setOperator_id(1);
		return super.insert_json(o, m, req);
	}
	
	@Override
	public JsonInfo update_json(activity_usergroup o, ModelMap m, HttpServletRequest req) throws Exception {
		return super.update_json(o, m, req);
	}
	
	@RequestMapping("points")
	public void points(String a,activity_usergroup o, ModelMap m, HttpServletRequest req) throws Exception {
		if(a!=null) {
			m.put("a",a);
		}
		Integer type_id=1;
		activity_usergroup ug=service.selectById(o.getId());
		String str=ug.getIds();
    	String[] args=str.split(",");
    	String members="";
    	int num1=args.length;
    	for(int t=0;t<num1;t++) {
    		Integer member=Integer.parseInt(args[t]);
    		members +=uservice.selectById(member).getName()+"  ";
    	}
    	members.substring(0,members.length()-1);
    	ug.setMembers(members);
    	m.put("type",type_id);
		m.put("infos",ug);
		m.put("points",activity_usergroup.getPoints());
	}
	
	/*@RequestMapping("members")
	public void members(activity_usergroup o, ModelMap m, HttpServletRequest req) throws Exception {
		activity_usergroup ug=service.selectById(o.getId());
		String str=ug.getIds();
    	String[] args=str.split(",");
    	String members="";
    	int num1=args.length;
    	for(int t=0;t<num1;t++) {
    		Integer member=Integer.parseInt(args[t]);
    		members +=uservice.selectById(member).getName()+"  ";
    	}
    	members.substring(0,members.length()-1);
    	ug.setMembers(members);
		m.put("infos",ug);
		m.put("points",activity_usergroup.getPoints());
	}*/
	
	@RequestMapping("personAdd")
	public void personAdd(activity_usergroup o, ModelMap m, HttpServletRequest req) throws Exception {
		
		int activity_id=o.getActivity_id();
		//该活动所有成员
		String uIds=aservice.selectById(activity_id).getIds();
		String[] arg0=uIds.split(",");
		int num0=arg0.length;
		int[] array0= new int[num0];
		for(int k=0;k<num0;k++){
			int t=Integer.parseInt(arg0[k]);
			array0[k]=t;
		}
		//已分组成员
		List<activity_usergroup> ugList= service.groupIds(activity_id);
		if(ugList.size()!=0) {
			int num1=ugList.size();
			
			String ids="";
			for(int i=0;i<num1;i++) {
				String str=ugList.get(i).getIds();
				ids +=str+",";
			}
			ids=ids.substring(0,ids.length()-1);
			String[] arg2=ids.split(",");
			int num2=arg2.length;
			int[] array2 =new int[num2];
			for(int k=0;k<num2;k++){
				int t=Integer.parseInt(arg2[k]);
				array2[k]=t;
			}
			//未分组成员
			String finalStr="";
			for(int k=0;k<num0;k++){
				boolean flag=false;
				for(int s=0;s<num2;s++){
					if(array0[k]==array2[s])
						flag=!flag;
				}
				if(!flag){
					finalStr +=array0[k]+",";
				}
			}
			if(finalStr.length()>0) {
				finalStr=finalStr.substring(0,finalStr.length()-1);
				System.out.println(finalStr);
				SearchInfo info= new SearchInfo();
				String where=" b.id="+activity_id+" AND a.id IN("+finalStr+")";
				info.setWhere(where);
				List<activity_user> aulist=service.finalList(info);
				m.put("aulist", aulist);
			}
		}else {
			//全部未分组,直接将该活动人员输出
			List<activity_user> aulist=service.selectByActId(activity_id);
			m.put("aulist", aulist);
		}
		
		
	}
	
}
