package board4;

import java.sql.Date;

public class QuestionBoardDTO {
	private int qnum;
	private String qid;
	private String qtitle;
	private String qcontent;
	private Date qpostdate;
	private int qvisitcount;
	
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public Date getQpostdate() {
		return qpostdate;
	}
	public void setQpostdate(Date qpostdate) {
		this.qpostdate = qpostdate;
	}
	public int getQvisitcount() {
		return qvisitcount;
	}
	public void setQvisitcount(int qvisitcount) {
		this.qvisitcount = qvisitcount;
	}
	
}