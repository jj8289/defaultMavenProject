package kr.co.jj.company.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jj.common.vo.AddrVO;
import kr.co.jj.company.dao.CompanyDAO;
import kr.co.jj.company.service.CompanyService;
import kr.co.jj.company.vo.AddrDTO;
import kr.co.jj.company.vo.CompanyVO;

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

	@Override
	public int selectCompanyCountByManagerId(CompanyVO vo) throws Exception {
		return dao.selectCompanyCountByManagerId(vo);
	}

	@Override
	public int selectCompany(CompanyVO vo) throws Exception {
		return dao.selectCompany(vo);
	}

	@Override
	public CompanyVO selectCompanyByManagerId(CompanyVO vo) throws Exception {
		return dao.selectCompanyByManagerId(vo);
	}

	@Override
	public void insertCompany(CompanyVO vo) throws Exception {
		dao.insertCompany(vo);;
	}

	@Override
	public CompanyVO selectManager(CompanyVO vo) throws Exception {
		return dao.selectManager(vo);
	}
	
}
