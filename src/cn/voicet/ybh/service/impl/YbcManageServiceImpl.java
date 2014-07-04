package cn.voicet.ybh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YbcManageDao;
import cn.voicet.ybh.service.YbcManageService;
import cn.voicet.ybh.util.DotSession;

@Transactional(readOnly=true)
@Service(YbcManageService.SERVICE_NAME)
public class YbcManageServiceImpl implements YbcManageService{
	
	@Resource(name=YbcManageDao.SERVICE_NAME)
	private YbcManageDao ybcManageDao;
	public void getSelectedCunList(DotSession ds) {
		ybcManageDao.getSelectedCunList(ds);
	}

}