package admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class adminBoardDAO extends DBConnPool {
	
	public adminBoardDAO() {
		super();
	}
		// 공지 테이블 출력
			public ArrayList<adminBoardDTO> selectBoards() {
				String sql = "SELECT anum, ATITLE, AVISITCOUNT,"
						+ "CASE WHEN ABOARD_CODE = 1 THEN '기술' "
						+ "WHEN ABOARD_CODE = 2 THEN '커리어' "
						+ "WHEN ABOARD_CODE = 3 THEN '오퍼' "
						+ "END AS brd_code "
						+ "FROM ADMINBOARD  ";

				ArrayList<adminBoardDTO> list = new ArrayList<adminBoardDTO>();
				

				try {
				
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);

					while (rs.next()) {
						adminBoardDTO dto = new adminBoardDTO();
						dto.setAnum(rs.getString(1));
						dto.setTitle(rs.getString(2));
						dto.setVisitcount(rs.getString(3));
						dto.setBrd_name(rs.getString(4));
						list.add(dto);
					}
					rs.close();
					stmt.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				
				}

				return list;
			}
	// 게시글 데이터를 받아 DB에 추가
	public int insertWrite(adminBoardDTO dto) {
		int result = 0;
					
		try {
				String sql = "insert into adminboard (anum, aboard_code, atitle, acontent) values (seq_admin_num.nextval, ?,?,?)";
						
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, dto.getBrd_code());
				psmt.setString(2, dto.getTitle());
				psmt.setString(3, dto.getContent());
						
				result = psmt.executeUpdate();
			}
			catch (Exception e) {
				System.out.println("admin 게시물 입력 중 예외 발생");
				e.printStackTrace();
			}
			return result;
			}
	
	
	public List<adminBoardDTO> selectView(int boardcode) {
		List<adminBoardDTO> oboard = new Vector<adminBoardDTO>();
		
		String sql = "SELECT * FROM adminboard WHERE aboard_code = ? ORDER BY apostdate desc ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, boardcode);
			System.out.println(boardcode);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				adminBoardDTO dto = new adminBoardDTO();
				dto.setAnum(rs.getString(1));
				dto.setBrd_code(rs.getInt(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getString(6));
				
				// 반환할 경과 목록에 게시물 추가
				oboard.add(dto);
				
			}
		}
		
		
		catch (Exception e) {
			System.out.println("offer 게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return oboard;
	}
	

	// 지정한 게시물을 찾아 내용을 반환
			public adminBoardDTO selectView(String num) {
				adminBoardDTO dto = new adminBoardDTO();

				String sql = "select * from adminboard where anum = ?";
				System.out.println(sql);
				try {

					psmt = con.prepareStatement(sql);
					psmt.setString(1, num);
					rs = psmt.executeQuery();

					while (rs.next()) {
						dto.setAnum(rs.getString(1));
						dto.setBrd_code(rs.getInt(2));
						dto.setTitle(rs.getString(3));
						dto.setContent(rs.getString(4));
						dto.setPostdate(rs.getDate(5));
						dto.setVisitcount(rs.getString(6));
					}
				} 
				catch (Exception e) {
					System.out.println("게시물 상세보기 중 예외 발생");
					e.printStackTrace();
				}
				return dto;
			}
	
	// 지정한 게시물의 조회수 1 증가
			public void updateVisitCount(String num) {
				String sql = "update adminboard set "
						+ " avisitcount = avisitcount+1 "
						+ " where anum=?";
				System.out.println(sql);
				try {
					psmt = con.prepareStatement(sql);
					psmt.setString(1, num);
					psmt.executeQuery();
				} catch (Exception e) {
					System.out.println("게시물 조회수 증가 중 예외 발생");
					e.printStackTrace();
				}
			}
			
			// 지정한 게시물을 수정
			public int updateEdit(String title, String content, String num) {
				int result = 0;
				
				try {
					String sql = "update adminboard set atitle=?, acontent=? where anum=?";
					
					psmt = con.prepareStatement(sql);
					psmt.setString(1, title);
					psmt.setString(2, content);
					psmt.setString(3, num);
					
					result = psmt.executeUpdate();
				}
				catch(Exception e) {
					System.out.println("게시물 수정 중 예외 발생");
					e.printStackTrace();
				}
				
				return result;
			}
			
			// 지정한 게시물을 삭제
			public int deletePost(adminBoardDTO dto) {
				int result = 0;
				
				try {
					String sql = "delete from adminboard where anum=?";
					
					psmt = con.prepareStatement(sql);
					psmt.setString(1, dto.getAnum());
					
					result = psmt.executeUpdate();
				}
				catch(Exception e) {
					System.out.println("게시물 삭제 중 예외 발생");
					e.printStackTrace();
				}
				return result;
			}
	
}
