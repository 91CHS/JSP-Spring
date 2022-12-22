package com.lec.board.action;

import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardWriteService;
import com.lec.board.vo.ActionFoward;
import com.lec.board.vo.BoardBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//System.out.println("===> 글 등록하기!!!");
		
		ActionFoward forward = null;
		BoardBean board = null;
		String realFolder = "";
		String saveFolder = "D:/CHS/99.temp/upload";
		int filesize = 1024*1024*5; //5mb
		
		String p = req.getParameter("p");
		String f = req.getParameter("f");
		String q = URLEncoder.encode(req.getParameter("q"),"utf-8");
		
		// 이번엔 context.xml로 db를 연결해보자. (중간중간 바꾸면 수정가능한게 이점)
		// 연결하려면 ServletContext를 사용
		ServletContext context = req.getServletContext();
		realFolder = context.getRealPath("/boardUpload");
		//System.out.println(realFolder + "\n" + saveFolder);
		
		MultipartRequest multi = null;;
		
		try {
			multi = new MultipartRequest(req, saveFolder, filesize, "utf-8", new DefaultFileRenamePolicy());
			board = new BoardBean();
			board.setBoard_name(multi.getParameter("board_name"));
			board.setBoard_pass(multi.getParameter("board_pass"));
			board.setBoard_subject(multi.getParameter("board_subject"));
			board.setBoard_content(multi.getParameter("board_content"));
			board.setBoard_file(multi.getParameter(multi.getOriginalFileName((String) multi.getFileNames().nextElement())));
			
			// System.out.println("======>" + board.toString());  //BoardBean [board_num=0, board_name=홍길동, board_subject=Wed Dec 21 13:11:11 KST 2022, board_readcount=0]
			BoardWriteService boardWriteService = new BoardWriteService();
			boardWriteService.registerBoard(board);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return null;
	}

}
