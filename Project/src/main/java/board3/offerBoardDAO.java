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
			
			sql += " order by onum desc ) Tb ) where rNum between ? and ?";
			
			
			try { 
				psmt = con.prepareStatement(sql);
				psmt.setString(1, map.get("start").toString());
				psmt.setString(2, map.get("end").toString());
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					offerBoardDTO dto = new offerBoardDTO();
					dto.setNum(rs.getString(1));
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
				psmt.setString(6, dto.getDday());
				
				result = psmt.executeUpdate();
			}
			catch (Exception e) {
				System.out.println("offer 게시물 입력 중 예외 발생");
				e.printStackTrace();
			}
			return result;
		}
		
		
		// 주어진 일련번호에 해당하는 게시물 반환
		public offerBoardDTO selectView(String onum) {
			
			offerBoardDTO dto = new offerBoardDTO();
			
			String sql = "select * from offerboard where onum = ?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, onum);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					dto.setNum(rs.getString(1));
					dto.setId(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setContent(rs.getString(4));
					dto.setCate(rs.getString(5));
					dto.setMemNum(rs.getString(6));
					dto.setDday(rs.getString(7));
					dto.setPostdate(rs.getDate(8));
					dto.setVisitcount(rs.getInt(9));
					
					
				}
			}
			catch (Exception e) {
				System.out.println("offer 게시물 상세보기 중 예외 발생");
				e.printStackTrace();
			}
			
			return dto;
		}
		
	// 주어진 일련번호에 해당하는 게시물의 조회수(ovisitcount) 1 증가
		public void updateVisitCount(String onum) {
			
			String sql = "update offerboard set ovisitcount = ovisitcount + 1 where onum = ?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, onum);
				psmt.executeQuery();
			}
			
			catch (Exception e) {
				System.out.println("offer 게시물 조회수 증가 중 예외 발생");
				e.printStackTrace();
			}
		}
		
//		 댓글 목록을 반환(페이징)
//					public List<CommentDTO> selectListCom(Map<String, Object> map, String num){
//						List<CommentDTO> oboard = new Vector<CommentDTO>(); // 결과(게시물 목록)를 담을 변수
//						
//						String sql = " select * from ( select Tb.*, rownum rNum from ( select * from BCOMMENT where com_index = ? ";
//						
////						// 검색 조건 추가
////						if(map.get("searchWord") != null) {
////							sql += " where " + map.get("searchField")
////									+ " like '%" + map.get("searchWord") + "%' ";
////						}
//						
//						sql += "  order by com_index desc ) Tb ) ";
//						
//						
//						try { 
//							psmt = con.prepareStatement(sql);
//							psmt.setString(1, num);
//							System.out.println(num);
////							psmt.setString(1, map.get("start").toString());
////							psmt.setString(2, map.get("end").toString());
//							
//							rs = psmt.executeQuery();
//							
//							while(rs.next()) {
//								CommentDTO dto = new CommentDTO();
//								dto.setIdx(rs.getString(1));
//								dto.setId(rs.getString(2));
//								dto.setCode(rs.getInt(3));
//								dto.setPostNum(rs.getString(4));
//								dto.setDate(rs.getDate(5));
//								dto.setComment(rs.getString(6));
//								dto.setComClass(rs.getInt(7));
//								dto.setOrder(rs.getInt(8));
//								dto.setGroupNum(rs.getInt(9));
//								
//								// 반환할 경과 목록에 게시물 추가
//								oboard.add(dto);
//							}
//						}
//						catch(Exception e) {
//							System.out.println("게시물 조회 중 예외 발생");
//							e.printStackTrace();
//						}
//						return oboard;
//						
//					}
		
		
				// 댓글의 개수를 반환합니다.
				public int comselectCount(Map<String, Object> map) {
					int totalCount = 0;
					
					String sql = "select count(*) from BCOMMENT";
					
					// 조건이 있으면 where절 추가
//					if(map.get("searchWord") != null) {
//						sql += " where " + map.get("searchField") + " "
//								+ " Like '%" + map.get("searchWord") + "%'";
//					}
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

		
				// 주어진 일련번호에 해당하는 댓글 반환 (대댓글까지)
				public List<CommentDTO> reselectView(String onum, String gnum) {
					List<CommentDTO> oboard = new Vector<CommentDTO>();
					
					String sql = "select * from BCOMMENT WHERE POSTNUM = ? and class = 1 AND GROUPNUM = ? ORDER BY COM_INDEX";
					
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
						System.out.println("offer 게시물 상세보기 중 예외 발생");
						e.printStackTrace();
					}
					
					return oboard;
				}
				
				// 주어진 일련번호에 해당하는 댓글 반환 (댓글만)
				public List<CommentDTO> comselectView(String onum) {
					List<CommentDTO> oboard = new Vector<CommentDTO>();
					
					String sql = "select * from BCOMMENT WHERE POSTNUM = ? and class = 0 ORDER BY COM_INDEX DESC ";
					
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
					
					
					// 부모 댓글 데이터를 받아 DB에 추가
					public int offerinsertCom(CommentDTO dto) {
						int result = 0;
						try {
							String sql = "insert into BCOMMENT (com_index, user_com_id, board_code, postnum, com, class, com_order) values (seq_com_num.nextval, ?,3,?,?,0,0)";
							
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
							String sql = "UPDATE BCOMMENT SET GROUPNUM = (SELECT nvl(max(com_index),0) FROM BCOMMENT) WHERE COM_INDEX = (SELECT nvl(max(com_index),0) FROM BCOMMENT)";
							
							psmt = con.prepareStatement(sql);
							result = psmt.executeUpdate();
						}
						catch (Exception e) {
							System.out.println("offer 댓글 groupnum 업데이트 중 예외 발생");
							e.printStackTrace();
						}
						return result;
					}
					
				// 주어진 일련번호에 해당하는 댓글 반환
					public CommentDTO selectViewCom(String onum) {
						
						CommentDTO dto = new CommentDTO();
						
						String sql = "select * from BCOMMENT where POSTNUM  = ? ORDER BY GROUPNUM  DESC, COM_ORDER";
						
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
							System.out.println("offer 게시물 상세보기 중 예외 발생");
							e.printStackTrace();
						}
						
						return dto;
					}
					
					
//										
					// 자식 댓글 데이터를 받아 DB에 추가 (대댓글)
					public int offerinsertreply(String id, String pnum, String reply, String comidx) {
						int result = 0;
						try {
							String sql = "insert into BCOMMENT (com_index, user_com_id, board_code, postnum, com, class, com_order,GROUPNUM) values (seq_com_num.nextval, ?,3,?,?,1,(SELECT nvl(max(COM_ORDER),0) +1 FROM BCOMMENT where groupnum = ?),?)";
							
							psmt = con.prepareStatement(sql);
							psmt.setString(1, id);
							psmt.setString(2, pnum);
							psmt.setString(3, reply);
							psmt.setString(4, comidx);
							psmt.setString(5, comidx);
							result = psmt.executeUpdate();
						}
						catch (Exception e) {
							System.out.println("offer 대댓글 입력 중 예외 발생");
							e.printStackTrace();
						}
						return result;
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
					
					public CommentDTO comselectidx(String idx) {
						
						CommentDTO dto = new CommentDTO();
						try {
							
							String sql = "select * from BCOMMENT where = ?";
							psmt = con.prepareStatement(sql);
							psmt.setString(1, idx);
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
							System.out.println("댓글 정보 오류");
						}

						return dto;
					}
}
