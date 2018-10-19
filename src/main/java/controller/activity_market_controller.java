package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.activity_market;
import entity.activity_user;
import service.activity_Service;
import service.activity_market_Service;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("activity_market")
public class activity_market_controller extends Basic_Controller<activity_market> {
	String session="";
	public String getSession() {
		return session;
	}
	public void setSession(String session) {
		this.session = session;
	}
	@Resource(name="activity_market_ServiceImpl")
	activity_market_Service  service;	
	@Resource(name="activity_ServiceImpl")
	activity_Service  servicea;
	String[] selectarray = { "活动", "事件"};
	@Override
	public void index(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
		String txts=info.getTxts();
		
		int select = info.getSelect();
		int selecttxt= info.getSelecttxt();
		int oid=1;
	    /*if (req.getParameter("operator_id")!=null) {
			oid=Integer.valueOf(req.getParameter("operator_id").toString());
		}*/ 
		switch (select) { 
		case 0:
			if (selecttxt==0) {
				/*SearchInfo s=new SearchInfo();
				s.setOrder(" order by id desc");*/
				//info.setSelecttxt(servicea.select(s).get(0).getId());
				info.setWhere(" where activity_id = activity_id");
			}else {
				info.setWhere(" where activity_id = " + info.getSelecttxt());
			}
			info.setOrder(" order by id desc");
		
			break;
		case 1:
			info.setWhere(" where info like '%" + info.getTxt() + "%' ");
			break;
		default:
			break;
		}
		info.setWhere(info.getWhere()+" and operator_id ="+oid );
		if(req.getParameter("txts")!=null){
			info.setWhere(info.getWhere()+" and date >='"+txts+"'");
		}
		info.setMaxPage(service.getMax(info));
		m.put("max", service.getMax(info));
		m.put("info", info);
		m.put("selectarray", selectarray);
		super.index(info, m, req);
	} 
	@RequestMapping("get_json")
	public @ResponseBody List<activity_user> get_json(Integer aid,ModelMap m) {//获取数据库json转化为对象链表 发送至前台
		String s=servicea.selectById(aid).getIds();
		SearchInfo si=new SearchInfo();
		si.setIds(s);
		return service.getIds(si);//获取可操作初始对象
	}   
	@RequestMapping("editjson_json")
	public @ResponseBody String editjson_json(Integer id,ModelMap m,HttpServletResponse response) {//获取数据库json转化为对象链表 发送至前台
		String s=service.getjson(id);//获取json
		return s; 
	}  
	@RequestMapping("save_json")
	public @ResponseBody JsonInfo save_json(String arr) {//把前台发送的对象存为json
		setSession(arr);
		return new JsonInfo(1, "");
	}
	@RequestMapping("editstu")	
	public String editstu(int id, ModelMap m, HttpServletRequest req) throws Exception {
		m.put("info", service.selectById(id));
		return "activity_market/stuedit";
	}
	@Override 
	public String edit(int id, ModelMap m, HttpServletRequest req) throws Exception {
		return super.edit(id, m, req);
	}
	@Override
	public String add(ModelMap m, HttpServletRequest req) throws Exception {
		SearchInfo inf=new SearchInfo();
		inf.setOrder("ORDER BY id desc");
		inf.setPageno(1);
		inf.setLimit(10000);/*
		inf.setWhere("where ids!=''");*/
		m.put("activity", servicea.select(inf));
		return super.add(m, req);
	}   
	@Override
	public JsonInfo insert_json(activity_market o, ModelMap m, HttpServletRequest req) throws Exception {
			SimpleDateFormat fm=new SimpleDateFormat("yyyy年MM月dd日");
			o.setDate(fm.format(new Date()));
			return super.insert_json(o, m, req);
	}
	@Override
	public JsonInfo update_json(activity_market o, ModelMap m, HttpServletRequest req) throws Exception {
		o.setJson(getSession());
		return super.update_json(o, m, req);
	}

}
