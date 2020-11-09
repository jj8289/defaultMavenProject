package kr.co.jj.common.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.jj.common.service.CommonService;
import kr.co.jj.common.vo.Job;

@Service
public class CommonServiceImpl implements CommonService{
	
	public Map<String, Object> getJobList() {
			
		Map<String, Object> jobMap = new HashMap<String, Object>();
		
		for(Job job : Job.values()) {
			jobMap.put(job.name(), job.getName());
		} 
		
		return jobMap;
		//model.addAttribute("jobList", jobMap); 
	}
}
