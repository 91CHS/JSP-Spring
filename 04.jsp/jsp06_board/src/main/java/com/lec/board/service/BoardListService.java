package com.lec.board.service;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;

import com.lec.board.dao.BoardDAO;
import com.lec.board.vo.BoardBean;
import com.lec.db.JDBCUtility;

public class BoardListService {

	
		public int getListCount(String f, String q) {
				// select count(*) from board;  DAO에 쓸 예정
			
				int listCount = 0;
				Connection conn =JDBCUtility.getConnection(); // 커넥트 연결
				BoardDAO boardDAO = BoardDAO.getInstance(); // DAO싱글톤객체 가져오기
				boardDAO.setConnection(conn); // 커넥션풀에서 가져오기
				listCount = boardDAO.selectListCount(f,q);
				JDBCUtility.close(conn, null, null);
				
				//System.out.println("총 글 개수 ==> " + listCount);
			
				return listCount;
			}
			
		public ArrayList<BoardBean> getBoardList(int p, int limit, String f, String q) {
				// select * from board order by board_num desc limit 0,10;  DAO에 쓸 예정
			    // where board_name = '홍길동';
			
				ArrayList<BoardBean> boardList = null;
				Connection conn =JDBCUtility.getConnection();
				BoardDAO boardDAO = BoardDAO.getInstance();
				boardDAO.setConnection(conn);
				boardList = boardDAO.selectBoardList(p, limit, f, q);
				JDBCUtility.close(conn, null, null);
				
				//System.out.println("글 목록조회 ==> " + boardList.toString());
				
				
				return boardList;
			}
}
