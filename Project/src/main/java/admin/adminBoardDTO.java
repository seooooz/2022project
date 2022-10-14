package admin;

public class adminBoardDTO {

	private String anum;
	private int brd_code;
	private String brd_name;
	private String title;
	private String content;
	private java.sql.Date postdate;
	private String visitcount;
	
	
	public String getAnum() {
		return anum;
	}
	public void setAnum(String anum) {
		this.anum = anum;
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
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public String getBrd_name() {
		return brd_name;
	}
	public void setBrd_name(String brd_name) {
		this.brd_name = brd_name;
	}
	
}
