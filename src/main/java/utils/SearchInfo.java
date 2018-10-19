package utils;

public class SearchInfo {
	private int pageno = 1;
	String where="";
	String txt="";
	private int limit = 6;
	int maxPage;//最大页数
	int prev;
	int next;
	String order;
	int selecttxt;
	String ids;
	String txts="";

	public String getTxts() {
		return txts;
	}
	public void setTxts(String txts) {
		this.txts = txts;
	}
	public String getOrder() {
		return this.order;
	}
	public String getOrders() {
		return this.order==null?"order by id desc":order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public int getSelecttxt() {
		return selecttxt;
	}
	public void setSelecttxt(int selecttxt) {
		this.selecttxt = selecttxt;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int max) {
		double s= Math.ceil((double)max/limit);
		this.maxPage=(int) s;
	}
	public int getPageno() {
		return pageno>maxPage?maxPage:pageno;
	}
	public void setPageno(int pageno) {
		this.pageno = pageno;
	}
	public String getLimit() {
	    return " limit " + (pageno - 1) * limit + "," + limit;
	}
	public void setLimit(int limit) {
	    this.limit = limit;
	}
	public String getTxt() {
		return txt;
	}
	public void setTxt(String txt) {
		
		if(txt==null||txt=="") {
			where=" where status=0 ";
		}else {
			this.txt = txt;
			where=" where fullname like '%"+txt+"%' ";
		}
	}
	
	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public Integer getNext() {
		return pageno<maxPage?pageno+1:maxPage;
	}
	
	public void setNext(int next) {
		this.pageno = next;
	}
	
	public void setPrev(int prev) {
		this.pageno = prev;
	}
	
	public Integer getPrev() {
		return pageno>1?pageno-1:1;
	}

	///////////////补
	Integer select=0;
	private int next_pageno;
	private int prev_pageno;
	private int first_pageno;
	private int last_pageno;
	private int size2;

	public Integer getSelect() {
		return select;
	}
	public void setSelect(Integer select) {
		this.select = select;
	}
	public int getLimits() {
		return limit;
	}
	
	public int getFirst_pageno() {
		return first_pageno;
	}
	public void setFirst_pageno(int first_pageno) {
		this.first_pageno = first_pageno;
	}
	public int getLast_pageno() {
		return last_pageno;
	}
	public void setLast_pageno(int last_pageno) {
		this.last_pageno = last_pageno;
	}

	public int getNext_pageno() {
		return next_pageno;
	}
	public void setNext_pageno(int next_pageno) {
		this.next_pageno = next_pageno;
	}
	public int getPrev_pageno() {
		return prev_pageno;
	}
	public void setPrev_pageno(int prev_pageno) {
		this.prev_pageno = prev_pageno;
	}	private int size;

	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getSize2() {
		return size2;
	}
	public void setSize2(int size2) {
		this.size2 = size2;
	}
}
