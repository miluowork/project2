package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import entity.activity_user;
import entity.activity_usergroup;
import utils.SearchInfo;

@Repository("activity_usergroup_Dao")
public interface activity_usergroup_Dao extends BasicDao {

	@Select("select a.*,b.`name` activityName,c.`name` operatorName FROM activity_usergroup a " + 
			"INNER JOIN activity b on a.activity_id=b.id " + 
			"INNER JOIN activity_operator c  on a.operator_id=c.id ${where} ${limit};")
	public List<activity_usergroup> select(SearchInfo info);
	
	@Select("select a.*,b.`name` activityName,c.`name` operatorName FROM activity_usergroup a " + 
			"INNER JOIN activity b on a.activity_id=b.id " + 
			"INNER JOIN activity_operator c  on a.operator_id=c.id ${where};")
	public List<activity_usergroup> select2(SearchInfo info);
	
	@Select("select a.*,b.`name` activityName,c.`name` operatorName FROM activity_usergroup a " + 
			"INNER JOIN activity b on a.activity_id=b.id " + 
			"INNER JOIN activity_operator c  on a.operator_id=c.id ${where};")
	public List<activity_usergroup> select3(SearchInfo info);
    
    @Select("select * from activity_usergroup where id=#{id}")
	public activity_usergroup selectById(int id);
    
    @Select("select a.*,b.`name` activityName  from activity_user a  " + 
    		"INNER JOIN activity b  on a.activity_id=b.id where  a.activity_id=#{activity_id}")
	public List<activity_user> selectByActId(int activity_id);
	
	@Select("select a.*,b.`name` activityName from activity_usergroup a  INNER JOIN activity b  on a.activity_id=b.id where a.activity_id=#{activity_id}")
	public List<activity_usergroup> groupIds(int activity_id);
    
	@Select("select a.* from activity_user a " + 
			"INNER JOIN activity b on ${where}")
	public List<activity_user> finalList(SearchInfo info);
  
	@Insert("insert into activity_usergroup(activity_id,groupname,path,ids,project,createdate,operator_id,comments) "
			+ "value(#{activity_id},#{groupname},#{path},#{ids},#{project},#{createdate},#{operator_id},#{comments})")
	public void insert(activity_usergroup t);
	
	@Update("update activity_usergroup set activity_id=#{activity_id},groupname=#{groupname},path=#{path},ids=#{ids},project=#{project},point1=#{point1},point2=#{point2}, "
			+ "point3=#{point3},point4=#{point4},point5=#{point5},point6=#{point6},point7=#{point7},point8=#{point8},point9=#{point9}, "
			+ "point10=#{point10},createdate=#{createdate},operator_id=#{operator_id},comments=#{comments} "
			+ " where id=#{id};")
	public void update(activity_usergroup t);
	
	@Delete("delete from activity_usergroup where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from activity_usergroup ${where}")
	public void deleteALL(SearchInfo info); 
}
