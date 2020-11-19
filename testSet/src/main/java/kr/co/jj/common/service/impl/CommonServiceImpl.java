package kr.co.jj.common.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jj.common.dao.CommonDAO;
import kr.co.jj.common.service.CommonService;
import kr.co.jj.common.vo.Job;
import kr.co.jj.common.vo.WorkFlag;

@Service
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	CommonDAO dao;
	
	public Map<String, Object> getJobList() {
			
		Map<String, Object> jobMap = new HashMap<String, Object>();
		
		for(Job job : Job.values()) {
			jobMap.put(job.name(), job.getName());
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
}
