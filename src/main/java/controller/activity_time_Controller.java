package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.activity_time;
import service.activity_Service;
import service.activity_operator_Service;
import service.activity_time_Service;
import utils.JsonInfo;
import utils.SearchInfo;



	@Controller
	@RequestMapping("activity_time")
	public class activity_time_Controller extends Basic_Controller<activity_time> {
		@Resource(name = "activity_time_ServiceImpl")
		activity_time_Service service;
		
		@Resource(name = "activity_ServiceImpl")
		activity_Service aservice;
		
		@Resource(name = "activity_operator_ServiceImpl")
		activity_operator_Service oservice;
		
		
		
		@Override
		public void index(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
			List<activity_time> atime = service.select(info);
			
			
			int activity_id = atime.get(0).getActivity_id();
			
			info.setWhere("where activity_id="+activity_id);
			
			
			if (req.getParameter("activity_id")!=null) {
				activity_id = Integer.parseInt(req.getParameter("activity_id"));
				info.setWhere("where activity_id="+activity_id);
				
				
			}
			System.out.println(info.getWhere());
			m.put("activity_id", activity_id);
			
			 m.put("statuses",activity_time.statuses);
			 
		   m.put("alist",aservice.select(new SearchInfo()));
			
			super.index(info, m, req);
		}
		
		@Override
		public String add(ModelMap m, HttpServletRequest req) throws Exception {
			SearchInfo info = new SearchInfo();
			
			
			if (req.getParameter("activity_id")!=null) {
				Integer activity_id =Integer.parseInt(req.getParameter("activity_id"));
				m.put("activity_id", activity_id);
			}
			SearchInfo info2 = new SearchInfo();
			info2.setWhere("where type=0");
			m.put("operator", oservice.select(info2));
			
			 m.put("alist",aservice.select(info));
			 m.put("statuses",activity_time.statuses);
			return super.add(m, req);
		}
		
		
		@Override
		public String edit(int id, ModelMap m, HttpServletRequest req) throws Exception {
			// TODO Auto-generated method stub
			return super.edit(id, m, req);
		}

	
		
		@Override
		public JsonInfo insert_json(activity_time o, ModelMap m, HttpServletRequest req) throws Exception {
			// TODO Auto-generated method stub
			return super.insert_json(o, m, req);
		}
		
		
		@Override
		public JsonInfo update_json(activity_time o, ModelMap m, HttpServletRequest req) throws Exception {
			// TODO Auto-generated method stub
			return super.update_json(o, m, req);
		}


}
