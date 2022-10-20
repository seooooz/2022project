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
			String query = "INSERT INTO usermember(name, id, pass, email) values(?, ?, ?, ?)";
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPass());
			psmt.setString(4, dto.getEmail());
			
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
	
	  public boolean checkId(String id) {
	      boolean result = true;
	      try {
	         String query = "SELECT id from usermember where id = ?";
	         psmt = con.prepareStatement(query);
	         psmt.setString(1, id);
	         rs = psmt.executeQuery();
	         if(rs.next()) {
	            result = false;
	         }
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
	      return result;
	   }
	
	// 비밀번호 찾기 회원정보 일치
	public int findPassword(String name, String id, String email) {
		int result = 0;
		String query = "SELECT * FROM usermember WHERE name = ? and id = ?"
				+ " and email = ? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, name);
			psmt.setString(2, id);
			psmt.setString(3, email);
	
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("비밀번호 찾기 중 오류 발생!!");
			e.printStackTrace();
		}
		return result;
	}
	// 비밀번호 변경
	public int updatePassword(String id, String pass) {
		int result = 0;
		String query = "UPDATE usermember SET pass = ? WHERE id = ? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, pass);
			psmt.setString(2, id);
			
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("비밀번호 변경 중 오류 발생!!");
			e.printStackTrace();
		}
		return result;
	}
	
	// 회원 탈퇴 
	public int userDelete(String id, String pw) {
		int result = 0;
		String query = "DELETE FROM usermember WHERE id=? and pass=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("회원탈퇴 중 오류 발생!!");
			e.printStackTrace();
		}
		return result;
	}
}