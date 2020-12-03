package kr.co.jj.match.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.jj.company.vo.RegisterVO;
import kr.co.jj.match.vo.UserMatchVO;
import kr.co.jj.user.vo.RequireVO;

@Repository
public interface MatchDAO {
	
	public List<UserMatchVO> selectMatchListForUserPT(RequireVO vo) throws Exception;
	
	public List<UserMatchVO> selectMatchListForUserOthers(RequireVO vo) throws Exception;
	
	public int selectMatchTotCnt(RequireVO reqVo) throws Exception;
	
	public void updateMatchFlag(RegisterVO regVo) throws Exception;
}
