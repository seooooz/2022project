package board3;

import java.util.List;
import java.util.Map;
import java.util.Vector;
import common.DBConnPool;

public class offerBoardDAO extends DBConnPool{

	public offerBoardDAO() {

	}
	
	// 검색 조건에 맞는 게시물의 개수를 반환합니다.
		public int selectCount(Map<String, Object> map) {
			int totalCount = 0;
			
			String sql = "select count(*) from offerboard";
			
			// 조건이 있으면 where절 추가
			if(map.get("searchWord") != null) {
				sql += " where " + map.get("searchField") + " "
						+ " Like '%" + map.get("searchWord") + "%'";
			}
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				rs.next();
				totalCount = rs.getInt(1);		// 검색된 게시물 개수 저장
			}
			catch (Exception e) {
				System.out.println("게시물 카운트 중 예외 발생");
				e.printStackTrace();
			}
			
			return totalCount;		// 게시물 개수를 서블릿으로 변환
		}
	
	// 검색 조건에 맞는 게시물 목록을 반환(페이징)
		public List<offerBoardDTO> selectListPage(Map<String, Object> map){
			List<offerBoardDTO> oboard = new Vector<offerBoardDTO>(); // 결과(게시물 목록)를 담을 변수
			
			String sql = " select * from ( select Tb.*, rownum rNum from ( select * from offerboard ";
			
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
					offerBoardDTO dto = new offerBoardDTO();
					dto.setId(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setContent(rs.getString(4));
					dto.setCate(rs.getString(5));
					dto.setMemNum(rs.getString(6));
					dto.setDday(rs.getString(7));
					dto.setPostdate(rs.getDate(8));
					dto.setVisitcount(rs.getInt(9));
					
					// 반환할 경과 목록에 게시물 추가
					oboard.add(dto);
				}
			}
			catch(Exception e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			}
			return oboard;
			
		}
		
	// 게시글 데이터를 받아 DB에 추가
		public int insertWrite(offerBoardDTO dto) {
			int result = 0;
			
			try {
				String sql = "insert into offerboard (onum, oid, otitle, ocontent, ocate, omem_num, odday) values (seq_offerboard_num.nextval, ?,?,?,?,?,?)";
				
				psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getId());
				psmt.setString(2, dto.getTitle());
				psmt.setString(3, dto.getContent());
				psmt.setString(4, dto.getCate());
				psmt.setString(5, dto.getMemNum());
				psmt.setString(6, dto.getId());
				
				result = psmt.executeUpdate();
			}
			catch (Exception e) {
				System.out.println("offer 게시물 입력 중 예외 발생");
				e.printStackTrace();
			}
			return result;
		}
}
