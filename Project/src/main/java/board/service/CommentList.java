package board.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.Action;
import member.service.ActionForward;
import utils.CommentDAO;
import utils.CommentDTO;

public class CommentList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String no = request.getParameter("no");
		int code = Integer.parseInt(request.getParameter("code"));
		
		CommentDAO dao = new CommentDAO();
		CommentDTO dto = new CommentDTO();
		
		dto.setCode(code);
		dto.setPostNum(no);
		
		List<CommentDTO> comLists = dao.comselectView(code, no);
		
		String strXML=" ";
		for(int i = 0; i < comLists.size(); i++) {
			System.out.println("idx : "+comLists.get(i).getIdx());
			strXML+="<general>";
			strXML+= "<person>";
			strXML+= "<name>"+ comLists.get(i).getId() +"</name>";
			strXML+= "<age>"+ comLists.get(i).getDate() +"</age>";
			strXML+= "<salary>"+ comLists.get(i).getComment() +"</salary>";
			strXML+= "<idx>"+ comLists.get(i).getIdx() +"</idx>";
			strXML+= "</person>";
			strXML+="</general>";
		}
		out.write(strXML);
		
		
//		List<CommentDTO> commentList = dao.comselectView(no);
//		
//		response.getWriter().print(comLists);
//		request.setAttribute("comLists", comLists);
		
		return null;
	}
	
	

}
