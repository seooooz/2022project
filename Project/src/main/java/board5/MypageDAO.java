package board5;

import java.util.ArrayList;

import board1.skillBoardDTO;
import board6.htagDTO;
import common.DBConnPool;

public class MypageDAO extends DBConnPool {

	public MypageDAO() {
		super();
	}

//	public int insertMypageDTO(MypageDTO dto) {
//		int result =0;
//		try {
//			String query ="INSERT INTO mypage (mid, mjob, memail, midx)"
//					+ "values(?,?,?,seq_mypage_num.nextval)";
//		
//			System.out.println(query);
//			psmt = con.prepareStatement(query);
//			psmt.setString(1,dto.getId());
//			psmt.setString(2,dto.getJob());
//			psmt.setString(3,dto.getEmail());
//			result = psmt.executeUpdate();
//
//		}catch(Exception e) {
//			System.out.println("해시태그 정보 저장 중 예외 발생");
//			e.printStackTrace();
//		}
//		
//		return result;
//		
//	}
	public int insertMypageDTO2(htagDTO dto) {
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
	
	public int deletePost(String id) {
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

	public ArrayList<MypageDTO> selectMypageDTO(String id) {

		String sql = "select mid, mjob, memail from mypage where mid =?";
		ArrayList<MypageDTO> list = new ArrayList<MypageDTO>();
		try {
			MypageDTO dto = new MypageDTO();
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				dto.setId(rs.getString("mid"));
				dto.setJob(rs.getString("mjob"));
				dto.setEmail(rs.getString("memail"));
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

	public ArrayList<htagDTO> selectMypageDTO2(String id) {

		String sql = "SELECT * FROM HTAG h  WHERE hid=?";
		ArrayList<htagDTO> list = new ArrayList<htagDTO>();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				htagDTO dto = new htagDTO();
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

	public int selectMypagecount(String id) {
		int result = 0;
		String sql = "SELECT count(*) as tcount FROM HTAG h WHERE hid= ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

//			htagDTO dto = new htagDTO();
//			dto.setRdTag0(rs.getString("rdTag0"));
//			dto.setRdTag1(rs.getString("rdTag1"));
//			dto.setRdTag2(rs.getString("rdTag2"));
//			dto.setRdTag3(rs.getString("rdTag3"));
//			dto.setRdTag4(rs.getString("rdTag4"));
//			
			if(rs.next()) {
				result= rs.getInt("tcount");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}
}
