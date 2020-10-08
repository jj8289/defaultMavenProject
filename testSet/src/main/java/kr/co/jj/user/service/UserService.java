package kr.co.jj.user.service;

import kr.co.jj.user.vo.RegisterVO;
import kr.co.jj.user.vo.UserVO;

public interface UserService {
	
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
	
	public void updateRegister(RegisterVO vo) throws Exception;
}
