package utils;

import java.sql.SQLException;
import java.util.ArrayList;

import admin.AreportDTO;
import common.DBConnPool;

public class ReportDAO extends DBConnPool {
	
	public ReportDAO() {
		super();
	}
	// 신고 테이블 데이터 가져오기
	public ArrayList<ReportDTO> selectboard() {
		ArrayList<ReportDTO> list = new ArrayList<ReportDTO>();
		String sql = "SELECT r.RNUM, r.RBOARD_ID, r.TARGET_ID, r.USER_ID, r.TARGET_USER_ID, "
				+ "CASE WHEN r.RTEXT = 0 THEN '광고/스팸' "
				+ "WHEN r.RTEXT = 1 THEN '과도한 욕설' "
				+ "WHEN r.RTEXT = 2 THEN '음란물' "
				+ "WHEN r.RTEXT = 3 THEN '관련없는 내용' "
				+ "END AS retype, "
				+ "CASE WHEN r.RBOARD_ID = 1 THEN '기술' "
				+ "WHEN r.RBOARD_ID = 2 THEN '커리어' "
				+ "WHEN r.RBOARD_ID = 3 THEN '오퍼' "
				+ "END AS brdcode "
				+ "FROM REPORT r ORDER BY r.RNUM DESC";

		try {
		
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				ReportDTO dto = new ReportDTO();
				dto.setNum(rs.getInt(1));
				dto.setBrd_code(rs.getInt(2));
				dto.setBrd_code1(rs.getString(7));
				dto.setTarget_id(rs.getInt(3));
				dto.setId(rs.getString(4));
				dto.setTuid(rs.getString(5));
				dto.setText(rs.getString(6));
				list.add(dto);
			}
			rs.close();
			stmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		}

		return list;
	}
	// 공지 테이블 출력
				public ArrayList<AreportDTO> skillBoards(int tid) {
					String sql = "SELECT r.rboard_id, s.TITLE, r.RTEXT, s.ID,  r.USER_ID  FROM REPORT r , SKILLBOARD s WHERE r.TARGET_ID = s.NUM AND r.TARGET_ID =" + tid ;

					ArrayList<AreportDTO> list = new ArrayList<AreportDTO>();
					

					try {
					
						stmt = con.createStatement();
						rs = stmt.executeQuery(sql);

						while (rs.next()) {
							AreportDTO dto = new AreportDTO();
							dto.setBrd_id(rs.getString(1));
							dto.setTitle(rs.getString(2));
							dto.setRtext(rs.getString(3));
							dto.setW_id(rs.getString(4));
							dto.setR_id(rs.getString(5));
							list.add(dto);
						}
						rs.close();
						stmt.close();
						
					} catch (SQLException e) {
						e.printStackTrace();
					
					}

					return list;
				}
				// 공지 테이블 출력
				public ArrayList<AreportDTO> careerBoards(int tid) {
					String sql = "SELECT r.rboard_id, c.cTITLE, r.RTEXT, c.cID,  r.USER_ID  FROM REPORT r , careerboard c WHERE r.TARGET_ID = c.cNUM AND r.TARGET_ID =" + tid ;

					ArrayList<AreportDTO> list = new ArrayList<AreportDTO>();
					

					try {
					
						stmt = con.createStatement();
						rs = stmt.executeQuery(sql);

						while (rs.next()) {
							AreportDTO dto = new AreportDTO();
							dto.setBrd_id(rs.getString(1));
							dto.setTitle(rs.getString(2));
							dto.setRtext(rs.getString(3));
							dto.setW_id(rs.getString(4));
							dto.setR_id(rs.getString(5));
							list.add(dto);
						}
						rs.close();
						stmt.close();
						
					} catch (SQLException e) {
						e.printStackTrace();
					
					}

					return list;
				}				
				// 공지 테이블 출력
				public ArrayList<AreportDTO> offerBoards(int tid) {
					String sql = "SELECT r.rboard_id, o.oTITLE, r.RTEXT, o.oID,  r.USER_ID  FROM REPORT r , offerboard o WHERE r.TARGET_ID = o.oNUM AND r.TARGET_ID =" + tid ;
					
					ArrayList<AreportDTO> list = new ArrayList<AreportDTO>();
					
					
					try {
						
						stmt = con.createStatement();
						rs = stmt.executeQuery(sql);
						
						while (rs.next()) {
							AreportDTO dto = new AreportDTO();
							dto.setBrd_id(rs.getString(1));
							dto.setTitle(rs.getString(2));
							dto.setRtext(rs.getString(3));
							dto.setW_id(rs.getString(4));
							dto.setR_id(rs.getString(5));
							list.add(dto);
						}
						rs.close();
						stmt.close();
						
					} catch (SQLException e) {
						e.printStackTrace();
						
					}
					
					return list;
				}				
}
