package entity;

public class activity_summary {
	public  static String [] scx_status={"优秀","良好","一般","较差"};
	public  static String [] t_status={"进行中","已结束"};
	public  static String [] questions={"对此次活动结果的满意程度","对学生们此次活动整体表现的满意程度","对此次活动中自己发挥的指导作用的满意程度","给此次活动的整体状况打分"};
	public  static String [] option1={"正常","良好","一般","较差"};
	public  static String [] option2={"1","2","3","4"};
	 int id;
	 int activity_id;
	 int operator_id;
	 String createdate;
	 String options;
	 int sstatus;
	 int tstatus;
	 int cstatus;
	 int xstatus;
	 String summary;
	 String proposal;
	 String comments;
	 String activityName;
	 String operatorName;
	 
	 
	public activity_summary() {
		super();
	}
	
	public activity_summary(int id, int activity_id, int operator_id, String createdate, String options, int sstatus,
			int tstatus, int cstatus, int xstatus, String summary, String proposal, String comments,
			String activityName, String operatorName) {
		super();
		this.id = id;
		this.activity_id = activity_id;
		this.operator_id = operator_id;
		this.createdate = createdate;
		this.options = options;
		this.sstatus = sstatus;
		this.tstatus = tstatus;
		this.cstatus = cstatus;
		this.xstatus = xstatus;
		this.summary = summary;
		this.proposal = proposal;
		this.comments = comments;
		this.activityName = activityName;
		this.operatorName = operatorName;
	}

	
	
	

	public static String[] getQuestions() {
		return questions;
	}

	public static void setQuestions(String[] questions) {
		activity_summary.questions = questions;
	}

	public static String[] getOption1() {
		return option1;
	}

	public static void setOption1(String[] option1) {
		activity_summary.option1 = option1;
	}

	public static String[] getOption2() {
		return option2;
	}

	public static void setOption2(String[] option2) {
		activity_summary.option2 = option2;
	}

	

	public static String[] getScx_status() {
		return scx_status;
	}

	public static void setScx_status(String[] scx_status) {
		activity_summary.scx_status = scx_status;
	}

	public static String[] getT_status() {
		return t_status;
	}

	public static void setT_status(String[] t_status) {
		activity_summary.t_status = t_status;
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
	public int getOperator_id() {
		return operator_id;
	}
	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public int getSstatus() {
		return sstatus;
	}
	public void setSstatus(int sstatus) {
		this.sstatus = sstatus;
	}
	public int getTstatus() {
		return tstatus;
	}
	public void setTstatus(int tstatus) {
		this.tstatus = tstatus;
	}
	public int getCstatus() {
		return cstatus;
	}
	public void setCstatus(int cstatus) {
		this.cstatus = cstatus;
	}
	public int getXstatus() {
		return xstatus;
	}
	public void setXstatus(int xstatus) {
		this.xstatus = xstatus;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getProposal() {
		return proposal;
	}
	public void setProposal(String proposal) {
		this.proposal = proposal;
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
	public String getOperatorName() {
		return operatorName;
	}
	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}
	 
	 
	 
	 
	 
}
