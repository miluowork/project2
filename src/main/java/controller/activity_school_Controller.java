package controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


import entity.activity_school;

import service.activity_school_Service;
import utils.JsonInfo;
import utils.SearchInfo;


@Controller
@RequestMapping("activity_school")
public class activity_school_Controller extends Basic_Controller<activity_school>{
@Resource(name="activity_school_ServiceImpl")
activity_school_Service service;




@Override
	public void index(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		super.index(info, m, req);
	}




  @Override
	public String add(ModelMap m, HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		return super.add(m, req);
	}
  
    @Override
    	public String edit(int id, ModelMap m, HttpServletRequest req) throws Exception {
    		// TODO Auto-generated method stub
    		return super.edit(id, m, req);
    	}
    
    @Override
    	public List<activity_school> index_json(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
    		// TODO Auto-generated method stub
    		return super.index_json(info, m, req);
    	}
    	
    	
    @Override
    	public JsonInfo update_json(activity_school o, ModelMap m, HttpServletRequest req) throws Exception {
    		// TODO Auto-generated method stub
    		return super.update_json(o, m, req);
    	}

    
    
   
      
    
 
 
  
  

}
