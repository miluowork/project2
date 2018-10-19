package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.activity_college;
import entity.activity_operator;
import service.activity_operator_Service;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("activity_operator")
public class activity_operator_controller extends Basic_Controller<activity_operator>{
	@Resource(name="activity_operator_ServiceImpl")
	activity_operator_Service service;
	String[] selectarray = { "类型", "权限等级","姓名"};
	String[] statusArray= {"禁用","启用"};
	String[] powerArray= {"管理员","操作员"};
	String[] typeArray= {"讲师","市场老师"};
	@Override
	public void index(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
		int select = info.getSelect();
		int selecttxt = info.getSelecttxt();
	switch (select) {
	case 0:
		info.setWhere(" where type = "+selecttxt+" ");
		break;
	case 1:
		info.setWhere(" where power ="+selecttxt+" ");
		break;
	case 2:
		info.setWhere(" where name like '%" + info.getTxt() + "%' ");
		break;}
		info.setMaxPage(service.getMax(info));
		m.put("max",service.getMax(info));
		m.put("info", info);
		m.put("statusArray", statusArray);
		m.put("powerArray", powerArray);
		m.put("typeArray", typeArray);
		m.put("selectarray", selectarray);
		super.index(info, m, req);
	}
	@Override
	public List<activity_operator> index_json(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
		info.setPageno(1); 
		info.setLimit(10000);
		return super.index_json(info, m, req);
	}
	@Override
	public String delete(int id, ModelMap m, HttpServletRequest req) throws Exception {
		return super.delete(id, m, req);
	}
	@Override
	public String add(ModelMap m, HttpServletRequest req) throws Exception {
		m.put("statusArray", statusArray);
		m.put("powerArray", powerArray);
		m.put("typeArray", typeArray);
		return super.add(m, req);
	}
	@Override
	public String edit(int id, ModelMap m, HttpServletRequest req) throws Exception {
		return super.edit(id, m, req);
	}
	@Override
	public String update(activity_operator o, ModelMap m, HttpServletRequest req) throws Exception {
		return super.update(o, m, req);
	}
	@Override
	public String insert(activity_operator o, ModelMap m, HttpServletRequest req) throws Exception {
		return super.insert(o, m, req);
	}
	@Override
	public JsonInfo insert_json(activity_operator o, ModelMap m, HttpServletRequest req) throws Exception {
		o.setNiki(o.getTel());
		return super.insert_json(o, m, req);
	}
	@Override
	public JsonInfo update_json(activity_operator o, ModelMap m, HttpServletRequest req) throws Exception {
		return super.update_json(o, m, req);
	}
}
