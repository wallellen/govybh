package cn.voicet.ybh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YbhFarmerDao;
import cn.voicet.ybh.service.YbhFarmerService;
import cn.voicet.ybh.util.DotSession;

@Transactional(readOnly=true)
@Service(YbhFarmerService.SERVICE_NAME)
public class ServiceImpl implements YbhFarmerService{
	
	@Resource(name=YbhFarmerDao.SERVICE_NAME)
	private YbhFarmerDao ybhFarmerDao;

	public void getSelectedXianList(DotSession ds) {
		ybhFarmerDao.getSelectedXianList(ds);
	}

}
