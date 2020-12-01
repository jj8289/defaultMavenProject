package kr.co.jj.match.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.jj.match.vo.UserMatchVO;
import kr.co.jj.user.vo.RequireVO;

@Repository
public interface MatchDAO {
	
	public List<UserMatchVO> selectMatchListForUser(RequireVO vo) throws Exception;
}
