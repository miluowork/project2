package entity;

public class activity_usergroup {
	public  static String [] points={"0","1","2","3","4","5","6","7","8","9","10"};
	int id;
	int activity_id;
	String ids;
	String project;
	String path;
	int point1;
	int point2;
	int point3;
	int point4;
	int point5;
	int point6;
	int point7;
	int point8;
	int point9;
	int point10;
	String qq;
	String createdate;
	int operator_id;
	String comments;
	String activityName;
	String operatorName;
	String members;
	String groupname;
	
	public activity_usergroup() {
		super();
	}


	public activity_usergroup(int id, int activity_id, String ids, String project, String path, int point1, int point2,
			int point3, int point4, int point5, int point6, int point7, int point8, int point9, int point10, String qq,
			String createdate, int operator_id, String comments, String activityName, String operatorName,
			String members, String groupname) {
		super();
		this.id = id;
		this.activity_id = activity_id;
		this.ids = ids;
		this.project = project;
		this.path = path;
		this.point1 = point1;
		this.point2 = point2;
		this.point3 = point3;
		this.point4 = point4;
		this.point5 = point5;
		this.point6 = point6;
		this.point7 = point7;
		this.point8 = point8;
		this.point9 = point9;
		this.point10 = point10;
		this.qq = qq;
		this.createdate = createdate;
		this.operator_id = operator_id;
		this.comments = comments;
		this.activityName = activityName;
		this.operatorName = operatorName;
		this.members = members;
		this.groupname = groupname;
	}


	
	public String getGroupname() {
		return groupname;
	}


	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}


	public String getMembers() {
		return members;
	}


	public void setMembers(String members) {
		this.members = members;
	}


	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public static String[] getPoints() {
		return points;
	}

	public static void setPoints(String[] points) {
		activity_usergroup.points = points;
	}

	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	public String getOperatorName() {
		return operatorName;
	}
	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
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
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getPoint1() {
		return point1;
	}
	public void setPoint1(int point1) {
		this.point1 = point1;
	}
	public int getPoint2() {
		return point2;
	}
	public void setPoint2(int point2) {
		this.point2 = point2;
	}
	public int getPoint3() {
		return point3;
	}
	public void setPoint3(int point3) {
		this.point3 = point3;
	}
	public int getPoint4() {
		return point4;
	}
	public void setPoint4(int point4) {
		this.point4 = point4;
	}
	public int getPoint5() {
		return point5;
	}
	public void setPoint5(int point5) {
		this.point5 = point5;
	}
	public int getPoint6() {
		return point6;
	}
	public void setPoint6(int point6) {
		this.point6 = point6;
	}
	public int getPoint7() {
		return point7;
	}
	public void setPoint7(int point7) {
		this.point7 = point7;
	}
	public int getPoint8() {
		return point8;
	}
	public void setPoint8(int point8) {
		this.point8 = point8;
	}
	public int getPoint9() {
		return point9;
	}
	public void setPoint9(int point9) {
		this.point9 = point9;
	}
	public int getPoint10() {
		return point10;
	}
	public void setPoint10(int point10) {
		this.point10 = point10;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
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
	
	

}
