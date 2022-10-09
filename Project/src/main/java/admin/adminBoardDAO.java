package admin;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import utils.CommentDTO;

public class adminBoardDAO extends DBConnPool {
	
	public adminBoardDAO() {
		super();
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
				dto.setNum(rs.getInt(1));
				dto.setBrd_code(rs.getInt(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getInt(6));
				
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
	
}
