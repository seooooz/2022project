package board;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnPool;

public class BoardDAO extends DBConnPool{
	public BoardDAO() {
		super();
	}
	
	// 모든 게시물 검색
	public ArrayList<BoardVO> selectAllBoards() {
		String sql = "select * from bboard order by num desc";

		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		

		try {
		
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				BoardVO bVo = new BoardVO();
				bVo.setNum(rs.getInt("num"));
				bVo.setName(rs.getString("name"));
				bVo.setEmail(rs.getString("email"));
				bVo.setPass(rs.getString("pass"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadcount(rs.getInt("readcount"));
				bVo.setWritedate(rs.getTimestamp("writedate"));

				list.add(bVo);
			}
			rs.close();
			stmt.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		}

		return list;
	}
	
	// 최근 게시글 상위 5개 
	public ArrayList<BoardVO> selectBoards() {
		String sql = "select * from "
				+ " ( "
				+ "	SELECT * FROM BBOARD "
				+ "	ORDER  BY num DESC ) "
				+ " where rownum <= 5";

		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		

		try {
		
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				BoardVO bVo = new BoardVO();
				bVo.setNum(rs.getInt("num"));
				bVo.setName(rs.getString("name"));
				bVo.setEmail(rs.getString("email"));
				bVo.setPass(rs.getString("pass"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadcount(rs.getInt("readcount"));
				bVo.setWritedate(rs.getTimestamp("writedate"));

				list.add(bVo);
			}
			rs.close();
			stmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		}

		return list;
	}
	// 작성 하려는 게시물 번호 확인
	public int getNext() {
		String sql = "SELECT NUM FROM BBOARD ORDER BY NUM DESC";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1; // 마지막 게시물에 1을 더 해 작성하려는 게시물 번호
			}
			
			return 1; // 첫 번째 게시물인 경우
			
			
		}catch(SQLException e) {
			
		}
		return -1;	// 데이터 베이스 오류
	}
	
	// 페이징 처리 하기 위한 게시물 목록 10개 씩 
	public ArrayList<BoardVO> getList(int pageNum){
		String sql = "SELECT * FROM ( "
				+ "	SELECT * FROM BBOARD "
				+ "	WHERE  num < ? "
				+ "	ORDER BY num DESC "
				+ " ) "
				+ " WHERE rownum <=10";

		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNum -1) *10);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO bVo = new BoardVO();
				bVo.setNum(rs.getInt(1));
				bVo.setName(rs.getString(2));
				bVo.setEmail(rs.getString(3));
				bVo.setPass(rs.getString(4));
				bVo.setTitle(rs.getString(5));
				bVo.setContent(rs.getString(6));
				bVo.setReadcount(rs.getInt(7));
				bVo.setWritedate(rs.getTimestamp(8));

				list.add(bVo);
			}
			rs.close();
			pstmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		}

		return list;
	}
	// 게시글을 10개씩 자를 떄 1개라도 있다면 페이징 활성화
	public boolean nextPage(int pageNum) {
		String sql = "SELECT * FROM bboard WHERE NUM < ? ";
		
		try {
		
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNum -1) *10);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
	
			rs.close();
			pstmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		}

		return false;
	}
}
