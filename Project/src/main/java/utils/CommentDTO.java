package utils;

public class CommentDTO {

	private String idx;					// 댓글 인덱스
	private String id;					// 작성자 id
	private int code;					// 게시물 코드		1 - skill 2 - career 3 - offer
	private String postNum;				// 게시글 인덱스
	private java.sql.Date date;			// 댓글 작성 날짜
	private String comment;				// 댓글 내용
	private int comClass;				// 댓글 계층		0 - 부모(댓글) 1 - 자식(대댓글)
	private int order;					// 댓글, 대댓글 순서 정렬
	private String groupNum;				// 댓글 그룹		부모 = 댓글 인덱스 , 자식 = 부모 댓글 인덱스
	
	
	
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}

	public String getPostNum() {
		return postNum;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public java.sql.Date getDate() {
		return date;
	}
	public void setDate(java.sql.Date date) {
		this.date = date;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getComClass() {
		return comClass;
	}
	public void setComClass(int comClass) {
		this.comClass = comClass;
	}
	
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public String getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(String groupNum) {
		this.groupNum = groupNum;
	}
	
	
	
	
}
