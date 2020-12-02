package kr.co.jj.match.service;

import java.util.List;

import kr.co.jj.match.vo.UserMatchVO;
import kr.co.jj.user.vo.RequireVO;

public interface MatchService {

	public List<UserMatchVO> selectMatchListForUserPT(RequireVO vo) throws Exception;
	
	public List<UserMatchVO> selectMatchListForUserOthers(RequireVO vo) throws Exception;

	public int selectMatchTotCnt(RequireVO reqVo) throws Exception;
	
}
