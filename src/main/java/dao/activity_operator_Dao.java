package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import entity.activity_operator;
import utils.SearchInfo;

@Repository("activity_operator_Dao")
public interface activity_operator_Dao extends BasicDao{

	@Select("select * from activity_operator ${where} ${limit} ")
	public List<activity_operator> select(SearchInfo info);

	@Delete("delete from activity_operator where id=#{id}")
	public void delete(int id);
	
	@Insert("insert into activity_operator (power,status,niki,pass,name,type,tel,comments)"
			+ " values(#{power},#{status},#{niki},#{pass},#{name},#{type},#{tel},#{comments})")
	public void insert(activity_operator c);
	
	@Update("update activity_operator set power=#{power},status=#{status},niki=#{niki},"
			+ "pass=#{pass},name=#{name},type=#{type},tel=#{tel},comments=#{comments} where id=#{id}")
	public void update(activity_operator c);
	
	@Delete("delete from activity_operator where id in ( ${ids} )")
	public void deleteall(SearchInfo info);
	
	@Select("select * from activity_operator where id=#{id}")
	public activity_operator selectById(int id);
	
	@Select("select count(*) from activity_operator ${where}")
	public int getMax(SearchInfo info);
}
