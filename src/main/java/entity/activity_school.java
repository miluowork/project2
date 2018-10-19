package entity;

import java.io.Serializable;

public class activity_school implements Serializable{

	
	private int id;
	private String name;
	
	
	public activity_school() {
	}
	
	
	

	public activity_school(int id, String name, int parentid) {
		super();
		this.id = id;
		this.name = name;
	
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

	
}
