package board;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.DBConnPool;

public class BoardDAO extends DBConnPool{
	public BoardDAO() {
		super();
	}
	
	public ArrayList<BoardVO> selectAllBoards() {
		String sql = "select * from bboard order by num desc";

		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		Statement stmt = null;
		ResultSet rs = null;

		try {
		
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				BoardVO bVo = new BoardVO();
				bVo.setNum(rs.getInt("num"));
				bVo.setName(rs.getString("name"));
				bVo.setEmail(rs.getString("email"));
				bVo.setPass(rs.getString("pass"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadcount(rs.getInt("readcount"));
				bVo.setWritedate(rs.getTimestamp("writedate"));

				list.add(bVo);
			}
			rs.close();
			stmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		}

		return list;
	}

	public ArrayList<BoardVO> selectBoards() {
		String sql = "select * from "
				+ " ( "
				+ "	SELECT * FROM BBOARD "
				+ "	ORDER  BY num DESC ) "
				+ " where rownum <= 5";

		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		Statement stmt = null;
		ResultSet rs = null;

		try {
		
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				BoardVO bVo = new BoardVO();
				bVo.setNum(rs.getInt("num"));
				bVo.setName(rs.getString("name"));
				bVo.setEmail(rs.getString("email"));
				bVo.setPass(rs.getString("pass"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadcount(rs.getInt("readcount"));
				bVo.setWritedate(rs.getTimestamp("writedate"));

				list.add(bVo);
			}
			rs.close();
			stmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		}

		return list;
	}
}
