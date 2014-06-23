package cn.voicet.ybh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YbhManageDao;
import cn.voicet.ybh.service.YbhManageService;
import cn.voicet.ybh.util.DotSession;

@Transactional(readOnly=true)
@Service(YbhManageService.SERVICE_NAME)
public class YbhManageServiceImpl implements YbhManageService{
	
	@Resource(name=YbhManageDao.SERVICE_NAME)
	private YbhManageDao ybhManageDao;

	public void getYbhListByCurBM(DotSession ds) {
		ybhManageDao.getYbhListByCurBM(ds);
	}

}
