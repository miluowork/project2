package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.activity_checkwork;
import entity.activity_summary;
import utils.SearchInfo;

public interface activity_summary_Dao extends BasicDao {

	@Select("SELECT a.*,b.`name` activityName,c.`name` operatorName  from activity_summary a " + 
			"INNER JOIN activity b on a.activity_id=b.id " + 
			"INNER JOIN activity_operator c ON a.operator_id=c.id ${where} ${limit};")
	public List<activity_summary> select(SearchInfo info);
	
	@Select("SELECT a.*,b.`name` activityName,c.`name` operatorName  from activity_summary a " + 
			"INNER JOIN activity b on a.activity_id=b.id " + 
			"INNER JOIN activity_operator c ON a.operator_id=c.id ${where};")
	public List<activity_summary> select2(SearchInfo info);
    
    @Select("select * from activity_summary where id=#{id}")
	public activity_summary selectById(int id);
    
  
	@Insert("insert into activity_summary(activity_id,operator_id,createdate,options,sstatus,tstatus,cstatus,xstatus,summary,proposal,comments) "
			+ "value(#{activity_id},#{operator_id},#{createdate},#{options},#{sstatus},#{tstatus},#{cstatus},#{xstatus},#{summary},#{proposal},#{comments})")
	public void insert(activity_summary t);
	
	@Update("update activity_summary set activity_id=#{activity_id},operator_id=#{operator_id},createdate=#{createdate},options=#{options},sstatus=#{sstatus},tstatus=#{tstatus},cstatus=#{cstatus},xstatus=#{xstatus},summary=#{summary},proposal=#{proposal},comments=#{comments}"
			+ " where id=#{id};")
	public void update(activity_summary t);
	
	@Delete("delete from activity_summary where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from activity_summary ${where}")
	public void deleteALL(SearchInfo info); 
}
