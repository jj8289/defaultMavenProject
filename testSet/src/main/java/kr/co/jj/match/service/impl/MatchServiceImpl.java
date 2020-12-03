package kr.co.jj.match.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jj.company.vo.RegisterVO;
import kr.co.jj.match.dao.MatchDAO;
import kr.co.jj.match.service.MatchService;
import kr.co.jj.match.vo.UserMatchVO;
import kr.co.jj.user.vo.RequireVO;
import kr.co.jj.user.vo.UserVO;

@Service
public class MatchServiceImpl implements MatchService{
	
	@Autowired
	private MatchDAO matchDao;

	@Override
	public List<UserMatchVO> selectMatchListForUserPT(RequireVO vo) throws Exception {
		return matchDao.selectMatchListForUserPT(vo);
	}

	@Override
	public List<UserMatchVO> selectMatchListForUserOthers(RequireVO vo) throws Exception {
		return matchDao.selectMatchListForUserOthers(vo);
	}

	@Override
	public int selectMatchTotCnt(RequireVO reqVo) throws Exception {
		return matchDao.selectMatchTotCnt(reqVo);
	}

	@Override
	public void updateMatchFlag(RegisterVO regVo) throws Exception {
		matchDao.updateMatchFlag(regVo);
	}

	@Override
	public void updateMatchStatus(UserVO param) throws Exception {
		matchDao.updateMatchStatus(param);
	}
}
