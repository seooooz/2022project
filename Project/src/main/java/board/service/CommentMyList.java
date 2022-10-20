package board.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.Action;
import member.service.ActionForward;
import utils.CommentDAO;
import utils.CommentDTO;

public class CommentMyList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String no = request.getParameter("no");
		int code = Integer.parseInt(request.getParameter("code"));
		
		CommentDAO dao = new CommentDAO();
		CommentDTO dto = new CommentDTO();
		
		
		dto.setCode(code);
		dto.setPostNum(no);
		
		int myindex = dao.myindex(id);
		List<CommentDTO> comMyLists = dao.comMyView(code, no, myindex);
		
		String strXML=" ";
		for(int i = 0; i < comMyLists.size(); i++) {
			
			strXML+="<general>";
			strXML+= "<person>";
			strXML+= "<name>"+ comMyLists.get(i).getId() +"</name>";
			strXML+= "<age>"+ comMyLists.get(i).getDate() +"</age>";
			strXML+= "<salary>"+ comMyLists.get(i).getComment() +"</salary>";
			strXML+= "</person>";
			strXML+="</general>";
		}
		out.write(strXML);
		
		
//		List<CommentDTO> commentList = dao.comselectView(no);
//		
//		response.getWriter().print(comLists);
		
		return null;
	}

}
