package kr.co.jj.match.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jj.match.dao.MatchDAO;
import kr.co.jj.match.service.MatchService;

@Service
public class MatchServiceImpl implements MatchService{
	
	@Autowired
	private MatchDAO matchDao;
	
	
}
