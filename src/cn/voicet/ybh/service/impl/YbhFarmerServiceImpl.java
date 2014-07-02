package cn.voicet.ybh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YbhFarmerDao;
import cn.voicet.ybh.service.YbhFarmerService;

@Transactional(readOnly=true)
@Service(YbhFarmerService.SERVICE_NAME)
public class YbhFarmerServiceImpl implements YbhFarmerService{
	
	@Resource(name=YbhFarmerDao.SERVICE_NAME)
	private YbhFarmerDao ybhFarmerDao;

}