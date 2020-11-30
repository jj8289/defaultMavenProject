package kr.co.jj.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jj.common.dao.CommonDAO;
import kr.co.jj.common.service.CommonService;
import kr.co.jj.common.vo.AddrVO;
import kr.co.jj.common.vo.Job;
import kr.co.jj.common.vo.WorkFlag;
import kr.co.jj.company.vo.AddrDTO;

@Service
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	CommonDAO dao;
	
	public Map<String, Object> getJobList() throws Exception {
			
		Map<String, Object> jobMap = new HashMap<String, Object>();
		String jobNo = "";
		
		for(Job job : Job.values()) {
			jobNo = String.valueOf(selectJobNo(job.name()));
			//jobMap.put(job.name(), job.getName());
			jobMap.put(jobNo, job.getName());
		} 
		 
		return jobMap;
		//model.addAttribute("jobList", jobMap); 
	}
	

	
	public Map<String, Object> getWorkFlagList() {
		Map<String, Object> workMap = new HashMap<String, Object>();
		
		for(WorkFlag work : WorkFlag.values()) {
			workMap.put(work.name(), work.getName());
		}
		
		return workMap;
	}


	@Override
	public int selectJobNo(String jobNm) throws Exception {
		return dao.selectJobNo(jobNm);
	}


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
