package kr.co.jj.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jj.user.dao.UserDAO;
import kr.co.jj.user.service.UserService;
import kr.co.jj.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public int selectUserCountByUserId(UserVO vo) throws Exception {
		return userDAO.selectUserCountByUserId(vo);
	}

	@Override
	public int selectUser(UserVO vo) throws Exception {
		return userDAO.selectUser(vo);
	}

	@Override
	public void insertUser(UserVO user) {
		userDAO.insertUser(user);
	}
	
}
