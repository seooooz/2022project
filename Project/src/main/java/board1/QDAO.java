package board1;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import common.DBConnPool;

public class QDAO extends DBConnPool{
	public int insertWrite(QDTO dto) {
		int applyResult= 0;
		try {
			String query="INSERT INTO fdboard ("
					+ "num, id, title, content, cate, ofile, sfile,visitcount )"
					+ "VALUES ("
					+ "seq_fdboard_num.nextval,?,?,?,?,?,?,0)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getCate());
			psmt.setString(5, dto.getOfile());
			psmt.setString(6, dto.getSfile());

			applyResult =psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("INSERT 중 예외 발생");
			e.printStackTrace();
		}
		return applyResult;
		
	}
	public ArrayList<QDTO> selectAllBoard() {
		String sql = "select num, title, id, postdate, visitcount  from fdboard order by num desc";

		ArrayList<QDTO> list = new ArrayList<QDTO>();
		
		Statement stmt = null;
		ResultSet rs = null;

		try {
		
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				QDTO fdo = new QDTO();
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
}
