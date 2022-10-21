package board4;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import utils.CommentDTO;

public class QuestionBoardDAO extends DBConnPool {

	public QuestionBoardDAO() {
		super();
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM QuestionBoard";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);

		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}

	// 검색 조건에 맞는 게시물 목록을 반환
	public List<QuestionBoardDTO> selectList(Map<String, Object> map) {
		// 결과(게시물 목록)를 담을 변수
		List<QuestionBoardDTO> list = new Vector<QuestionBoardDTO>();

		String query = "SELECT * FROM QuestionBoard";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		query += " ORDER BY qnum DESC ";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				QuestionBoardDTO dto = new QuestionBoardDTO();
				
				dto.setQnum(rs.getInt("qnum"));
				dto.setQid(rs.getString("qid"));
				dto.setQtitle(rs.getString("qtitle"));
				dto.setQcontent(rs.getString("qcontent"));
				dto.setQpostdate(rs.getDate("qpostdate"));
				dto.setQvisitcount(rs.getInt("qvisitcount"));
				
				list.add(dto);
			}
		}catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return list;
	}
	
	// 문의사항 글 작성 
	public int insertWrite(QuestionBoardDTO dto) {
		int result = 0;
		
		try {
			
			String query = "INSERT INTO QuestionBoard ( "
						+ " qnum,qid,qtitle,qcontent )"
						+ " VALUES ( "
						+ "seq_question_num.NEXTVAL, ?,?,? )";
			System.out.println(query);
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getQid());
			psmt.setString(2, dto.getQtitle());
			psmt.setString(3, dto.getQcontent());
			
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 지정한 게시물을 찾아 내용을 반환
	public QuestionBoardDTO selectView(String qnum) {
		QuestionBoardDTO dto = new QuestionBoardDTO();
		
		String query = "SELECT Q.*, U.name "
					 + " FROM usermember U INNER JOIN QuestionBoard Q "
					 + " ON U.id=Q.qid "
					 + " WHERE qnum=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, qnum);	// 인파라미터를 일련번호로 설정
			rs = psmt.executeQuery(); 	// 쿼리 실행
			
			if(rs.next()) {
				dto.setQnum(rs.getInt(1));
				dto.setQid(rs.getString(2));
				dto.setQtitle(rs.getString(3));
				dto.setQcontent(rs.getString(4));
				dto.setQpostdate(rs.getDate(5));
				dto.setQvisitcount(rs.getInt(6));
				
				
			}
		}catch(Exception e) {
			System.out.println("지정한 게시물 반환 오류!!!");
			e.printStackTrace();
		}
		return dto;
	}
	
	// 지정한 게시물의 조회수를 1증가 시킴
	public void updateVisitCount(String num) {
		String query = "UPDATE QuestionBoard SET "
					 + " qvisitcount=qvisitcount+1"
					 + " WHERE qnum=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		}catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	//문의게시글 삭제
	public int deleteList(int num) {
		int result = -1;
		String query="DELETE FROM QuestionBoard WHERE qnum=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, num);
			result = psmt.executeUpdate();
			
		}catch(SQLException e) {
			System.out.println("문의게시글 삭제 중 오류!!!");
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	// 부모 댓글 데이터를 받아 DB에 추가
	public int offerinsertCom(CommentDTO dto) {
		int result = 0;
		try {
			String sql = "insert into BCOMMENT (com_index, user_com_id, board_code, postnum, com, class, com_order) values (seq_com_num.nextval, ?,4,?,?,0,0)";
				
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPostNum());
			psmt.setString(3, dto.getComment());
				
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("offer 댓글 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
		
	// 부모 댓글 groupnum 업데이트
	public int comgroupUpdate() {
	int result = 0;
			
		try {
			String sql = "UPDATE BCOMMENT SET GROUPNUM = (SELECT nvl(max(com_index),0) FROM BCOMMENT) WHERE COM_INDEX = (SELECT nvl(max(com_index),0) FROM BCOMMENT) AND BOARD_CODE = 4";
				
			psmt = con.prepareStatement(sql);
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("offer 댓글 groupnum 업데이트 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
		
	// 주어진 일련번호에 해당하는 댓글 반환 (댓글만)
	public List<CommentDTO> comselectView(String onum) {
		List<CommentDTO> oboard = new Vector<CommentDTO>();
		
		String sql = "select * from BCOMMENT WHERE BOARD_CODE = 4 and POSTNUM = ? and class = 0 ORDER BY COM_INDEX DESC ";
		
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
			System.out.println("offer 게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return oboard;
	}
	
	
	// list에서 댓글 개수 보여주기
	public int countCom(int num) {
		int comcount = 0;
		
		try {
			String sql = "SELECT COUNT(COM_INDEX) AS COMCOUNT FROM BCOMMENT WHERE BOARD_CODE = 4 AND POSTNUM = ?";
			
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
	// mypage - questionboard 출력
	public ArrayList<QuestionBoardDTO> selectquestionView(String id) {

		String sql = "select * from questionboard where qid = ? ORDER BY qnum DESC ";
		ArrayList<QuestionBoardDTO> list = new ArrayList<QuestionBoardDTO>();

		try {

			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				QuestionBoardDTO dto = new QuestionBoardDTO();
				dto.setQnum(rs.getInt(1));
				dto.setQid(rs.getString(2));
				dto.setQtitle(rs.getString(3));
				dto.setQcontent(rs.getString(4));
				dto.setQpostdate(rs.getDate(5));
				dto.setQvisitcount(rs.getInt(6));

				list.add(dto);
			}
			rs.close();
			psmt.close();
		} 
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return list;
	}
}