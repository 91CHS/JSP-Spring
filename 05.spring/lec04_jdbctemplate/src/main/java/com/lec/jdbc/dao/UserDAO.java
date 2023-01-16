package com.lec.jdbc.dao;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.lec.jdbc.common.SearchVO;
import com.lec.jdbc.mapper.UserRowMapper;
import com.lec.jdbc.vo.UserVO;

@Repository("userDAO")
@PropertySource("classpath:config/usersql.properties")
public class UserDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	Environment environment;
	
	private String sql = "";
	private String selectById = "";
	private String userTotalRowCount = "";
	private String insertUser = "";
	private String deleteUser = "";
	private String updateUser = "";
	private String selectUserList = "";
	private String selectUserListById = ""; 
	private String selectUserListByName = ""; 
	
	@PostConstruct
	public void getSqlPropeties() {
		selectById           = environment.getProperty("selectById");
		userTotalRowCount    = environment.getProperty("userTotalRowCount");
		insertUser           = environment.getProperty("insertUser");
		deleteUser           = environment.getProperty("deleteUser");
		updateUser           = environment.getProperty("updateUser");
		selectUserList       = environment.getProperty("selectUserList");
		selectUserListById   = environment.getProperty("selectUserListById");
		selectUserListByName = environment.getProperty("selectUserListByName");
	}

	public UserVO getUser(UserVO user) {
		// System.out.println(jdbcTemplate.getDataSource().getConnection().toString());
		Object[] args = { user.getId() };		
		return (UserVO) jdbcTemplate.queryForObject(selectById, args, new UserRowMapper());
	}
	
	public int getTotalRowCount(SearchVO searchVO) {
		sql = userTotalRowCount;
		String sw = searchVO.getSearchWord()==null ? "" : searchVO.getSearchWord();
		String st = searchVO.getSearchType();
		sql = sw =="" ? sql : (st.equalsIgnoreCase("id") ? sql + " and id like '%" + sw +"%'" : sql + " and name like '%" + sw + "%'");
		return jdbcTemplate.queryForInt(sql);
	}

	public List<UserVO> getUserList(SearchVO searchVO) {	
		sql = searchVO.getSearchWord()==null ? selectUserListById : 
				(searchVO.getSearchType().equalsIgnoreCase("id") ? selectUserListById : selectUserListByName);
		
		String searchWord = "%" + searchVO.getSearchWord() + "%";			
		Object[] args = {searchWord, searchVO.getFirstRow(), searchVO.getRowSizePerPage()};
		return jdbcTemplate.query(sql, args, new UserRowMapper());
	}
	
	public UserVO insertUser(UserVO user) {
		user.setRole((user.getRole() != null) ? "ADMIN" : "USER");	
		jdbcTemplate.update(insertUser, user.getId(), user.getPassword(), user.getName(), user.getRole());
		return user;
	}	
	
	public int deleteUser(UserVO user) {
		return jdbcTemplate.update(deleteUser, user.getId());
	}

	public int updateUser(UserVO user) {
		user.setRole((user.getRole() != null) ? "ADMIN" : "USER");
		return jdbcTemplate.update(updateUser, user.getName(), user.getPassword(), user.getRole(), user.getId());
	}

}


