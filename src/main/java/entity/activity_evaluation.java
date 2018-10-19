package entity;

import java.io.Serializable;

public class activity_evaluation implements Serializable {
	
	private int id;
	private int activity_id;
	private int user_id;
	private int point;
	private int status;
	private String comments;
	private String activity;
	private String username;
	
	
public static String[] statuses = {"状态1","状态2"};


	
	

	public int getId() {
	return id;
}


public void setId(int id) {
	this.id = id;
}


public String getComments() {
	return comments;
}


public void setComments(String comments) {
	this.comments = comments;
}


	public void setStatuses(String[] statuses) {
	this.statuses = statuses;
}


	public String getStatuses() {
		return statuses[status];
		
	}
	
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	
	

}
