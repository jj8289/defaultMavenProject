package kr.co.jj.common.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface CommonDAO {
	public int selectJobNo(String jobNm) throws Exception;
}
