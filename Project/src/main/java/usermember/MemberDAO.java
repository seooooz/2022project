package usermember;

import common.DBConnPool;

public class MemberDAO extends DBConnPool{

	public MemberDAO() {
		super();
	}
	
	// 회원가입 
	public int insertMemberDTO(MemberDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO usermember(name, id, pass) values(?, ?, ?)";
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPass());
			
			result = psmt.executeUpdate();
			
		}
		catch(Exception e) {
			System.out.println("회원가입 중 오류 발생");
			e.printStackTrace();
		}
		return result;
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
			System.out.println("로그인 중 오류 발생");
			e.printStackTrace();
		}
		return dto;
	}
}
