package board4;

import java.util.ArrayList;

import common.DBConnPool;

public class SetBoardDAO extends DBConnPool{
	
	public SetBoardDAO() {
		super();
	}
	
	// 세팅 방법 게시글 작성
	public int SetboardInsert(String title, String content, int code) {
		int result = 0; 
		String query = "INSERT INTO setboard (set_num,set_title,set_content,set_code) "
				+ " VALUES((SELECT NVL(MAX(set_num),0)+1 FROM setboard),?,?,?)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1,title);
			psmt.setString(2, content);
			psmt.setInt(3, code);
			
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("세팅방법 글 작성 중 오류발생!!!");
			e.printStackTrace();
		}
		return result;
	}
	
	// 세팅 방법 게시글 수정
	public int SetboardUpdate(String num, String title, String content,int code) {
		int result = 0;
		String query = "UPDATE setboard SET set_title=?, set_content=? "
				+ " WHERE set_num = ? and set_code=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, num);
			psmt.setInt(4, code);
			
			result = psmt.executeUpdate();
			
			
		}catch(Exception e) {
			System.out.println("세팅방법 글 업데이트 중 오류 발생!!!");
			e.printStackTrace();
		}
		return result;
	}
	// 세팅방법 목록 출력
	public ArrayList<SetBoardDTO> SetboardList(int num){
		ArrayList<SetBoardDTO> list = new ArrayList<SetBoardDTO>();
		String query = "SELECT * FROM setboard WHERE set_code=? order by set_num";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				SetBoardDTO dto = new SetBoardDTO();
				dto.setSet_num(rs.getInt("set_num"));
				dto.setSet_title(rs.getString("set_title"));
				dto.setSet_content(rs.getString("set_content"));
				dto.setSet_code(rs.getInt("set_code"));
				
				list.add(dto);
			}
			
		}catch(Exception e ) {
			System.out.println("세팅 방법 게시글 목록 불러오는 중 오류 발생!!!");
			e.printStackTrace();
		}
		return list;
		
	}
	// 세팅 방법 게시글 삭제
	public int SetboardDelete(String num, String code, String title) {
		int result = 0; 
		String query = "DELETE FROM setboard WHERE set_num=? and set_code=?"
				+ "and set_title=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.setString(2, code);
			psmt.setString(3, title);
			
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("세팅 방법 게시글 삭제 중 오류 발생!!!!");
			e.printStackTrace();
			
		}
		return result;
	}
	// 세팅 방법 해당 게시물 가져오기
	public int SetboardSelect1(int code, String title) {
		int result = -1;
		String query = "SELECT * FROM SetBoard WHERE set_code=? and set_title=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, code);
			psmt.setString(2, title);
			
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("1세팅 방법 해당 게시물 가져오는 중 오류 발생!!!!!");
			e.printStackTrace();
		}
		return result;
	}
	
	// 세팅방법 목록 출력
	public ArrayList<SetBoardDTO> SetboardSelect(String title, String code){
		ArrayList<SetBoardDTO> list = new ArrayList<SetBoardDTO>();
		String query = "SELECT * FROM setboard WHERE set_title=? and set_code=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, title);
			psmt.setString(2, code);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				SetBoardDTO dto = new SetBoardDTO();
				dto.setSet_num(rs.getInt("set_num"));
				dto.setSet_title(rs.getString("set_title"));
				dto.setSet_content(rs.getString("set_content"));
				dto.setSet_code(rs.getInt("set_code"));
				
				list.add(dto);
			}
			
		}catch(Exception e ) {
			System.out.println("세팅 방법 게시글 목록 불러오는 중 오류 발생!!!");
			e.printStackTrace();
		}
		return list;
		
	}
}
