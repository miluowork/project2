package controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


import entity.activity_college;
import service.activity_college_Service;
import service.activity_school_Service;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("activity_college")
public class activity_college_Controller extends Basic_Controller<activity_college>{
@Resource(name="activity_college_ServiceImpl")
activity_college_Service service;

@Resource(name="activity_school_ServiceImpl")
activity_school_Service sservice;




    
      @Override
    	public void index(SearchInfo info, ModelMap m,HttpServletRequest req) throws Exception {
    	  
    
    	
    	  
    	 
    	   
    	  
    	  Integer id;
    	
    	if(req.getParameter("id")==null)
    		
    	 info.setWhere("where school_id="+sservice.select(new SearchInfo()).get(0).getId());
    
    	if(req.getParameter("id")!=null){
    		 id=Integer.parseInt(req.getParameter("id"));
    		 
    		info.setWhere("where school_id="+id);
    	     m.put("school_id",id);
    	}
    	
    	   m.put("slist", sservice.select(new SearchInfo()));
    	   
    		
    		
    	
           
    	List<activity_college> us=(List<activity_college>) service.select(info);
 
   		m.put("result", info);
                                        
    		m.put("clist",us);
    		
    		
    		super.index(info, m, req);
    
    	}
    
    
   
      
    
 
 
      
      @Override
    	public JsonInfo insert_json(activity_college o, ModelMap m, HttpServletRequest req) throws Exception {
    		// TODO Auto-generated method stub
    		return super.insert_json(o, m, req);
    	}
     
      
     @Override
    	public JsonInfo update_json(activity_college o, ModelMap m, HttpServletRequest req) throws Exception {
    		// TODO Auto-generated method stub
    		return super.update_json(o, m, req);
    	}
      
    
      @Override
    	public String add(ModelMap m, HttpServletRequest req) throws Exception {
    	  Integer school_id = Integer.parseInt(req.getParameter("school_id"));
    	  System.out.println(school_id);
    	  m.put("school_id", school_id);
    		m.put("slist", sservice.select(new SearchInfo()));
    		return super.add(m, req);
    	}
      
  
      @Override
    	public String edit(int id, ModelMap m, HttpServletRequest req) throws Exception {
    	    
    		return super.edit(id, m, req);
    	}
      
  
      
   
  

}
