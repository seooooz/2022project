package like;

import java.util.Date;

public class likeBoardDTO {
	private String lnum ;
	private String lid ;
	private String lboard_code ;
	private String page_id;      
	private String is_like ;    
	private Date ldate ;
	public String getLnum() {
		return lnum;
	}
	public void setLnum(String lnum) {
		this.lnum = lnum;
	}
	public String getLid() {
		return lid;
	}
	public void setLid(String lid) {
		this.lid = lid;
	}
	public String getLboard_code() {
		return lboard_code;
	}
	public void setLboard_code(String lboard_code) {
		this.lboard_code = lboard_code;
	}
	public String getPage_id() {
		return page_id;
	}
	public void setPage_id(String page_id) {
		this.page_id = page_id;
	}
	public String getIs_like() {
		return is_like;
	}
	public void setIs_like(String is_like) {
		this.is_like = is_like;
	}
	public Date getLdate() {
		return ldate;
	}
	public void setLdate(Date ldate) {
		this.ldate = ldate;
	}
	
	
}
