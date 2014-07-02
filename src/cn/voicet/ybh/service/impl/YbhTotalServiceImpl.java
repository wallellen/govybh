package cn.voicet.ybh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YbhTotalDao;
import cn.voicet.ybh.service.YbhTotalService;

@Transactional(readOnly=true)
@Service(YbhTotalService.SERVICE_NAME)
public class YbhTotalServiceImpl implements YbhTotalService{
	
	@Resource(name=YbhTotalDao.SERVICE_NAME)
	private YbhTotalDao ybhTotalDao;
}
