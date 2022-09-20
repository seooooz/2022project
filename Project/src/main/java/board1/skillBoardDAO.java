package board1;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class skillBoardDAO extends DBConnPool{
	
	public skillBoardDAO() {
		super();
	}
	
	// skillboard 게시물 보이기
	public ArrayList<skillBoardVO> selectAllBoard() {
		String sql = "select num, title, id, postdate, visitcount  from skillboard order by num desc";
		
		ArrayList<skillBoardVO> list = new ArrayList<skillBoardVO>();
		
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				skillBoardVO fdo = new skillBoardVO();
				fdo.setNum(rs.getString("num"));
				fdo.setTitle(rs.getString("title"));
				fdo.setId(rs.getString("id"));
				fdo.setPostdate(rs.getDate("postdate"));
				fdo.setVisitcount(rs.getString("visitcount"));
				
				list.add(fdo);
			}
			rs.close();
			stmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		return list;
	}
	
	//  게시물 작성(insert)
	public int insertWrite(skillBoardVO dto) {
		int applyResult= 0;
		
		try {
			String query="INSERT INTO skillboard ("
					+ "num, id, title, content, cate, filename, filesize, visitcount)"
					+ "VALUES ("
					+ "seq_skillboard_num.nextval,?,?,?,?,?,?,0)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getCate());
			psmt.setString(5, dto.getFilename());
			psmt.setLong(6, dto.getFilesize());

			applyResult =psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("INSERT 중 예외 발생");
			e.printStackTrace();
		}
		return applyResult;
		
	}
	
	//  검색 조건에 맞는 게시물 개수 반환
	public int selectCount(Map<String, Object>map) {
		int totalCount = 0; // 결과(게시물 수) 담을 변수
		
		// 게시물 수 얻어온느 쿼리
		String query = "select count(*) from skillboard";
		
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " "
					+ " like '%" + map.get("searchWord") + "%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1); 	// 첫번째 컬럼 값 가져옴
		}
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	
	// 검색 조건에 맞는 게시물 목록을 반환(페이징)
	public List<skillBoardVO> selectListPage(Map<String, Object> map){
		List<skillBoardVO> bbs = new Vector<skillBoardVO>(); // 결과(게시물 목록)를 담을 변수
		
		String sql = " select * from ( select Tb.*, rownum rNum from ( select * from skillboard ";
		
		// 검색 조건 추가
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField")
					+ " like '%" + map.get("searchWord") + "%' ";
		}
		
		sql += " order by num desc ) Tb ) where rNum between ? and ?";
		
		try { 
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				skillBoardVO vo = new skillBoardVO();
				vo.setNum(rs.getString("num"));
				vo.setId(rs.getString("id"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setCate(rs.getString("cate"));
				vo.setPostdate(rs.getDate("postdate"));
				vo.setVisitcount(rs.getString("visitcount"));
				
				// 반환할 경과 목록에 게시물 추가
				bbs.add(vo);
			}
		}
		catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
		
	}
	
	// index.jsp ) 최근 게시글 상위 5개 
		public ArrayList<skillBoardVO> selectBoards() {
			String sql = "select * from "
					+ " ( "
					+ "	SELECT * FROM skillboard "
					+ "	ORDER  BY num DESC ) "
					+ " where rownum <= 5";

			ArrayList<skillBoardVO> list = new ArrayList<skillBoardVO>();
			

			try {
			
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);

				while (rs.next()) {
					skillBoardVO vo = new skillBoardVO();
					vo.setNum(rs.getString("num"));
					vo.setId(rs.getString("id"));
					vo.setTitle(rs.getString("title"));
					vo.setPostdate(rs.getDate("postdate"));
					vo.setVisitcount(rs.getString("visitcount"));
					list.add(vo);
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
			String sql = "SELECT NUM FROM skillboard ORDER BY NUM DESC";
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
		public ArrayList<skillBoardVO> getList(int pageNum){
			String sql = "SELECT * FROM ( "
					+ "	SELECT * FROM skillboard "
					+ "	WHERE  num < ? "
					+ "	ORDER BY num DESC "
					+ " ) "
					+ " WHERE rownum <=10";

			ArrayList<skillBoardVO> list = new ArrayList<skillBoardVO>();
			
			try {
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, getNext() - (pageNum -1) *10);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					skillBoardVO vo = new skillBoardVO();
					vo.setNum(rs.getString(1));
					vo.setId(rs.getString(2));
					vo.setTitle(rs.getString(3));
					vo.setContent(rs.getString(4));
					vo.setCate(rs.getString(5));
					vo.setFilename(rs.getString(6));
					vo.setFilesize(rs.getLong(7));
					vo.setPostdate(rs.getDate(8));
					vo.setVisitcount(rs.getString(9));

					list.add(vo);
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
			String sql = "SELECT * FROM skillboard WHERE NUM < ? ";
			
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