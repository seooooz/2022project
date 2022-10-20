package like;

import common.DBConnPool;

public class likeBoardDAO extends DBConnPool {

	public likeBoardDAO() {
		super();
	}
	
	// 좋아요 개수
	public int likecount(int page_id, int code, int is_like) {
		
		int count = 0;
		try {
			String query = "SELECT COUNT(*) FROM boardlike " + " WHERE page_id=? AND lboard_code=? "
					+ "	AND is_like=? ";
			psmt = con.prepareStatement(query);
			psmt.setInt(1, page_id);
			psmt.setInt(2, code);
			psmt.setInt(3, is_like);
			
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
			
		} catch (Exception e) {
			System.out.println("좋아요 개수 확인 중 오류!!");
			e.printStackTrace();
		}
		System.out.println("좋아요 개수 확인 성공!!");
		return count;
		
	}
	// 내가 누른 좋아요 개수
	public int melikecount(String id, String no, String code, String like) {
		
		int mycount = 0;
		try {
			String query = "SELECT COUNT(*) FROM boardlike " + " WHERE lid=? AND page_id=? AND lboard_code=? "
					+ "	AND is_like=? ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, no);
			psmt.setString(3, code);
			psmt.setString(4, like);
			
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				mycount=rs.getInt(1);
			}
			
			
		} catch (Exception e) {
			System.out.println("좋아요 개수 확인 중 오류!!");
			e.printStackTrace();
		}
		System.out.println("좋아요 개수 확인 성공!!");
		return mycount;
		
	}
		
	// 동일 게시글 추천 여부 검색
		public int likeCheck(String page_id, String code, String id) {
			int result = 0;
			try {
				String query = "SELECT is_like FROM boardlike "
						+ " WHERE page_id=? and lboard_code=? and lid=?";
				psmt = con.prepareStatement(query);
				psmt.setString(1, page_id);
				psmt.setString(2, code);
				psmt.setString(3,id);
				
				rs=psmt.executeQuery();
				
				if(rs.next()) {
					result = rs.getInt(1);
				}
				
				
			}catch(Exception e) {
				System.out.println("좋아요 실어요 추천 여부 검색 오류!!!");
				e.printStackTrace();
			}
			System.out.println("동일 게시글 추천 여부 성공!!");
			return result;
	}
	// 좋아요 싫어요 값 넣기
	public int likeInsert(likeBoardDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO boardlike(lnum,lid,lboard_code,page_id,is_like)"
					+ " VALUES(seq_likeboard_num.nextval,?,?,?,?) ";
			psmt = con.prepareStatement(query);

			psmt.setString(1, dto.getLid());
			psmt.setString(2, dto.getLboard_code());
			psmt.setString(3, dto.getPage_id());
			psmt.setString(4, dto.getIs_like());

			result = psmt.executeUpdate();
			
			

		} catch (Exception e) {
			System.out.println("좋아요 버튼 오류!!");
			e.printStackTrace();
		}
		System.out.println("좋아요 싫어요 값넣기 성공!!");
		return result;

	}

	// 좋아요 싫어요 값 업데이트
	public int likeUpdate(String like, String lid, String page_id, String lboard_code) {
		int result = 0;

		try {
			String query = "UPDATE boardlike SET is_like=? " + "WHERE lid=? and page_id=? and lboard_code=?";
			psmt = con.prepareStatement(query);

			psmt.setString(1, like);
			psmt.setString(2, lid);
			psmt.setString(3, page_id);
			psmt.setString(4, lboard_code);

			result = psmt.executeUpdate();
			
			

		} catch (Exception e) {
			System.out.println("좋아요 버튼 업데이트 오류!!");
			e.printStackTrace();
		}
		System.out.println("좋아요 버튼 업데이트 성공!!");
		return result;

	}

	// 좋아요 싫어요 삭제
	public int likeDelete(String id, String num, String code) {
		int result = -1;
		try {
			String query = "DELETE FROM boardlike "
					+ "WHERE lid=? and page_id=? and lboard_code=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, num);
			psmt.setString(3, code);

			result = psmt.executeUpdate();
			
			System.out.println("좋아요 싫어요 삭제 값: " + result);
			

		} catch (Exception e) {
			System.out.println("좋아요 삭제 중 오류");
			e.printStackTrace();
		}
		System.out.println("좋아요 싫어요 삭제 완료");
		return result;
	}
	
	// 게시판 삭제시 좋아요 or 싫어요 누른 값 같이 삭제
	public int deleteLike(int num, int code) {
		int result = -1;
		try {
			String query = "DELETE FROM boardlike "
					+ "	WHERE page_id=? and lboard_code=?";
			psmt = con.prepareStatement(query);
			psmt.setInt(1, num);
			psmt.setInt(2, code);
			
			result = psmt.executeUpdate();
			
			System.out.println("좋아요 게시물 삭제 값 " + result );
		}catch(Exception e) {
			System.out.println("좋아요 게시물 삭제 중 오류!!!!");
			e.printStackTrace();
		}
		return result;
	}
}