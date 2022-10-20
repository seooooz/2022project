package board.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import member.service.Action;
import member.service.ActionForward;
import utils.CommentDAO;
import utils.CommentDTO;

public class CommentList3{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws SerialException ,IOException {
		
		String no = request.getParameter("no");
		int code = Integer.parseInt(request.getParameter("code"));
		
		CommentDAO dao = new CommentDAO();
		CommentDTO dto = new CommentDTO();
		
		dto.setCode(code);
		dto.setPostNum(no);
		
		List<CommentDTO> comLists = dao.comselectView(code, no);
		
		request.setAttribute("comLists", comLists);
		
	}
	
	

}
