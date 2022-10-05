package board3;

public class ReportDTO {
	private int num;				// 시퀀스
	private int target_id;			// 신고 게시물, 댓글 시퀀스 번호
	private int type;				// 1- 게시물 2 - 댓글
	private String id;				// 신고신청한 id
	private String tuid;			// 신고당한 게시물, 댓글 작성자 id
	private String text;			// 신고하는 이유
	private String ip;				// 신고 누른사람 ip
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getTarget_id() {
		return target_id;
	}
	public void setTarget_id(int target_id) {
		this.target_id = target_id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTuid() {
		return tuid;
	}
	public void setTuid(String tuid) {
		this.tuid = tuid;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
	
}
