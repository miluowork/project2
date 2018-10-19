package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.activity_evaluation;
import utils.SearchInfo;

@Repository("activity_evaluation_Dao")
public interface activity_evaluation_Dao extends BasicDao{
    @Select("select ae.*,activity.name activity,au.name username from activity_evaluation ae left join activity on ae.activity_id=activity.id LEFT JOIN activity_user au on ae.user_id=au.id  ${where} ")
	public List<activity_evaluation> select(SearchInfo info);
	
	
	@Select("select ae.*,activity.name activity,au.name username from activity_evaluation ae left join activity on ae.activity_id=activity.id LEFT JOIN activity_user au on ae.user_id=au.id  where ae.user_id=#{id} order by id desc ")
	public List<activity_evaluation> selectByUserid(int user_id);
    
		
    @Select("select ae.*,activity.name activity,au.name username from activity_evaluation ae left join activity on ae.activity_id=activity.id LEFT JOIN activity_user au on ae.user_id=au.id where ae.id=#{id}")
	public activity_evaluation selectById(int id);
    
	@Insert("insert into activity_evaluation(activity_id,user_id) value(#{activity_id},#{user_id})")
	public void insert(activity_evaluation ae);
	
	@Update("update activity_evaluation set activity_id=#{activity_id},user_id=#{user_id},point=#{point},status=#{status},comments=#{comments}  where id=#{id}")
	public void update(activity_evaluation ae);
	

	
	
	
	@Delete("delete from activity_evaluation where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from activity_evaluation ${where}")
	public void deleteALL(SearchInfo info); 
	
	
	
	
	
}
