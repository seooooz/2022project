package board.service;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.Action;
import member.service.ActionForward;
import utils.CommentDAO;
import utils.CommentDTO;

public class CommentList implements Action{
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String no = request.getParameter("no");
		int code = Integer.parseInt(request.getParameter("code"));
		
		CommentDAO dao = new CommentDAO();
		CommentDTO dto = new CommentDTO();
//		
//		dto.setCode(code);
//		dto.setPostNum(no);
//		
//		List<CommentDTO> comLists = dao.comselectView(code, no);
		
		
		// 데이터베이스에 연결
	    String url = "jdbc:oracle:thin:@localhost:1521:xe";
	    String user = "c##green";
	    String password = "green1234";
	    
	    // 드라이버를 가져옴
	    Class.forName("oracle.jdbc.OracleDriver");
		String sql = "select * from BCOMMENT WHERE BOARD_CODE = ? and POSTNUM = ? and class = 0 ORDER BY COM_INDEX DESC ";
		
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, code);
			psmt.setString(2, no);
			rs = psmt.executeQuery();
			
			List array = new Vector();
			while(rs.next()) {
				Map<String, Object> obj = new HashMap<String, Object>();
				obj.put("index", rs.getString(1));
				obj.put("id", rs.getString(2));
				obj.put("code", rs.getInt(3));
				obj.put("pnum", rs.getString(4));
				obj.put("date", rs.getDate(5));
				obj.put("comment", rs.getString(6));
				obj.put("class", rs.getInt(7));
				obj.put("order", rs.getInt(8));
				obj.put("group", rs.getString(9));
//				dto.setIdx(rs.getString(1));
//				dto.setId(rs.getString(2));
//				dto.setCode(rs.getInt(3));
//				dto.setPostNum(rs.getString(4));
//				dto.setDate(rs.getDate(5));
//				dto.setComment(rs.getString(6));
//				dto.setComClass(rs.getInt(7));
//				dto.setOrder(rs.getInt(8));
//				dto.setGroupNum(rs.getString(9));
				
				// 반환할 경과 목록에 게시물 추가
				array.add(obj);
				
			}
		return null;
	}
	

}
