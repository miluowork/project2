package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.activity_checkwork;
import entity.activity_user;
import utils.SearchInfo;

@Repository("activity_checkwork_Dao")
public interface activity_checkwork_Dao extends BasicDao{

	@Select("SELECT a.*,b.`name` activityName,c.niki userNiki ,c.`name` userName,d.name operatorName from activity_checkwork a " + 
			"INNER JOIN activity b on a.activity_id=b.id " + 
			"INNER JOIN activity_user c ON a.user_id=c.id " + 
			"INNER JOIN activity_operator d ON a.operator_id=d.id ${where} ${limit};")
	public List<activity_checkwork> select(SearchInfo info);
	
	@Select("SELECT a.*,b.`name` activityName,c.niki userNiki,d.name operatorName from activity_checkwork a " + 
			"INNER JOIN activity b on a.activity_id=b.id " + 
			"INNER JOIN activity_user c ON a.user_id=c.id " + 
			"INNER JOIN activity_operator d ON a.operator_id=d.id ${where};")
	public List<activity_checkwork> select2(SearchInfo info);
    
    @Select("select a.*,b.`name` userName from activity_checkwork a INNER JOIN activity_user b on a.user_id=b.id where a.id=#{id}")
	public activity_checkwork selectById(int id);
    
  
	@Insert("insert into activity_checkwork(activity_id,user_id,date,lastdate,operator_id) "
			+ "value(#{activity_id},#{user_id},#{date},#{lastdate},#{operator_id})")
	public void insert(activity_checkwork t);
	
	@Update("update activity_checkwork set activity_id=#{activity_id},user_id=#{user_id},date=#{date},check1=#{check1},check2=#{check2},check3=#{check3},lastdate=#{lastdate},operator_id=#{operator_id},comments=#{comments}"
			+ " where id=#{id}")
	public void update(activity_checkwork t);
	
	@Update("update activity_checkwork set check1=#{check1},check2=#{check2},check3=#{check3},lastdate=#{lastdate},operator_id=#{operator_id},comments=#{comments}"
			+ " where id=#{id}")
	public void allUpdate(activity_checkwork t);
	
	@Update("update activity_checkwork set ${check}=#{checkValue},lastdate=#{lastdate},operator_id=#{operator_id}"
			+ " where date=#{date} and activity_id=#{activity_id}")
	public void quickUpdate(activity_checkwork t);
	
	
	@Update("update activity_checkwork set check1=#{check1},check2=#{check2},check3=#{check3},lastdate=#{lastdate},operator_id=#{operator_id}"
			+ " where date=#{date} and activity_id=#{activity_id}")
	public void reset(activity_checkwork t);
	
	@Delete("delete from activity_checkwork where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from activity_checkwork ${where}")
	public void deleteALL(SearchInfo info); 
}
