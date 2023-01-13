package com.lec.jdbc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jdbc.common.SearchVO;
import com.lec.jdbc.dao.BoardDAO;
import com.lec.jdbc.service.BoardService;
import com.lec.jdbc.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;
	
//	public BoardServiceImpl() {
//		System.out.println("Service 객체 생성!!!!");
//	}
	
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}
	
	public int getTotalRowCount(SearchVO searchVO) {
		return boardDAO.getTotalRowCount(searchVO);
	}
	
	@Override
	public List<BoardVO> getBoardList(SearchVO searchVO) {
		return boardDAO.getBoardList(searchVO);
	}

	@Override
	public BoardVO insertBoard(BoardVO board) {
		return boardDAO.insertBoard(board);
	}

	@Override
	public int deleteBoard(BoardVO board) {
		return boardDAO.deleteBoard(board);
	}

	@Override
	public int updateBoard(BoardVO board) {
		return boardDAO.updateBoard(board);
	}
	
	@Override
	public void updateCount(BoardVO board) {
		boardDAO.updateCount(board);
	}
	
}
