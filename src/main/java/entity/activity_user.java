package entity;

import java.io.Serializable;

public class activity_user implements Serializable {

	public static String[] genders = { "男", "女" };
	public static String[] statuses = { "正常", "禁止", "过期" };
	public static String[] yleveles = { "无", "专升本", "公务员", "考研", "工作" };
	public static String[] gleveles = { "无", "A", "B", "C", "D", "E", "F" };
	public static String[] sleveles = { "无", "未联系", "已联系", "预报名", "已报名", "终结" };
	public static String[] types = { "学生", "辅导员", "临时" };
	int id;
	String niki;
	String pass;
	String name;
	int sex;
	int type;
	String tel;
	String qq;
	String classinfo;
	String info;
	String createdate;
	int status;
	int ylevel;
	int glevel;
	int slevel;
	int school_id;
	int college_id;
	int operator_id;

	public static String[] getTypes() {
		return types;
	}

	public static void setTypes(String[] types) {
		activity_user.types = types;
	}

	public static String[] getGenders() {
		return genders;
	}

	public static void setGenders(String[] genders) {
		activity_user.genders = genders;
	}

	public static String[] getStatuses() {
		return statuses;
	}

	public static void setStatuses(String[] statuses) {
		activity_user.statuses = statuses;
	}

	public static String[] getYleveles() {
		return yleveles;
	}

	public static void setYleveles(String[] yleveles) {
		activity_user.yleveles = yleveles;
	}

	public static String[] getGleveles() {
		return gleveles;
	}

	public static void setGleveles(String[] gleveles) {
		activity_user.gleveles = gleveles;
	}

	public static String[] getSleveles() {
		return sleveles;
	}

	public static void setSleveles(String[] sleveles) {
		activity_user.sleveles = sleveles;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNiki() {
		return niki;
	}

	public void setNiki(String niki) {
		this.niki = niki;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getClassinfo() {
		return classinfo;
	}

	public void setClassinfo(String classinfo) {
		this.classinfo = classinfo;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getYlevel() {
		return ylevel;
	}

	public void setYlevel(int ylevel) {
		this.ylevel = ylevel;
	}

	public int getGlevel() {
		return glevel;
	}

	public void setGlevel(int glevel) {
		this.glevel = glevel;
	}

	public int getSlevel() {
		return slevel;
	}

	public void setSlevel(int slevel) {
		this.slevel = slevel;
	}

	public int getSchool_id() {
		return school_id;
	}

	public void setSchool_id(int school_id) {
		this.school_id = school_id;
	}

	public int getCollege_id() {
		return college_id;
	}

	public void setCollege_id(int college_id) {
		this.college_id = college_id;
	}

	public int getOperator_id() {
		return operator_id;
	}

	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}

}
