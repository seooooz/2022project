package userMember;

import common.DBConnPool;

public class MemberDAO extends DBConnPool{

	public MemberDAO() {
		
	}
	
	// 입력받은 id/pw 일치하는 회원정보 
	public MemberDTO selectMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id = ? and pass = ?";
		
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
