package com.lec.jdbc.dao;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.lec.jdbc.impl.BoardRowMapper;
import com.lec.jdbc.vo.BoardVO;
import com.lec.jdbc.vo.PageInfo;


@Repository("boardDAO")
public class BoardDAO {

	private JdbcTemplate jdbcTemplate;
	
	public BoardDAO() {
		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");
		this.jdbcTemplate = (JdbcTemplate) container.getBean("jdbcTemplate");
	}

	
	public PageInfo getPageInfo(String tableName, int currentPage, int perPage) {
		
		PageInfo pageInfo = new PageInfo();
		String sql = "select count(*) from " + tableName;
		
		int totalCount = 0;
		int totalPages  = 0;
		int startPage   = 0;
		int endPage     = 0;
		
		totalCount = jdbcTemplate.queryForInt(sql);

		if(totalCount>0) {
			totalPages = (int)(totalCount / perPage) + ((totalCount % perPage == 0) ? 0 : 1);
			startPage = (int)(currentPage / perPage) * perPage + 1 + ((currentPage % perPage == 0) ? -perPage : 0);
//			endPage = (startPage >= totalPages) ? totalPages : startPage + perPage -1;
		 if(startPage+perPage-1>=totalPages) { endPage = totalPages;            
		         }else {
		            endPage = (startPage >= totalPages) ? totalPages : startPage + perPage - 1;
		         }
		}

		pageInfo.setTotalCount(totalCount);
		pageInfo.setTotalPages(totalPages);
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		
		return pageInfo;
	}
	
	
	public BoardVO getBoard(int seq) {
		String sql = "select * from board where seq = ?";
		Object[] args = { seq };
		return (BoardVO) jdbcTemplate.queryForObject(sql, args, new BoardRowMapper());
	}

	public List<BoardVO> getBoardList(int currentPage, int perPage){
		String sql = "select * from board limit ?, ?";
		
		Object[] args = { (currentPage-1)*perPage,  perPage};
		return jdbcTemplate.query(sql,args, new BoardRowMapper());
	}
	
	public void insertBoard(BoardVO board) {
		String sql = "insert into board(title,writer,content,cnt)"
				+"values(?,?,?,0)";
		jdbcTemplate.update(sql, board.getTitle(),board.getWriter(),board.getContent());
	}
	
	public void deleteBoard(int seq) {
		String sql = "delete from board where seq = ?";
		jdbcTemplate.update(sql, seq);
	}

	public void updateBoard(BoardVO board) {	
		
		String sql = "update board set title=?, writer=?, content=?, cnt=0 where seq = ?";
		jdbcTemplate.update(sql, board.getTitle(),board.getWriter(),board.getContent(), board.getSeq());
	}
	
	public void getCnt(int seq) {
		String sql = "update board set cnt=cnt+1 where seq = ?";
		Object[] args = { seq };
		jdbcTemplate.update(sql, args);
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
