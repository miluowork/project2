package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.activity_college;
import entity.activity_user;
import utils.SearchInfo;



    
@Repository("activity_user_Dao")
public interface activity_user_Dao extends BasicDao{
	    @Select("select a.* from activity_user a " + 
	    		"INNER JOIN activity_school b ON a.school_id=b.id " + 
	    		"INNER JOIN activity_college c ON a.college_id=c.id ${where} ${limit};")
		public List<activity_user> select(SearchInfo info);
		
		@Select("select a.* from activity_user a " + 
	    		"INNER JOIN activity_school b ON a.school_id=b.id " + 
	    		"INNER JOIN activity_college c ON a.college_id=c.id ${where};")
		public List<activity_user> select2(SearchInfo info);
	    
	    @Select("select * from activity_user where id=#{id}")
		public activity_user selectById(int id);
	    
	    @Select("select * from activity_college where school_id=#{school_id}")
		public List<activity_college> selectBySchoolId(int id);
	    
		@Insert("insert into activity_user(niki,name,sex,type,ylevel,glevel,slevel,tel,qq,classinfo,school_id,college_id,info,status,createdate,operator_id) "
				+ "value(#{niki},#{name},#{sex},#{type},#{ylevel},#{glevel},#{slevel},#{tel},#{qq},#{classinfo},#{school_id},#{college_id},#{info},#{status},#{createdate},#{operator_id})")
		public void insert(activity_user t);
		
		@Update("update activity_user set niki=#{niki},name=#{name},sex=#{sex},type=#{type},ylevel=#{ylevel},glevel=#{glevel},slevel=#{slevel},tel=#{tel},qq=#{qq},classinfo=#{classinfo},school_id=#{school_id}"
				+ " ,college_id=#{college_id},info=#{info},status=#{status} where id=#{id}")
		public void update(activity_user t);
		
		@Update("update activity_user set pass=#{pass} where id=#{id}")
		public void updatepass(activity_user t);
		
		@Delete("delete from activity_user where id=#{id}")
		public void delete(int id); 
		
		@Delete("delete from activity_user ${where}")
		public void deleteALL(SearchInfo info); 
	
}
