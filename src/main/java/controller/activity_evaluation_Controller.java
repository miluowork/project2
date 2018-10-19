package controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.activity;
import entity.activity_evaluation;
import service.activity_Service;
import service.activity_evaluation_Service;
import service.activity_user_Service;
import utils.JsonInfo;
import utils.SearchInfo;



	@Controller
	@RequestMapping("activity_evaluation")
	public class activity_evaluation_Controller extends Basic_Controller<activity_evaluation> {
		@Resource(name = "activity_evaluation_ServiceImpl")
		activity_evaluation_Service service;
		
		
		@Resource(name = "activity_ServiceImpl")
		activity_Service aservice;
		
		@Resource(name = "activity_user_ServiceImpl")
		activity_user_Service uservice;
		
		
		@Override
		public void index(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
			
			
			String where="";
			Integer activity_id=aservice.select(info).get(0).getId();
			if (req.getParameter("activity_id")!=null) {
				activity_id=Integer.parseInt(req.getParameter("activity_id"));
			}
			
			where="where ae.activity_id="+activity_id;
			System.out.println(where);
			info.setWhere(where);
			List<activity_evaluation> evaluation = service.select(info);
			//
            activity activity = aservice.selectById(activity_id);
			
			String[] ids=activity.getIds().split(",");
			int[] user_ids = new int[ids.length];
			for(int i=0;i<ids.length;i++) {			
				Integer userid=Integer.parseInt(ids[i]);
				user_ids[i]=userid;
	
			}
			//
	        if(evaluation==null) {
					List<Integer> differentids = new ArrayList<Integer>();
					
					for (int i = 0; i < user_ids.length; i++) {
				        	   differentids.add(user_ids[i]);
				       }
				       for (Integer user_id : differentids) {
				           System.out.println("differentids"+user_id);
				           activity_evaluation evaluation2 = new activity_evaluation();
				           evaluation2.setActivity_id(activity_id);
				           evaluation2.setUser_id(user_id);
				           
				           service.insert(evaluation2);
				}
	        }else {
	        	if (user_ids.length>evaluation.size()) {
					
					List<Integer> differentids = new ArrayList<Integer>();
					
					for (int i = 0; i < user_ids.length; i++) {
				           int n = 0;// 记录evaluation中与user_ids相等的元素个数
				           for (int j = 0; j <evaluation.size(); j++) {
				               if ((user_ids[i])==(evaluation.get(j).getUser_id())) {
				                   n++;
				               }
				           }
				           if (n == 0) {// arr2中所有元素与arr1中的第i个元素都不相等，记录该值
				        	   differentids.add(user_ids[i]);
				           }
				       }
				       for (Integer user_id : differentids) {
				           System.out.println("differentids"+user_id);
				           activity_evaluation evaluation2 = new activity_evaluation();
				           evaluation2.setActivity_id(activity_id);
				           evaluation2.setUser_id(user_id);
				           
				           service.insert(evaluation2);
				           
				       }
				       
				       
				
				}
	        }
			 
			
			
			List<activity_evaluation> elist=service.select(info);
			System.out.println(elist.get(0).getUsername());
			
			m.put("elist",elist);
			m.put("alist", aservice.select(new SearchInfo()));
			m.put("activity_id", activity_id);
			
			
			
			super.index(info, m, req);
		}
		
		@RequestMapping("batch")
		public String batch(String ids,ModelMap m) {
			m.put("ids", ids);
			return "activity_evaluation/batch";
			
		}
		
		@RequestMapping("batchupdate")
		public @ResponseBody JsonInfo batchupdate(String ids,int point) {
			
			String[] idss=ids.split(",");
			for(int i=0;i<idss.length;i++) {			
				int id=Integer.parseInt(idss[i]);
			
				
				activity_evaluation evaluation = service.selectById(id);
				evaluation.setPoint(point);
				service.update(evaluation);
	
			}
			
			return new JsonInfo(1, "");
			
		}
		
		
		@Override
		public String edit(int id, ModelMap m, HttpServletRequest req) throws Exception {
		   m.put("statuses", activity_evaluation.statuses);
			return super.edit(id, m, req);
		}
		
		@Override
		public String add(ModelMap m, HttpServletRequest req) throws Exception {
			// TODO Auto-generated method stub
			return super.add(m, req);
		}
		
		
		@RequestMapping("changestatus")
		public @ResponseBody JsonInfo changestatus(int id) {
			activity_evaluation ae = service.selectById(id);
			
			if (ae.getStatus()==0) {
				ae.setStatus(1);
				System.out.println("status="+ae.getStatus());
				service.update(ae);
			}else {
				ae.setStatus(0);
				service.update(ae);
				System.err.println("status="+ae.getStatus());
			}
			return new JsonInfo(1, "");
			
		}

}
