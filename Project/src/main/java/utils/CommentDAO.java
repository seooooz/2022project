package utils;

import java.util.List;
import java.util.Vector;

import common.DBConnPool;

public class CommentDAO extends DBConnPool{
	
	public CommentDAO() {
		super();
	}
	
	// 부모 댓글 데이터를 받아 DB에 추가
	public int skillinsertCom(CommentDTO dto) {
		int result = 0;
		try {
			String sql = "insert into BCOMMENT (com_index, user_com_id, board_code, postnum, com, class, com_order) values (seq_com_num.nextval, ?,?,?,?,0,0)";
				
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setInt(2, dto.getCode());
			psmt.setString(3, dto.getPostNum());
			psmt.setString(4, dto.getComment());
				
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("career  댓글 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 부모 댓글 groupnum 업데이트
	public int comgroupUpdate(int code) {
	int result = 0;
			
		try {
			String sql = "UPDATE BCOMMENT SET GROUPNUM = (SELECT nvl(max(com_index),0) FROM BCOMMENT) WHERE COM_INDEX = (SELECT nvl(max(com_index),0) FROM BCOMMENT) AND BOARD_CODE = ?";
				
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, code);
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("career  댓글 groupnum 업데이트 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 주어진 일련번호에 해당하는 댓글 반환 (댓글만)
	public List<CommentDTO> comselectView(int code, String onum) {
		List<CommentDTO> oboard = new Vector<CommentDTO>();
		
		String sql = "select * from BCOMMENT WHERE BOARD_CODE = ? and POSTNUM = ? and class = 0 ORDER BY COM_INDEX DESC ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, code);
			psmt.setString(2, onum);
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
	
	// 댓글 작성 후 작성한 댓글의 index 번호 찾기
	public int myindex(String id) {
		int myindex = 0;
		
		String sql = "SELECT max(com_index)AS myindex FROM BCOMMENT b  WHERE b.USER_COM_ID = ? ORDER BY COM_DATE desc";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next())
				myindex = rs.getInt("myindex");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return myindex;
	}
	// 내가 좋아요 한 글인지
	public int melikecount(String id, String postnum, int code) {
		int mylike = 0;
		
		String sql = "SELECT COUNT(*) AS mylike FROM boardlike WHERE lid=? AND page_id=? AND lboard_code=? AND is_like= 1";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, postnum);
			psmt.setInt(3, code);
			rs = psmt.executeQuery();
			
			if(rs.next())
				mylike = rs.getInt("mylike");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return mylike;
	}
	// 내가 싫어요 한 글인지
	public int myhatecount(String id, String postnum, int code) {
		int myhate = 0;
		
		String sql = "SELECT COUNT(*) AS mylike FROM boardlike WHERE lid=? AND page_id=? AND lboard_code=? AND is_like= 2";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, postnum);
			psmt.setInt(3, code);
			rs = psmt.executeQuery();
			
			if(rs.next())
				myhate = rs.getInt("mylike");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return myhate;
	}
	
	
	// 주어진 일련번호에 해당하는 댓글 반환 (댓글만)
		public List<CommentDTO> comMyView(int code, String pnum, int index) {
			List<CommentDTO> oboard = new Vector<CommentDTO>();
			
			String sql = "SELECT * FROM BCOMMENT b WHERE BOARD_CODE =? AND POSTNUM =? AND COM_INDEX  = ? ";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, code);
				psmt.setString(2, pnum);
				psmt.setInt(3, index);
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
}
