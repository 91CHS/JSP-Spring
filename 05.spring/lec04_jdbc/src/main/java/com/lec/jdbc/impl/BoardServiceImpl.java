package com.lec.jdbc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jdbc.dao.BoardDAO;
import com.lec.jdbc.service.BoardService;
import com.lec.jdbc.vo.BoardVO;
import com.lec.jdbc.vo.PageInfo;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public void insertBoard(BoardVO board) {
		boardDAO.insertBoard(board);
	}


	@Override
	public void deleteBoard(int seq) {
		boardDAO.deleteBoard(seq);
	}

	@Override
	public void updateBoard(BoardVO board) {
		boardDAO.updateBoard(board);
	}

	
	@Override
	public BoardVO selectBoard(int seq) {
		return boardDAO.getBoard(seq);
	}
	

	@Override
	public List<BoardVO> getBoardList(int currentPage, int perPage) {
		return boardDAO.getBoardList(currentPage, perPage);
	}

	@Override
	public PageInfo getPageInfo(int currentPage, int perPage) {
		return boardDAO.getPageInfo("board", currentPage, perPage);
	}


	@Override
	public void cntBoard(int seq) {
		boardDAO.getCnt(seq);
	}




}
