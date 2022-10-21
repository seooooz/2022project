package board.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.Action;
import member.service.ActionForward;
import utils.CommentDAO;
import utils.CommentDTO;

public class CommentList2 implements Action{

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
//		Map<String, Object> obj = new HashMap<String, Object>();
		for(int i = 0; i < comLists.size(); i++) {
//			obj.put("idx", comLists.get(i).getId());
//			obj.put("id", comLists.get(i).getId());
//			obj.put("code", comLists.get(i).getCode());
//			obj.put("pnum", comLists.get(i).getPostNum());
//			obj.put("date", comLists.get(i).getDate());
//			obj.put("comment", comLists.get(i).getComment());
//			obj.put("class", comLists.get(i).getClass());
//			obj.put("order", comLists.get(i).getOrder());
//			obj.put("group", comLists.get(i).getGroupNum());
			
			
			
			
			strXML+="<general>";
			strXML+= "<person>";
			strXML+= "<name>"+ comLists.get(i).getId() +"</name>";
			strXML+= "<age>"+ comLists.get(i).getDate() +"</age>";
			strXML+= "<salary>"+ comLists.get(i).getComment() +"</salary>";
			strXML+= "<idx>"+ comLists.get(i).getIdx() +"</idx>";
			strXML+= "</person>";
			strXML+="</general>";
		}
		out.write(comLists.toString());
		
		return null;
	}
	
	

}
