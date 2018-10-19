package entity;

import java.io.Serializable;

public class activity_college implements Serializable{

	
	private int id;
	private int school_id;
	private String name;
	private String schoolname;
	
	
	public activity_college() {
	}
	
	
	

	public activity_college(int id, String name, int school_id) {
		super();
		this.id = id;
		this.name = name;
		this.school_id = school_id;
	
	}

	

	
	public String getSchoolname() {
		return schoolname;
	}




	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}




	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}




	public int getSchool_id() {
		return school_id;
	}




	public void setSchool_id(int school_id) {
		this.school_id = school_id;
	}

	
}
