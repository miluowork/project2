package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.activity_feedback;
import utils.SearchInfo;

@Repository("activity_feedback_Dao")
public interface activity_feedback_Dao extends BasicDao{
    @Select("select af.*,activity.name activity_name,user.name user_name from activity_feedback af left JOIN  activity on af.activity_id=activity.id left join activity_user user on af.user_id=user.id  ${where} ")
	public List<activity_feedback> select(SearchInfo info);
	
	
	
    
    @Select("select af.*,activity.name activity_name,user.name user_name from activity_feedback af left JOIN  activity on af.activity_id=activity.id left join activity_user user on af.user_id=user.id where id=#{id}")
	public activity_feedback selectById(int id);
    
	/*@Insert("insert into  activity_feedback(activity_id,user_id,opt1,opt2,opt3,opt4,opt5,opt6,opt7,opt8,opt9,opt10,text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,result,status)"
			+ " value(#{activity_id},#{user_id},#{opt1},#{opt2},#{opt3},#{opt4},#{opt5},#{opt6},#{opt7},#{opt8},#{opt9},#{opt10},#{text1},#{text2},#{text3},#{text4},#{text5},#{text6},#{text7},#{text8},#{text9},#{text10},#{result},#{status})")
	public void insert(activity_feedback ac);*/
	
	@Insert("insert into  activity_feedback(activity_id,user_id,status,date,opt1,opt2,text1,text2) value(#{activity_id},#{user_id},#{status},#{date},#{opt1},#{opt2},#{text1},#{text2})")
	public void insert(activity_feedback ac);
	
	@Update("update activity_feedback set result=#{result} where id=#{id}")
	public void update(activity_feedback ac);
	
	@Update("update activity_feedback set status=#{status} where id=#{id}")
	public void updatestatus(activity_feedback ac);
	
	@Update("update activity_feedback set activity_id=#{activity_id},user_id=#{user_id},opt1=#{opt1},opt2=#{opt2},opt3=#{opt3},opt4=#{opt4},opt5=#{opt5},opt6=#{opt6},opt7=#{opt7},opt8=#{opt8},opt9=#{opt9},opt10=#{opt10},text1=#{text1},text2=#{text2},text3=#{text3},text4=#{text4},text5=#{text5},text6=#{text6},text7=#{text7},text8=#{text8},text9=#{text9},text10=#{text10},result=#{result},status=#{status}  where id=#{id}")
	public void updateAll(activity_feedback ac);
	
	@Delete("delete from activity_feedback where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from activity_feedback ${where}")
	public void deleteALL(SearchInfo info); 
	
	
	
}
