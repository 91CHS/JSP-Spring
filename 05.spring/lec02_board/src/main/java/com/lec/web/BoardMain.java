package com.lec.web;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class BoardMain {

	public static void main(String[] args) {
			
		AbstractApplicationContext factory = new GenericXmlApplicationContext("boardContext.xml");
		BoardService boardService = (BoardService) factory.getBean("boardService");
		
		BoardVO board = new BoardVO();
		
//		board.setTitle("임시제목입니다!");
//		board.setWriter("최한솔");
//		board.setContent("상세 글 내용입니다...");
//		boardService.insertBoard(board);
		
		
		
//		List<BoardVO> boardList = boardService.getBoardList(board);
//		for (BoardVO bl : boardList) {
//			System.out.println(bl.toString());
//		}
		
//		board.setSeq(2);
//		boardService.deleteBoard(board);
		
//		board.setTitle("업데이트 제목입니다!");
//		board.setContent("업데이트 글 내용입니다...");
//		board.setSeq(3);
//		boardService.updateBoard(board);
		
		
		
		
		
		factory.close();
	}

}
