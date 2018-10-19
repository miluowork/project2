package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.activity_college;
import utils.SearchInfo;

@Repository("activity_college_Dao")
public interface activity_college_Dao extends BasicDao{
    @Select("select ac.*,ash.name schoolname from activity_college ac left join activity_school ash on ac.school_id=ash.id  ${where} ${limit}")
	public List<activity_college> select(SearchInfo info);
    
	 @Select("select ac.*,ash.name schoolname from activity_college ac left join activity_school ash on ac.school_id=ash.id  ${where}")
		public List<activity_college> select2(SearchInfo info);
		
    @Select("select ac.*,ash.name schoolname from activity_college ac left join activity_school ash on ac.school_id=ash.id where ac.id=#{id}")
	public activity_college selectById(int id);
    
	@Insert("insert into activity_college(name,school_id) value(#{name},#{school_id})")
	public void insert(activity_college ac);
	
	@Update("update activity_college set name=#{name}  where school_id=#{school_id} and id=#{id}")
	public void update(activity_college ac);
	
	@Update("update activity_college set name=#{name},school_id=#{school_id}  where id=#{id}")
	public void updateAll(activity_college ac);
	
	@Delete("delete from activity_college where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from activity_college ${where}")
	public void deleteALL(SearchInfo info); 
	
	
	
}
