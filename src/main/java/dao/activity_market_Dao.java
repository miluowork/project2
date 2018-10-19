package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import entity.activity_market;
import entity.activity_user;
import utils.SearchInfo;

@Repository("activity_market_Dao")
public interface activity_market_Dao extends BasicDao{

	@Select("select * from activity_market ${where} ${order} ${limit} ")
	public List<activity_market> select(SearchInfo info);
	
	@Delete("delete from activity_market where id=#{id}")
	public void delete(int id);
	
	@Insert("insert into activity_market (activity_id,operator_id,date,info,json,comments) "
			+ "values(#{activity_id},#{operator_id},#{date},#{info},#{json},#{comments})")
	public void insert(activity_market c);
	
	@Update("UPDATE activity_market SET activity_id = #{activity_id}, operator_id = #{operator_id}, date = #{date},info=#{info}, json = #{json}, comments = #{comments} where id=#{id}") 
	public void update(activity_market c);
	
	@Delete("delete from activity_market where id in ( ${ids} )")
	public void deleteall(SearchInfo info);
	
	@Select("select * from activity_market where id=#{id}")
	public activity_market selectById(int id);
	
	@Select("select count(*) from activity_market ${where}")
	public int getMax(SearchInfo info);

	@Select("select * from activity_user where id in ( ${ids} )")
	public List<activity_user> getIds(SearchInfo info);
	
	@Select("select json from activity_market where id=#{id}")
	public String getjson(int id);
	
	@Update("update form activity_market set json=#{s}") 
	public String updatejson(String s);
}
