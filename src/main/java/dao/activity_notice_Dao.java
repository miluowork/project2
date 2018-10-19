package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.activity_notice;
import utils.SearchInfo;

@Repository("activity_notice_Dao")
public interface activity_notice_Dao extends BasicDao  {
	
	@Select("select acno.*,activity.name,acop.`name` operator from activity_notice acno LEFT JOIN activity on acno.activity_id=activity.id\r\n" + 
			"LEFT JOIN  activity_operator  acop on  acno.operator_id=acop.id ${where}")
	public List<activity_notice> select(SearchInfo info);
	
	@Select("select acno.*,activity.name,acop.`name` operator from activity_notice acno LEFT JOIN activity on acno.activity_id=activity.id LEFT JOIN  activity_operator  acop on  acno.operator_id=acop.id where acno.id=#{id}")
	public activity_notice selectById(int id);
	
	@Delete("delete  from activity_notice where id=#{id}")
	public void delete(int id);
	
	@Insert("insert into activity_notice (activity_id,date,operator_id,title,info,status)"
			+ " values(#{activity_id},#{date},#{operator_id},#{title},#{info},#{status})")
	public void insert(activity_notice c);
	
	@Update("update activity_notice set activity_id=#{activity_id},date=#{date},operator_id=#{operator_id},"
			+ "title=#{title},status=#{status},info=#{info} where id=#{id}")
	public void update(activity_notice c);
	
	@Update("update activity_notice set status=#{status} where id=#{id}")
	public void updateStatus(activity_notice c);
	
	@Delete("delete from activity_notice where id in ( ${ids} )")
	public void deleteall(SearchInfo info);

}
