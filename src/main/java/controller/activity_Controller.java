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
import org.springframework.web.bind.annotation.ResponseBody;

import entity.activity;
import entity.activity_college;
import entity.activity_user;
import service.activity_Service;
import service.activity_college_Service;
import service.activity_school_Service;

import service.activity_user_Service;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("activity")
public class activity_Controller extends Basic_Controller<activity> {
	@Resource(name = "activity_ServiceImpl")
	activity_Service service;

	String[] selectarray = { "类型", "学校名称", "负责人", "发起人","状态", "活动名" };
	String[] tools = { "投影", "话筒", "音响", "讲台", "灯设备" };
	String[] types = { "实训", "宣讲", "活动" };
	String[] status = { "未启用", "正在进行", "已经结束" };

	@Override
	public void index(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
			int select = info.getSelect();
			int selecttxt = info.getSelecttxt();
			String txts=info.getTxts();
			info.setOrder(" order by id desc");
		switch (select) {
		case 0:
			info.setWhere(" where type = " + selecttxt + " ");
			break;
		case 1:
			info.setWhere(" where school like '%" + info.getTxt() + "%' ");
			break;
		case 2:
			info.setWhere(" where charge_operator_id ="+selecttxt+" ");
			break;
		case 3:
			info.setWhere(" where source_operator_id ="+selecttxt+" ");
			break;
		case 4:
			info.setWhere(" where status = " + selecttxt + " ");
			break;
		case 5:
			info.setWhere(" where name like '%" + info.getTxt() + "%' ");
			break;
		default:
			break;
		}
		if (txts.length()>0&&txts!=null) {
			info.setWhere(info.getWhere()+" and createdate>='"+txts+"'");
		}
		info.setMaxPage(service.getMax(info));
		m.put("max", service.getMax(info));
		m.put("info", info);
		m.put("list", service.select(info));
		m.put("types", types);
		m.put("status", status);
		m.put("selectarray", selectarray);
		super.index(info, m, req);
	}
@Override
public List<activity> index_json(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
	info.setPageno(1);
	info.setLimit(10000);
	return super.index_json(info, m, req);
}
	@RequestMapping("course")
	public void course_json(String data, ModelMap m, HttpServletRequest req) throws Exception {
		String[] d = data.split(",");
		ArrayList<String> list = new ArrayList<String>();
		for (String s : d) {
			list.add(s);
		}
		m.put("list", list);
	}

	@RequestMapping("date")
	public void date_json(String data, ModelMap m, HttpServletRequest req) throws Exception {
		String[] d = data.split(",");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		ArrayList<String> list = new ArrayList<String>();
		for (String s : d) {
			list.add(s);
		}
		m.put("list", list);
	}

	@RequestMapping("plan")
	public void plan_json(String data, ModelMap m, HttpServletRequest req) throws Exception {
		String[] d = data.split(",");
		ArrayList<String> list = new ArrayList<String>();
		for (String s : d) {
			list.add(s);
		}
		m.put("list", list);
	}

	@RequestMapping("toolchoose")
	public void tool_json(String data, ModelMap m, HttpServletRequest req) throws Exception {
		String[] d = data.split(",");
		ArrayList<Integer> list = new ArrayList<Integer>();
		for (String s : d) {
			list.add(Integer.parseInt(s.toString()));
		}
		m.put("tools", tools);
		m.put("list", d);
	}

	@RequestMapping("student")
	public void student(Integer id, ModelMap m, HttpServletRequest req) throws Exception {
		String idss = service.selectById(id).getIds();
		String[] ids = idss.split(",");
		ArrayList<activity_user> list = new ArrayList<activity_user>();
		if (idss!=null&&idss.length()>0) {
			for (String s : ids) {
				list.add(uservice.selectById(Integer.parseInt(s.toString())));
			}
			m.put("list", list);
		}
		m.put("aid", id);
	}

	@RequestMapping("select_json")
	public String select_json(Integer id1, Integer id2, Integer id3, Integer id4, ModelMap m) {
		m.put("id1", service.getName(id1));
		m.put("id2", service.getName(id2));
		m.put("id3", service.getUsername(id3));
		m.put("id4", service.getName(id4));
		return "activity/manmessage";
	}

	@Override
	public String delete(int id, ModelMap m, HttpServletRequest req) throws Exception {
		return super.delete(id, m, req);
	}

	@Override
	public String add(ModelMap m, HttpServletRequest req) throws Exception {
		if (m.get("info")!=null) {
			activity a = (activity) m.get("info");
			m.put("optionlist", a.getOptions().split(","));
			m.put("courselist", a.getCourseinfo().split(","));
		}
		m.put("types", types);
		m.put("tools", tools);
		m.put("status", status);
		return super.add(m, req);
	}

	@Resource(name = "activity_user_ServiceImpl")
	activity_user_Service uservice;

	@Resource(name = "activity_college_ServiceImpl")
	activity_college_Service cservice;

	@Resource(name = "activity_school_ServiceImpl")
	activity_school_Service sservice;

	@RequestMapping("adduser")
	public String user_add(ModelMap m, HttpServletRequest req) throws Exception {
		SearchInfo info = new SearchInfo();
		uservice.pack(m, info);
		int aid = Integer.valueOf(req.getParameter("activityid").toString());
		m.put("activityid", aid);
		return "activity_user/stuinsert";
	}
	@RequestMapping("user_insert_json")
	public @ResponseBody JsonInfo user_insert_json(activity_user o, ModelMap m, HttpServletRequest req)
			throws Exception {
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 hh:mm:ss");
		String createdate = sdf.format(date);
		o.setCreatedate(createdate);
		o.setOperator_id(1);
		SearchInfo info = new SearchInfo();
		int aid = Integer.valueOf(req.getParameter("activityid").toString());
		activity at = service.selectById(aid);
		info.setWhere(" where tel='" + o.getTel() + "' and name='" + o.getName() + "'");
		Integer id=0;
		if (service.userselect(info).size() > 0) {// 已存在
			uservice.update(service.userselect(info).get(0));
			id=service.userselect(info).get(0).getId();
		} else {
			uservice.insert(o);
			id=uservice.Maxid();
			System.out.println(id);
		}
		
		String ids = service.selectById(aid).getIds();
		if (ids!=null&&ids.length()>0) {
			ids=ids+","+id.toString();
		}else {
			ids=id.toString();
		}
		info.setWhere(" where id in ("+ids+")");
		List<activity_user> al= service.userselect(info);
		
		ids="";
		for (activity_user a:al) {
			ids=ids+a.getId()+",";
		}
		ids=ids.substring(0, ids.length()-1);
		at.setIds(ids);
		service.update(at);
		return new JsonInfo(1, "");
	}
	
	@RequestMapping("usershow")
	public String usershow(int id, ModelMap m, HttpServletRequest req) throws Exception {
		activity_user us=uservice.selectById(id);
		List<activity_college> clist=uservice.selectBySchoolId(us.getSchool_id());
		m.put("infos", us);
		m.put("clist", clist);
		m.put("mark", 1);
		SearchInfo info= new SearchInfo();
		List<activity> act= service.select(info);
		m.put("aList",act);
		uservice.pack(m, info);
		return "activity_user/edit";
	}
	@Override
	public String edit(int id, ModelMap m, HttpServletRequest req) throws Exception {
		return super.edit(id, m, req);
	}

	@Override
	public String update(activity o, ModelMap m, HttpServletRequest req) throws Exception {
		return super.update(o, m, req);
	}

	@Override
	public String insert(activity o, ModelMap m, HttpServletRequest req) throws Exception {
		return super.insert(o, m, req);
	}
	@RequestMapping("delids_json")
	public @ResponseBody JsonInfo delids_json(Integer aid,String ids) {
		activity o=service.selectById(aid);
		o.setIds(ids);
		service.update(o);
		return new JsonInfo(1, "");
	}
	@Override
	public JsonInfo update_json(activity o, ModelMap m, HttpServletRequest req) throws Exception {
		return super.update_json(o, m, req);
	}
	@Override
	public JsonInfo insert_json(activity o, ModelMap m, HttpServletRequest req) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		o.setCreatedate(sdf.format(new Date()));
		return super.insert_json(o, m, req);
	}
}
