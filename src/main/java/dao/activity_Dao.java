package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import entity.activity;
import entity.activity_user;
import utils.SearchInfo;

@Repository("activity_Dao")
public interface activity_Dao extends BasicDao{

	@Select("select * from activity ${where} ${order} ${limit} ")
	public List<activity> select(SearchInfo info);
	
	@Select("select * from activity_user ${where} ")
	public List<activity_user> userselect(SearchInfo info);
	
	@Delete("delete from activity where id=#{id}")
	public void delete(int id);
	
	@Insert("insert into activity (courseinfo,planinfo,dateinfo,school,college,name,count,classcount,source_operator_id," + 
			"options,attention,type,instructor_user_id,createdate,operator_id,charge_operator_id,status,comments,ids)"
			+ " values(#{courseinfo},#{planinfo},#{dateinfo},#{school},#{college},#{name},#{count},#{classcount},"
			+ "#{source_operator_id},#{options},#{attention},#{type},#{instructor_user_id},#{createdate},#{operator_id},"
			+ "#{charge_operator_id},#{status},#{comments},#{ids})")
	public void insert(activity c);
	@Update("update activity set courseinfo=#{courseinfo},planinfo=#{planinfo},dateinfo=#{dateinfo},school=#{school},college=#{college},"
			+ "name=#{name},count=#{count},classcount=#{classcount},source_operator_id=#{source_operator_id},options=#{options},attention=#{attention},"
			+ "type=#{type},instructor_user_id=#{instructor_user_id},createdate=#{createdate},operator_id=#{operator_id},charge_operator_id=#{charge_operator_id},"
			+ "status=#{status},comments=#{comments},ids=#{ids}"
			+ " where id=#{id}")
	public void update(activity c);
	
	@Delete("delete from activity where id in ( ${ids} )")
	public void deleteall(SearchInfo info);
	
	@Select("select * from activity where id=#{id}")
	public activity selectById(int id);
	
	@Select("select count(*) from activity ${where}")
	public int getMax(SearchInfo info);

	@Select("select name from activity_operator where id=#{id}")
	public String getName(int id);
	
	@Select("select name from activity_user where id=#{id}")
	public String getUsername(int id);
	
}
