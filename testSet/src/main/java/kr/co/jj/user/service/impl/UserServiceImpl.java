package kr.co.jj.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jj.user.dao.UserDAO;
import kr.co.jj.user.service.UserService;
import kr.co.jj.user.vo.RequireVO;
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
	public UserVO selectUserByUserId(UserVO vo) throws Exception {
		return userDAO.selectUserByUserId(vo);
	}

	@Override
	public void insertUser(UserVO user) throws Exception{
		userDAO.insertUser(user);
	}

	@Override
	public RequireVO selectRequire(UserVO user) throws Exception {
		return userDAO.selectRequire(user);
	}

	@Override
	public void updateRequire(RequireVO vo) throws Exception {
		userDAO.updateRequire(vo);
	}

	@Override
	public void updateUser(UserVO vo) throws Exception {
		userDAO.updateUser(vo);
	}
}
