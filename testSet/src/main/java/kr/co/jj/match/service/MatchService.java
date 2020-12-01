package kr.co.jj.match.service;

import java.util.List;

import kr.co.jj.match.vo.UserMatchVO;
import kr.co.jj.user.vo.RequireVO;

public interface MatchService {

	public List<UserMatchVO> selectMatchListForUser(RequireVO vo) throws Exception;
	
}
