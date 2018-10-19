package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.activity_time;
import entity.activity_time;
import utils.SearchInfo;

@Repository("activity_time_Dao")
public interface activity_time_Dao extends BasicDao {

	@Select("select act.*,activity.`name`,ao.`name` oname from activity_time act LEFT JOIN  activity on act.activity_id=activity.id LEFT JOIN activity_operator ao ON act.operator_id=ao.id ${where} ")
	public List<activity_time> select(SearchInfo info);
	

    @Select("select * from activity_time where id=#{id}")
	public activity_time selectById(int id);
    
	@Insert("insert into activity_time(name) value(#{name})")
	public void insert(activity_time as);
	
	@Update("update activity_time set activity_id=#{activity_id},date=#{date},time1=#{time1},time2=#{time2},time3=#{time3},time4=#{time4},time5=#{time5},time6=#{time6},roominfo=#{roominfo},operator_id=#{operator_id},status=#{status},comments=#{comments} where id=#{id}")
	public void update(activity_time as);

	@Update("update activity_time set name=#{name} ${where}")
	public void updateAll(activity_time as);
	
	@Delete("delete from activity_time where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from activity_time ${where}")
	public void deleteALL(SearchInfo info); 
	
}
