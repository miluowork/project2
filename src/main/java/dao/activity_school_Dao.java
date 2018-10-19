package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;



import entity.activity_school;
import utils.SearchInfo;

@Repository("activity_school_Dao")
public interface activity_school_Dao extends BasicDao{
	
    @Select("select * from activity_school   ${where} ${limit}")
	public List<activity_school> select(SearchInfo info);
	 @Select("select * from activity_school   ${where}")
		public List<activity_school> select2(SearchInfo info);
    
    @Select("select * from activity_school where id=#{id}")
	public activity_school selectById(int id);
    
	@Insert("insert into activity_school(name) value(#{name})")
	public void insert(activity_school as);
	
	@Update("update activity_school set name=#{name}  where id=#{id}")
	public void update(activity_school as);

	@Update("update activity_school set name=#{name} ${where}")
	public void updateAll(activity_school as);
	
	@Delete("delete from activity_school where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from activity_school ${where}")
	public void deleteALL(SearchInfo info); 
	
	
	
}
