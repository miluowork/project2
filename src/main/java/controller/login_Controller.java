package controller;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.scripting.xmltags.WhereSqlNode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.activity_operator;
import entity.activity_user;
import service.activity_Service;
import service.activity_evaluation_Service;
import service.activity_operator_Service;
import service.activity_user_Service;
import utils.JsonInfo;
import utils.MD5;
import utils.SearchInfo;



@Controller
public class login_Controller {
	@Resource(name="activity_operator_ServiceImpl")
	activity_operator_Service service;
	
	@Resource(name="activity_user_ServiceImpl")
	activity_user_Service uservice;
	
	
	@Resource(name="activity_evaluation_ServiceImpl")
	activity_evaluation_Service eservice;
	
	@Resource(name="activity_ServiceImpl")
	activity_Service aservice;
	

	
	
	@RequestMapping("ologin")
	private @ResponseBody JsonInfo ologin(HttpServletRequest req,SearchInfo info) {
		
		HttpSession session = req.getSession();
		
		String username = req.getParameter("username");
		String password = MD5.MD5(req.getParameter("password"));
		String rcode = req.getParameter("rcode");
		
		info.setLimit(10000);
		info.setWhere("where niki='"+username+"'");
		List<activity_operator> operator = service.select(info);
		String nike = operator.get(0).getNiki();
		String pwd = operator.get(0).getPass();
		
		int type = operator.get(0).getType();
		int id = operator.get(0).getId();
	
		if ((session.getAttribute("randomCode")).toString().equalsIgnoreCase(rcode)) {
			
			if (username.equals(nike) && password.equals(pwd)) {

				if (type==0) {
					session.setAttribute("type", 1);
				}else if (type==1) {
					session.setAttribute("type", 2);
				} 
				
				    session.setAttribute("userid",id);
			        session.setAttribute("username",username);
			        session.setAttribute("operator", service.select(info).get(0));
			        session.setMaxInactiveInterval(1000000 * 60);
			        
					return new JsonInfo(1, "");
		
				
				
			
					
			}else {
				session.setAttribute("error", 1);
				return new JsonInfo(0, "");
			}
			
		}else {
			session.setAttribute("error", 2);
			return new JsonInfo(0, "");
		}
	
	
}
	
	

	@RequestMapping("ulogin")
	private @ResponseBody JsonInfo ulogin(HttpServletRequest req,SearchInfo info) {
		
		HttpSession session = req.getSession();
		
		String username = req.getParameter("username");
		String password = MD5.MD5(req.getParameter("password"));
		
		String rcode = req.getParameter("rcode");
		
		info.setLimit(10000);
		info.setWhere("where niki="+username);
		
		String nike = uservice.select(info).get(0).getNiki();
		String pwd = uservice.select(info).get(0).getPass();
        int type = uservice.select(info).get(0).getType();
        int id = uservice.select(info).get(0).getId();
		if ((session.getAttribute("randomCode")).toString().equalsIgnoreCase(rcode)) {
		
		
			if (username.equals(nike)&&password.equals(pwd)) {
				
				if (type==1) {
					session.setAttribute("type", 3);
				}else {
					session.setAttribute("type", 4);
				}
			       
				 int activity_id = eservice.selectByUserid(id).get(0).getActivity_id();
				
				 session.setAttribute("activity_id",activity_id);
				session.setAttribute("userid",id);
			        session.setAttribute("username",username);
			        session.setAttribute("user", uservice.select(info).get(0));
			        session.setMaxInactiveInterval(1000000 * 60);
			        
					return new JsonInfo(1, "");
		
				
				
			
					
			}else {
				session.setAttribute("error", 1);
				return new JsonInfo(0, "");
			}
			
		}else {
			session.setAttribute("error", 2);
			return new JsonInfo(0, "");
		}
	
	
}
	@RequestMapping("exit")
	public String exit(HttpSession session) {
		
		session.invalidate();
		return "redirect:/login.jsp";
		
	}
	
	
	@RequestMapping("changepass")
	public @ResponseBody JsonInfo changepass(HttpServletRequest req,HttpSession session) {
		
		
		
		String opassword = MD5.MD5(req.getParameter("opassword"));
		String npassword = MD5.MD5(req.getParameter("npassword1"));
		
		
		Integer power = (Integer) session.getAttribute("power");
		Integer id = (Integer) session.getAttribute("userid");
		
		
		
		
		if (power==1||power==2) {
			
			
		
			
			activity_operator operator = service.selectById(id);
			
			if (operator.getPass().equals(opassword)) {
				
				operator.setPass(npassword);
				
				service.update(operator);
				return new JsonInfo(1, "");
				
			}
			
			
			
			return new JsonInfo(-1, "原密码错误");
			
			
			
			
		}else if (power==3||power==4) {
			
			String pass = uservice.selectById(id).getPass();
			
	
			
			
	if (pass.equals(opassword)) {
		
		activity_user user = new activity_user();
				
		user.setPass(npassword);
		user.setId(id);	
		
		System.out.println(user.getPass());
		System.out.println(user.getId());
		uservice.updatepass(user);
		return new JsonInfo(1, "");
				
			
			}	
			
	return new JsonInfo(-1, "原密码错误");
			
		
			
		}else {
			return new JsonInfo(0, "修改失败");
		}
		
		
	
		
		
	
		
	}
	
	
	
	
	
}
