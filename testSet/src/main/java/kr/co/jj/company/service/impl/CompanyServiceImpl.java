package kr.co.jj.company.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jj.common.vo.AddrVO;
import kr.co.jj.company.dao.CompanyDAO;
import kr.co.jj.company.service.CompanyService;
import kr.co.jj.company.vo.AddrDTO;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	CompanyDAO dao;
	
	@Override
	public List<AddrVO> selectSdList() throws Exception {
		return dao.selectSdList();
	}

	@Override
	public List<AddrVO> selectSgList(AddrDTO dto) throws Exception {
		return dao.selectSgList(dto);
	}

	@Override
	public List<AddrVO> selectDnList(AddrDTO dto) throws Exception {
		return dao.selectDnList(dto);
	}
	
}
