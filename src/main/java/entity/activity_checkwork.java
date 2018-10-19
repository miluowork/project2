package entity;

import java.util.Map;

public class activity_checkwork {
	public  static String [] checkes={"--","正常","迟到","早退","请假","未到"};
	int id;
	int activity_id;
	int user_id;
	String date;
	Integer  check1;
	Integer  check2;
	Integer  check3;
	String lastdate;
	int operator_id;
	String comments;
	String activityName;
	String userName;
	String operatorName;
	int checkValue;
	String  check;
	Map<String,Integer> map;
	

	public activity_checkwork(int id, int activity_id, int user_id, String date, Integer check1, Integer check2,
			Integer check3, String lastdate, int operator_id, String comments, String activityName, String userName,
			String operatorName, int checkValue, String check, Map<String, Integer> map) {
		super();
		this.id = id;
		this.activity_id = activity_id;
		this.user_id = user_id;
		this.date = date;
		this.check1 = check1;
		this.check2 = check2;
		this.check3 = check3;
		this.lastdate = lastdate;
		this.operator_id = operator_id;
		this.comments = comments;
		this.activityName = activityName;
		this.userName = userName;
		this.operatorName = operatorName;
		this.checkValue = checkValue;
		this.check = check;
		this.map = map;
	}



	public Map<String, Integer> getMap() {
		return map;
	}



	public void setMap(Map<String, Integer> map) {
		this.map = map;
	}



	public int getCheckValue() {
		return checkValue;
	}

	public void setCheckValue(int checkValue) {
		this.checkValue = checkValue;
	}

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	public activity_checkwork() {
		super();
	}
	
	public static String[] getCheckes() {
		return checkes;
	}
	public static void setCheckes(String[] checkes) {
		activity_checkwork.checkes = checkes;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(int activity_id) {
		this.activity_id = activity_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Integer getCheck1() {
		return check1;
	}
	public void setCheck1(Integer check1) {
		this.check1 = check1;
	}
	public Integer getCheck2() {
		return check2;
	}
	public void setCheck2(Integer check2) {
		this.check2 = check2;
	}
	public Integer getCheck3() {
		return check3;
	}
	public void setCheck3(Integer check3) {
		this.check3 = check3;
	}
	public String getLastdate() {
		return lastdate;
	}
	public void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}
	public int getOperator_id() {
		return operator_id;
	}
	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getOperatorName() {
		return operatorName;
	}
	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}
	
	
	
	

}
