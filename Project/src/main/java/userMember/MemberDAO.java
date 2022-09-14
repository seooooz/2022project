package userMember;

import common.DBConnPool;

public class MemberDAO extends DBConnPool{

	public MemberDAO() {
		super();
	}
	
	// 회원가입 
	public MemberDTO insertMemberDTO(String uname, String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "INSERT INTO usermember values(?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPass());
			
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	// 입력받은 id/pw 일치하는 회원정보 
	public MemberDTO selectMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from usermember where id = ? and pass = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
