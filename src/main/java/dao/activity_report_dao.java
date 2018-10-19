package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import entity.activity_report;
import entity.activity_user;
import utils.SearchInfo;

@Repository("activity_report_dao")
public interface activity_report_dao extends BasicDao{

	@Select("select * from activity_report ${where} ${order} ${limit} ")
	public List<activity_report> select(SearchInfo info);
	
	@Delete("delete from activity_report where id=#{id}")
	public void delete(int id);
	
	@Insert("insert into activity_report (activity_id,operator_id,date,tprogress,sprogress,cprogress,json,comments) "
			+ "values(#{activity_id},#{operator_id},#{date},#{tprogress},#{sprogress},#{cprogress},#{json},#{comments})")
	public void insert(activity_report c);
	
	@Update("UPDATE activity_report SET activity_id = #{activity_id}, operator_id = #{operator_id}, date = #{date}, tprogress = #{tprogress},"
			+ "sprogress = #{sprogress}, cprogress =#{cprogress},json = #{json}, comments = #{comments} where id=#{id}") 
	public void update(activity_report c);
	
	@Delete("delete from activity_report where id in ( ${ids} )")
	public void deleteall(SearchInfo info);
	
	@Select("select * from activity_report where id=#{id}")
	public activity_report selectById(int id);
	
	@Select("select count(*) from activity_report ${where}")
	public int getMax(SearchInfo info);

	@Select("select * from activity_user where id in ( ${ids} )")
	public List<activity_user> getIds(SearchInfo info);
	
	@Select("select json from activity_report where id=#{id}")
	public String getjson(int id);
	
	@Update("update form activity_report set json=#{s}") 
	public String updatejson(String s);
}
