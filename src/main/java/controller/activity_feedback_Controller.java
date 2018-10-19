package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.net.ssl.SSLEngineResult.Status;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import entity.activity_feedback;
import entity.activity_user;
import service.activity_Service;
import service.activity_evaluation_Service;
import service.activity_feedback_Service;
import service.activity_user_Service;
import utils.JsonInfo;
import utils.SearchInfo;



	@Controller
	@RequestMapping("activity_feedback")
	public class activity_feedback_Controller extends Basic_Controller<activity_feedback> {
		@Resource(name = "activity_feedback_ServiceImpl")
		activity_feedback_Service service;
		
		@Resource(name = "activity_evaluation_ServiceImpl")
		activity_evaluation_Service eservice;
		
		@Resource(name = "activity_ServiceImpl")
		activity_Service aservice;
		
		
		
		
		@Resource(name = "activity_user_ServiceImpl")
		activity_user_Service uservice;
		
		
		
		
		
	@Override
	public void index(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
		info.setWhere("ORDER BY date DESC");
		List<activity_feedback> af = service.select(info);
	
		Integer activity_id = af.get(0).getActivity_id();
	
		String date = af.get(0).getDate();
		info.setWhere("where af.activity_id="+activity_id+" and date='"+date+"' ORDER BY date DESC");
	
		if (req.getParameter("activity_id")!=null&&req.getParameter("date")!=null) {
			activity_id = Integer.parseInt(req.getParameter("activity_id"));
			 date = req.getParameter("date");
			 
			 info.setWhere("where af.activity_id="+activity_id+" and date='"+date+"' ORDER BY date DESC");
		}
		
		
		
		
		SearchInfo info2 = new SearchInfo();
		info2.setWhere("where af.activity_id="+activity_id);
		System.out.println(info.getWhere());
		m.put("activity_id", activity_id);
		m.put("date", date);
		m.put("optanswers", activity_feedback.optanswers);
		m.put("optquestions", activity_feedback.optquestions);
		m.put("textquestions", activity_feedback.textquestions);
		m.put("datelist", service.select(info2));
		m.put("alist", aservice.select(new SearchInfo()));
		m.put("statuses", activity_feedback.statuses);
		
		super.index(info, m, req);
	}
		
	@RequestMapping("fresult")
	 public  String fresult(ModelMap m,Integer id) {
		m.put("id", id);
		return "activity_feedback/fresult";
		 
	 }
	
		
		
		@RequestMapping("editf")
		public String editf(ModelMap m,SearchInfo info,HttpSession session) throws Exception {
			
			int activity_id =  (Integer) session.getAttribute("activity_id");
			int user_id = (Integer) session.getAttribute("userid");
			
			String temp_str="";   
		    Date dt = new Date();   
		   
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy年 MM月dd日");   
		    temp_str=sdf.format(dt);
		    
		    info.setWhere("where af.activity_id="+activity_id+" and af.user_id="+user_id+" AND af.date='"+temp_str+"'");
		  
		   System.out.println(service.select(info).size());
		    if(service.select(info).size()!=0) {
		    m.put("status", 1);
		 
			return "activity_feedback/edit";
		    }else {
		    	
		    	 m.put("status", 0);
		    	  m.put("date", temp_str);
					return "activity_feedback/edit";
			}
		    
		  
		
			
		}
		
	
		
	
		@RequestMapping("updateresult")
		public @ResponseBody JsonInfo updateresult(activity_feedback o, ModelMap m) throws Exception {
			service.update(o);
			return new JsonInfo(1, "");
			
		}
		
		
		@RequestMapping("activitychange")
		@ResponseBody
		public List<activity_feedback> activitychange(int activity_id,SearchInfo info){
			info.setWhere("where activity_id="+activity_id);
			List<activity_feedback> dlist = service.select(info);
			return dlist;
			
			
			
			
		}
		
		@RequestMapping("changestatus")
		public @ResponseBody JsonInfo changestatus(activity_feedback af) {
			service.updatestatus(af);
			return new JsonInfo(1,"");
			
		}
		
		
	
		

	


}
