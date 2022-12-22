package com.lec.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardListService;
import com.lec.board.vo.ActionFoward;
import com.lec.board.vo.BoardBean;
import com.lec.board.vo.PageInfo;

public class BoardListAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//System.out.println("===> 글 목록보기!!!");
		
		ArrayList<BoardBean> boardList = new ArrayList<>();
		
		int page = 1;
		int limit = 10; // select xx limit 0 10; 쓸때 사용
		
		//http://localhost:8088/jsp06_board/boardList.bo?p=1&f=board_name&q=
		int p = page;  // p 파라미터
		String f = "";
		String q = "";
		
		if(req.getParameter("p") != null) p = Integer.parseInt(req.getParameter("p")); // 페이지(인트)
		if(req.getParameter("f") != null) f = (req.getParameter("f")); else f = "board_name";  //작성자
		if(req.getParameter("q") != null) q = (req.getParameter("q"));  //검색어
		
		BoardListService boardListService = new BoardListService();
		int listCount = boardListService.getListCount(f, q);
		boardList = boardListService.getBoardList(p, limit, f , q);
		
		
		// 페이징처리
		// 총 페이지수
		int totalPage = (int)((double)listCount / limit + 0.95);
		
		// 현재페이지의 시작페이지(1, 11, 21... -> 21 22 ....30 )
	    int startPage = (((int)((double)p / 10 + 0.9))-1) * 10 +1 ;
	    
	    // 현재페이지의 마지막페이지수
	    int endPage = startPage + 10 - 1;
	    if(endPage > totalPage) endPage = totalPage;
	    
		PageInfo pageInfo = new PageInfo();
		pageInfo.setListCount(listCount);
		pageInfo.setPage(p);
		pageInfo.setTotalPage(totalPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
	    
		req.setAttribute("pageInfo", pageInfo);	
		req.setAttribute("boardList", boardList);
		
		ActionFoward forward = new ActionFoward();
		forward.setPath("/board/board_list.jsp?p=" + p + "&f=" + f + "&q=" + q);
		return forward;
		
	}

}
