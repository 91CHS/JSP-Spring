package com.lec.jdbc.dao;

import java.util.List;


import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.lec.jdbc.common.SearchVO;
import com.lec.jdbc.mapper.BoardRowMapper;
import com.lec.jdbc.vo.BoardVO;

@Repository("boardDAO")
@PropertySource("classpath:config/boardsql.properties")
public class BoardDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	Environment environment;
	
	private String sql = "";
	private String selectBySeq = "";
	private String boardTotalRowCount = "";
	private String insertBoard = "";
	private String deleteBoard = "";
	private String updateBoard = "";
	private String updateCount = "";
	private String selectBoardList = "";
	private String selectBoardListByTitle = ""; 
	private String selectBoardListByWriter = ""; 
	private String selectBoardListByContent = ""; 
	
	@PostConstruct
	public void getSqlPropeties() {
		selectBySeq              = environment.getProperty("selectBySeq");
		boardTotalRowCount       = environment.getProperty("boardTotalRowCount");
		insertBoard              = environment.getProperty("insertBoard");
		deleteBoard              = environment.getProperty("deleteBoard");
		updateBoard              = environment.getProperty("updateBoard");
		updateCount              = environment.getProperty("updateCount");
		selectBoardList          = environment.getProperty("selectBoardList");
		selectBoardListByTitle   = environment.getProperty("selectBoardListByTitle");
		selectBoardListByWriter  = environment.getProperty("selectBoardListByWriter");
		selectBoardListByContent = environment.getProperty("selectBorderListByContent");
	}

	public BoardVO getBoard(BoardVO board) {
		Object[] args = { board.getSeq() };		
		return (BoardVO) jdbcTemplate.queryForObject(selectBySeq, args, new BoardRowMapper());
	}
	
	public int getTotalRowCount(SearchVO searchVO) {
		
		if(searchVO.getSearchType()==null || searchVO.getSearchType().isEmpty() ||
				searchVO.getSearchWord()==null || searchVO.getSearchWord().isEmpty()) {
			sql = boardTotalRowCount;
			searchVO.setSearchType("title");
		} else {			
			if(searchVO.getSearchType().equalsIgnoreCase("title")) {
				sql = boardTotalRowCount + " and title like '%" + searchVO.getSearchWord() + "%'";
			} else if(searchVO.getSearchType().equalsIgnoreCase("writer")) {
				sql = boardTotalRowCount + " and writer like '%" + searchVO.getSearchWord() + "%'";
			} else if(searchVO.getSearchType().equalsIgnoreCase("content")) {
				sql = boardTotalRowCount + " and content like '%" + searchVO.getSearchWord() + "%'";
			}	
		}
		return jdbcTemplate.queryForInt(sql);
	}

	public List<BoardVO> getBoardList(SearchVO searchVO) {
				
		if(searchVO.getSearchType()==null || searchVO.getSearchType().isEmpty() ||
				searchVO.getSearchWord()==null || searchVO.getSearchWord().isEmpty()) {
			sql = selectBoardListByTitle;
			searchVO.setSearchType("title");
		} else {
			if(searchVO.getSearchType().equalsIgnoreCase("title")) {
				sql = selectBoardListByTitle;
			} else if(searchVO.getSearchType().equalsIgnoreCase("writer")) {
				sql = selectBoardListByWriter;
			} else if(searchVO.getSearchType().equalsIgnoreCase("content")) {
				sql = selectBoardListByContent;
			} 					
		}
		
		String searchWord = "%" + searchVO.getSearchWord() + "%";					
		Object[] args = {searchWord, searchVO.getFirstRow(), searchVO.getRowSizePerPage()};
		return jdbcTemplate.query(sql, args, new BoardRowMapper());
	}
	
	public BoardVO insertBoard(BoardVO board) {
		jdbcTemplate.update(insertBoard, board.getTitle(), board.getWriter(), board.getContent(), board.getFileName());
		return board;
	}	
	
	public int deleteBoard(BoardVO board) {
		
		System.out.println(board.toString());
		
		return jdbcTemplate.update(deleteBoard, board.getSeq());
	}

	public int updateBoard(BoardVO board) {
		return jdbcTemplate.update(updateBoard, board.getTitle(), board.getContent(), board.getSeq());
	}
	
	public void updateCount(BoardVO board) {
		jdbcTemplate.update(updateCount,  board.getSeq());
	}
	
	
}