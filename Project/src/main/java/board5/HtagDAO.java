package board5;

import java.util.ArrayList;

import common.DBConnPool;
import usermember.MemberDTO;
import utils.CommentDTO;

public class HtagDAO extends DBConnPool {

	public HtagDAO() {
		super();
	}
	
	//마이페이지 태그 입력
	public int insertMypageDTO2(HtagDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO htag (hid,htag )" + "values(?,?)";

			System.out.println(query);
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getHid());
			psmt.setString(2, dto.getHtag());
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("해시태그 정보 저장 중 예외 발생");
			e.printStackTrace();
		}

		return result;

	}
	//마이페이지 태그 삭제
	public int deleteTag(String id) {
		int result = 0;
		
		try {
			String sql = "delete from HTAG h  where hid = ?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	//마이페이지 태그 보기
	public ArrayList<HtagDTO> selectMypageDTO2(String id) {

		String sql = "SELECT * FROM HTAG h  WHERE hid=?";
		ArrayList<HtagDTO> list = new ArrayList<HtagDTO>();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				HtagDTO dto = new HtagDTO();
				dto.setHid(rs.getString("hid"));
				dto.setHtag(rs.getString("htag"));
				list.add(dto);
			}
			rs.close();
			psmt.close();
		} catch (Exception e) {
			System.out.println("해시태그 셀렉트 중 예외발생");
			e.printStackTrace();
		}
		return list;

	}
	//other.jsp => 상대방이 쓴 글 갯수
	public int selectboardcount(String id) {
		int result = 0;
		String sql = "SELECT sum(tcount) FROM("
				+ "SELECT sum(title)as tcount FROM(SELECT count(title) AS TITLE  FROM SKILLBOARD s WHERE id= ? UNION ALL SELECT count(o.OTITLE) AS oTITLE FROM OFFERBOARD o  WHERE oid= ?"
				+ "UNION ALL SELECT count(q.qtitle) AS qTITLE  FROM QUESTIONBOARD q  WHERE qid= ?"
				+ "UNION ALL SELECT count(c.ctitle) AS cTITLE  FROM CAREERBOARD c  WHERE cid= ?"
				+ ")"
				+ ")";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, id);
			psmt.setString(3, id);
			psmt.setString(4, id);
			rs = psmt.executeQuery();		
			if(rs.next()) {
				result= rs.getInt("sum(tcount)");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}
	//other.jsp => 상대방이 쓴 댓글 갯수
	public int selectcommentount(String id) {
		int cresult = 0;
		String sql = "SELECT count(com_index) AS ccount FROM BCOMMENT b WHERE USER_COM_ID = ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();		
			if(rs.next()) {
				cresult= rs.getInt("ccount");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cresult;

	}
	// mypage - 유저가 쓴 댓글 보여주기
	public ArrayList<CommentDTO> selectMypagecomment(String id) {
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();

		String sql = "SELECT postnum, com_index, com,Board_Code, case "
				+ " WHEN BOARD_CODE = 1 THEN '기술'"
				+ " WHEN BOARD_CODE = 2 THEN '커리어'"
				+ " WHEN BOARD_CODE = 3 THEN '오퍼'"
				+ " END AS brd_code "
				+ "FROM BCOMMENT b WHERE USER_COM_ID = ? ";
		try {
			System.out.println(sql);
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setPostNum(rs.getString(1));
				dto.setIdx(rs.getString(2));
				dto.setComment(rs.getString(3));
				dto.setCode(rs.getInt(4));
				dto.setBrdcode(rs.getString(5));
				list.add(dto);
			}
			rs.close();
			psmt.close();
			
		} catch (Exception e) {
			System.out.println("해시태그 셀렉트 중 예외발생");
			e.printStackTrace();
		}
		return list;
	}
	
	// 입력받은 id/pw 일치하는 회원정보 
	public MemberDTO selectMember(String uid) {
		MemberDTO dto = new MemberDTO();
		String query = "select id, email from usermember where id = ? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
//				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setEmail(rs.getString("email"));
				
			}
			
		}
		catch(Exception e) {
			System.out.println("로그인 중 오류 발생");
			e.printStackTrace();
		}
		return dto;
	}
}
