package board4;

public class SetBoardDTO {
	private int set_num;
	private String set_title;
	private String set_content;
	private int set_code;
	
	public SetBoardDTO() {
		
	}
	
	public SetBoardDTO(int set_num, String set_title, String set_content, int set_code) {
		super();
		this.set_num = set_num;
		this.set_title = set_title;
		this.set_content = set_content;
		this.set_code = set_code;
	}
	public int getSet_num() {
		return set_num;
	}
	public void setSet_num(int set_num) {
		this.set_num = set_num;
	}
	public String getSet_title() {
		return set_title;
	}
	public void setSet_title(String set_title) {
		this.set_title = set_title;
	}
	public String getSet_content() {
		return set_content;
	}
	public void setSet_content(String set_content) {
		this.set_content = set_content;
	}
	public int getSet_code() {
		return set_code;
	}
	public void setSet_code(int set_code) {
		this.set_code = set_code;
	}
}