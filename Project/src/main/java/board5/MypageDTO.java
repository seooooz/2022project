package board5;



public class MypageDTO {
	private String id;
	private String email;
	private String job;


	

	public MypageDTO() {
		
	}

	public MypageDTO(String id, String job,String email) {
		this.id =id;
		this.job = job;
		this.email = email;
	}
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getJob() {
		return job;
	}


	public void setJob(String job) {
		this.job = job;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
