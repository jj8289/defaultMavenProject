package kr.co.jj.match.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jj.match.dao.MatchDAO;
import kr.co.jj.match.service.MatchService;
import kr.co.jj.match.vo.UserMatchVO;
import kr.co.jj.user.vo.RequireVO;

@Service
public class MatchServiceImpl implements MatchService{
	
	@Autowired
	private MatchDAO matchDao;

	@Override
	public List<UserMatchVO> selectMatchListForUser(RequireVO vo) throws Exception {
		return matchDao.selectMatchListForUser(vo);
	}
	
	
}
