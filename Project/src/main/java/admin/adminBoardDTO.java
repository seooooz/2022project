package admin;

public class adminBoardDTO {
	
	private int num;
	private int brd_code;
	private String title;
	private String content;
	private java.sql.Date postdate;
	private int visitcount;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBrd_code() {
		return brd_code;
	}
	public void setBrd_code(int brd_code) {
		this.brd_code = brd_code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public int getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}
	
}
