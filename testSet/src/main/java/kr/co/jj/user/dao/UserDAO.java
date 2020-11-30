package kr.co.jj.user.dao;

import org.springframework.stereotype.Repository;

import kr.co.jj.user.vo.RequireVO;
import kr.co.jj.user.vo.UserVO;

@Repository
public interface UserDAO {
	
	/**
	 * 아이디 중복 체크
	 */
	public int selectUserCountByUserId(UserVO vo) throws Exception;
	
	/**
	 * 유저 체크
	 */
	public int selectUser(UserVO vo) throws Exception;

	public UserVO selectUserByUserId(UserVO vo) throws Exception;
	
	public void insertUser(UserVO user) throws Exception;
	
	public RequireVO selectRequire(UserVO user) throws Exception;
	
	public void updateRequire(RequireVO vo) throws Exception;
	
	public void updateUser(UserVO vo) throws Exception;
}
