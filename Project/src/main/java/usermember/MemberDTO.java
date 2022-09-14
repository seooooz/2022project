package usermember;

public class MemberDTO {
	private String name;
	private String id;
	private String pass;
	
	public MemberDTO() {
		
	}
	
	public MemberDTO(String name, String id, String pass) {
		this.name = name;
		this.id = id;
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	
}
