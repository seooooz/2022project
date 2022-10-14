package board2;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import common.DBConnPool;
import utils.CommentDTO;
import utils.ReportDTO;

public class careerBoardDAO extends DBConnPool{
	
	public careerBoardDAO() {
		super();
}
	
	
	//  게시물 작성(insert)
	public int insertWrite(careerBoardDTO dto) {
		int applyResult= 0;
		
		try {
			String query="INSERT INTO careerboard ("
					+ "cnum, cid, ctitle, ccontent, ccate, cfilename, cfilesize, cvisitcount)"
					+ "VALUES ("
					+ "seq_careerboard_num.nextval,?,?,?,?,?,?,0)";
			
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
		String query = "select count(*) from careerboard";
		
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
	public List<careerBoardDTO> selectListPage(Map<String, Object> map){
		List<careerBoardDTO> bbs = new Vector<careerBoardDTO>(); // 결과(게시물 목록)를 담을 변수
		
		String sql = " select * from ( select Tb.*, rownum rnum from ( select * from careerboard ";
		
		// 검색 조건 추가
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField")
					+ " like '%" + map.get("searchWord") + "%' ";
		}
		
		sql += " order by cnum desc ) Tb ) where rnum between ? and ?";
		
		System.out.println(sql);
		try { 
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				careerBoardDTO vo = new careerBoardDTO();
				vo.setNum(rs.getString("cnum"));
				vo.setId(rs.getString("cid"));
				vo.setTitle(rs.getString("ctitle"));
				vo.setContent(rs.getString("ccontent"));
				vo.setCate(rs.getString("ccate"));
				vo.setFilename(rs.getString("cfilename"));
				vo.setPostdate(rs.getDate("cpostdate"));
				vo.setVisitcount(rs.getString("cvisitcount"));
				
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
	
	// 검색 조건에 맞는 게시물 목록을 반환(페이징)
	public List<careerBoardDTO> selectListCV(Map<String, Object> map){
		List<careerBoardDTO> bbs = new Vector<careerBoardDTO>(); // 결과(게시물 목록)를 담을 변수
		
		String sql = " select * from ( select Tb.*, rownum rnum from ( select * from careerboard ";
		
		// 검색 조건 추가
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField")
			+ " like '%" + map.get("searchWord") + "%' ";
		}
		
		sql += " order by cnum desc ) Tb ) where rnum between ? and ? and  ccate = '이력서'";
		
		System.out.println(sql);
		try { 
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				careerBoardDTO vo = new careerBoardDTO();
				vo.setNum(rs.getString("cnum"));
				vo.setId(rs.getString("cid"));
				vo.setTitle(rs.getString("ctitle"));
				vo.setContent(rs.getString("ccontent"));
				vo.setCate(rs.getString("ccate"));
				vo.setFilename(rs.getString("cfilename"));
				vo.setPostdate(rs.getDate("cpostdate"));
				vo.setVisitcount(rs.getString("cvisitcount"));
				
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
	// 검색 조건에 맞는 게시물 목록을 반환(페이징)
	public List<careerBoardDTO> selectListIN(Map<String, Object> map){
		List<careerBoardDTO> bbs = new Vector<careerBoardDTO>(); // 결과(게시물 목록)를 담을 변수
		
		String sql = " select * from ( select Tb.*, rownum rnum from ( select * from careerboard ";
		
		// 검색 조건 추가
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField")
			+ " like '%" + map.get("searchWord") + "%' ";
		}
		
		sql += " order by cnum desc ) Tb ) where rnum between ? and ? and  ccate = '인터뷰'";
		
		System.out.println(sql);
		try { 
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				careerBoardDTO vo = new careerBoardDTO();
				vo.setNum(rs.getString("cnum"));
				vo.setId(rs.getString("cid"));
				vo.setTitle(rs.getString("ctitle"));
				vo.setContent(rs.getString("ccontent"));
				vo.setCate(rs.getString("ccate"));
				vo.setFilename(rs.getString("cfilename"));
				vo.setPostdate(rs.getDate("cpostdate"));
				vo.setVisitcount(rs.getString("cvisitcount"));
				
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
	// 검색 조건에 맞는 게시물 목록을 반환(페이징)
	public List<careerBoardDTO> selectListETC(Map<String, Object> map){
		List<careerBoardDTO> bbs = new Vector<careerBoardDTO>(); // 결과(게시물 목록)를 담을 변수
		
		String sql = " select * from ( select Tb.*, rownum rnum from ( select * from careerboard ";
		
		// 검색 조건 추가
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField")
			+ " like '%" + map.get("searchWord") + "%' ";
		}
		
		sql += " order by cnum desc ) Tb ) where rnum between ? and ? and  ccate = '기타'";
		
		System.out.println(sql);
		try { 
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				careerBoardDTO vo = new careerBoardDTO();
				vo.setNum(rs.getString("cnum"));
				vo.setId(rs.getString("cid"));
				vo.setTitle(rs.getString("ctitle"));
				vo.setContent(rs.getString("ccontent"));
				vo.setCate(rs.getString("ccate"));
				vo.setFilename(rs.getString("cfilename"));
				vo.setPostdate(rs.getDate("cpostdate"));
				vo.setVisitcount(rs.getString("cvisitcount"));
				
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
		public ArrayList<careerBoardDTO> selectBoards() {
			String sql = "select * from "
					+ " ( "
					+ "	SELECT * FROM careerboard "
					+ "	ORDER  BY cnum DESC ) "
					+ " where rownum <= 5";

			ArrayList<careerBoardDTO> list = new ArrayList<careerBoardDTO>();
			

			try {
			
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);

				while (rs.next()) {
					careerBoardDTO vo = new careerBoardDTO();
					vo.setNum(rs.getString("cnum"));
					vo.setId(rs.getString("cid"));
					vo.setTitle(rs.getString("ctitle"));
					vo.setPostdate(rs.getDate("cpostdate"));
					vo.setVisitcount(rs.getString("cvisitcount"));
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
			String sql = "SELECT cnum FROM careerboard ORDER BY cnum DESC";
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
		public ArrayList<careerBoardDTO> getList(int num){
			String sql = "SELECT * FROM ( "
					+ "	SELECT * FROM careerboard "
					+ "	WHERE  cnum < ? "
					+ "	ORDER BY cnum DESC "
					+ " ) "
					+ " WHERE rownum <=10";

			ArrayList<careerBoardDTO> list = new ArrayList<careerBoardDTO>();
			
			try {
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, getNext() - (num -1) *10);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					careerBoardDTO vo = new careerBoardDTO();
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
		public boolean nextPage(int num) {
			String sql = "SELECT * FROM careerboard WHERE cnum < ? ";
			
			try {
			
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, getNext() - (num -1) *10);
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
		
		
		// 지정한 게시물을 찾아 내용을 반환
		public careerBoardDTO selectView(String cnum) {
			careerBoardDTO dto = new careerBoardDTO();

			String sql = "select * from careerboard where cnum = ?";
			System.out.println(sql);
			try {

				psmt = con.prepareStatement(sql);
				psmt.setString(1, cnum);
				rs = psmt.executeQuery();

				while (rs.next()) {
					dto.setNum(rs.getString(1));
					dto.setId(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setContent(rs.getString(4));
					dto.setCate(rs.getString(5));
					dto.setFilename(rs.getString(6));
					dto.setFilesize(rs.getLong(7));
					dto.setPostdate(rs.getDate(8));
					dto.setVisitcount(rs.getString(9));
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
			String sql = "update careerboard set "
					+ " cvisitcount = cvisitcount+1 "
					+ " where cnum=?";
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
		public int updateEdit(careerBoardDTO dto) {
			int result = 0;
			
			try {
				String sql = "update careerboard set ctitle=?, ccontent=?,  cfilename=?, cfilesize=? where cnum=?";
				
				psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getTitle());
				psmt.setString(2, dto.getContent());
				psmt.setString(3, dto.getFilename());
				psmt.setLong(4, dto.getFilesize());
				psmt.setString(5, dto.getNum());
				
				result = psmt.executeUpdate();
			}
			catch(Exception e) {
				System.out.println("게시물 수정 중 예외 발생");
				e.printStackTrace();
			}
			
			return result;
		}
		
		// 지정한 게시물을 삭제
		public int deletePost(careerBoardDTO dto) {
			int result = 0;
			
			try {
				String sql = "delete from careerboard where cnum=?";
				
				psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getNum());
				
				result = psmt.executeUpdate();
			}
			catch(Exception e) {
				System.out.println("게시물 삭제 중 예외 발생");
				e.printStackTrace();
			}
			return result;
		}
		
		// Upload 폴더에 있는 파일 삭제하기
		public void deleteFile(HttpServletRequest req, String directory, String filename) {
			
			String sDirectory = req.getServletContext().getRealPath(directory);
			File file = new File(sDirectory + File.separator + filename);
			if(file.exists()) {
				file.delete();
			}
		}
		// 신고당한 게시글 시) 게시글 삭제 시 report테이블 같이삭제
		public int reportdelete(String num) {
			int result = 0;
			
			try {
				
				String sql = "delete from REPORT where RBOARD_ID = 2 and TARGET_ID = ?";
				
				psmt = con.prepareStatement(sql);
				psmt.setString(1, num);
				
				result = psmt.executeUpdate();
			}
			catch(Exception e) {
				System.out.println("댓글 삭제 중 예외 발생");
				e.printStackTrace();
			}
			
			return result;
		}
		// 게시글 삭제 시 댓글 삭제
		public int posetdeleteCom(String num) {
			int result = 0;
			
			try {
				
				String sql = "delete from BCOMMENT where BOARD_CODE = 2 and postnum = ?";
				
				psmt = con.prepareStatement(sql);
				psmt.setString(1, num);
				
				result = psmt.executeUpdate();
			}
			catch(Exception e) {
				System.out.println("댓글 삭제 중 예외 발생");
				e.printStackTrace();
			}
			
			return result;
		}
		
		// 부모 댓글 데이터를 받아 DB에 추가
		public int careerinsertCom(CommentDTO dto) {
			int result = 0;
			try {
				String sql = "insert into BCOMMENT (com_index, user_com_id, board_code, postnum, com, class, com_order) values (seq_com_num.nextval, ?,2,?,?,0,0)";
					
				psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getId());
				psmt.setString(2, dto.getPostNum());
				psmt.setString(3, dto.getComment());
					
				result = psmt.executeUpdate();
			}
			catch (Exception e) {
				System.out.println("career  댓글 입력 중 예외 발생");
				e.printStackTrace();
			}
			return result;
		}
			
		// 부모 댓글 groupnum 업데이트
		public int comgroupUpdate() {
		int result = 0;
				
			try {
				String sql = "UPDATE BCOMMENT SET GROUPNUM = (SELECT nvl(max(com_index),0) FROM BCOMMENT) WHERE COM_INDEX = (SELECT nvl(max(com_index),0) FROM BCOMMENT) AND BOARD_CODE = 2";
					
				psmt = con.prepareStatement(sql);
				result = psmt.executeUpdate();
			}
			catch (Exception e) {
				System.out.println("career  댓글 groupnum 업데이트 중 예외 발생");
				e.printStackTrace();
			}
			return result;
		}
			
		// 주어진 일련번호에 해당하는 댓글 반환
		public CommentDTO selectViewCom(String onum) {
				
			CommentDTO dto = new CommentDTO();
				
			String sql = "select * from BCOMMENT where BOARD_CODE = 2 and POSTNUM  = ? ORDER BY GROUPNUM  DESC, COM_ORDER";
				
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, onum);
					
				System.out.println(onum);
					
				rs = psmt.executeQuery();
					
				while(rs.next()) {
					dto.setIdx(rs.getString(1));
					dto.setId(rs.getString(2));
					dto.setCode(rs.getInt(3));
					dto.setPostNum(rs.getString(4));
					dto.setDate(rs.getDate(5));
					dto.setComment(rs.getString(6));
					dto.setComClass(rs.getInt(7));
					dto.setOrder(rs.getInt(8));
					dto.setGroupNum(rs.getString(9));
						
						
				}
			}
			catch (Exception e) {
				System.out.println("career  게시물 상세보기 중 예외 발생");
				e.printStackTrace();
			}
				
			return dto;
		}
			
			
			// 자식 댓글 데이터를 받아 DB에 추가 (대댓글)
			public int careerinsertreply(String id, String pnum, String reply, String comidx) {
				int result = 0;
				try {
					String sql = "insert into BCOMMENT (com_index, user_com_id, board_code, postnum, com, class, com_order,GROUPNUM) values (seq_com_num.nextval, ?,2,?,?,1,(SELECT nvl(max(COM_ORDER),0) +1 FROM BCOMMENT where groupnum = ?),?)";
					
					psmt = con.prepareStatement(sql);
					psmt.setString(1, id);
					psmt.setString(2, pnum);
					psmt.setString(3, reply);
					psmt.setString(4, comidx);
					psmt.setString(5, comidx);
					result = psmt.executeUpdate();
				}
				catch (Exception e) {
					System.out.println("career 대댓글 입력 중 예외 발생");
					e.printStackTrace();
				}
				return result;
			}
			
			// list에서 댓글 개수 보여주기
			public int countCom(int num) {
				int comcount = 0;
				
				try {
					String sql = "SELECT COUNT(COM_INDEX) AS COMCOUNT FROM BCOMMENT WHERE BOARD_CODE = 2 AND POSTNUM = ?";
					
					psmt = con.prepareStatement(sql);
					psmt.setInt(1, num);
					rs = psmt.executeQuery();
					
					if(rs.next())
						comcount = rs.getInt("COMCOUNT");
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				return comcount;
			}
			
			// 댓글 삭제
			public int deleteCom(String idx) {
				int result = 0;
				
				try {
					
					String sql = "delete from BCOMMENT where com_index = ?";
					
					psmt = con.prepareStatement(sql);
					psmt.setString(1, idx);
					
					result = psmt.executeUpdate();
				}
				catch(Exception e) {
					System.out.println("댓글 삭제 중 예외 발생");
					e.printStackTrace();
				}
				
				return result;
			}
			
			// 주어진 일련번호에 해당하는 댓글 반환 (댓글만)
			public List<CommentDTO> comselectView(String onum) {
				List<CommentDTO> oboard = new Vector<CommentDTO>();
				
				String sql = "select * from BCOMMENT WHERE BOARD_CODE = 2 and POSTNUM = ? and class = 0 ORDER BY COM_INDEX DESC ";
				
				try {
					psmt = con.prepareStatement(sql);
					psmt.setString(1, onum);
					System.out.println(onum);
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						CommentDTO dto = new CommentDTO();
						dto.setIdx(rs.getString(1));
						dto.setId(rs.getString(2));
						dto.setCode(rs.getInt(3));
						dto.setPostNum(rs.getString(4));
						dto.setDate(rs.getDate(5));
						dto.setComment(rs.getString(6));
						dto.setComClass(rs.getInt(7));
						dto.setOrder(rs.getInt(8));
						dto.setGroupNum(rs.getString(9));
						
						// 반환할 경과 목록에 게시물 추가
						oboard.add(dto);
						
					}
				}
				catch (Exception e) {
					System.out.println("career 게시물 상세보기 중 예외 발생");
					e.printStackTrace();
				}
				
				return oboard;
			}
			
			
			// 주어진 일련번호에 해당하는 댓글 반환 (대댓글까지)
			public List<CommentDTO> reselectView(String onum, String gnum) {
				List<CommentDTO> oboard = new Vector<CommentDTO>();
				
				String sql = "select * from BCOMMENT WHERE BOARD_CODE = 2 and POSTNUM = ? and class = 1 AND GROUPNUM = ? ORDER BY COM_INDEX";
				
				try {
					psmt = con.prepareStatement(sql);
					psmt.setString(1, onum);
					psmt.setString(2, gnum);
					System.out.println(onum);
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						CommentDTO dto = new CommentDTO();
						dto.setIdx(rs.getString(1));
						dto.setId(rs.getString(2));
						dto.setCode(rs.getInt(3));
						dto.setPostNum(rs.getString(4));
						dto.setDate(rs.getDate(5));
						dto.setComment(rs.getString(6));
						dto.setComClass(rs.getInt(7));
						dto.setOrder(rs.getInt(8));
						dto.setGroupNum(rs.getString(9));
						
						// 반환할 경과 목록에 게시물 추가
						oboard.add(dto);
						
					}
				}
				catch (Exception e) {
					System.out.println("career  게시물 상세보기 중 예외 발생");
					e.printStackTrace();
				}
				
				return oboard;
			}
			
			
		// 게시물 신고하기
		public int reportinsert(ReportDTO dto) {
			
			int result = 0;
			try {
				String sql = "insert into report (rnum, rboard_id, target_id, target_type, user_id, target_user_id, rtext) "
						+ "values (seq_reportboard_num.nextval,2,?,1,?,?,?)";
				
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, dto.getTarget_id());
				psmt.setString(2, dto.getId());
				psmt.setString(3, dto.getTuid());
				psmt.setString(4, dto.getText());
				result = psmt.executeUpdate();
			}
			catch (Exception e) {
				System.out.println("career  대댓글 입력 중 예외 발생");
				e.printStackTrace();
			}
			return result;
		}
		
		// 신고하기 1번만 가능하게
		public int selectReport(int tid, String uid) {
			 int count = 0;
				
			String sql = "SELECT COUNT(*) AS counter FROM REPORT WHERE RBOARD_ID = 2 AND TARGET_ID = ? AND USER_ID = ? GROUP BY rboard_id,target_id,user_id HAVING COUNT(*) > 0";
		
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, tid);
				psmt.setString(2, uid);
				
				rs = psmt.executeQuery();
				
				if(rs.next()) 
					count = rs.getInt("counter");
				
			}	
			catch (Exception e) {
				System.out.println("career 신고 count 중 예외 발생");
				e.printStackTrace();
			}
			return count;
		}		

	
}