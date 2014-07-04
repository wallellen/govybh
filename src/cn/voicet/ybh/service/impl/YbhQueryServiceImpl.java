package cn.voicet.ybh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YbhQueryDao;
import cn.voicet.ybh.service.YbhQueryService;
import cn.voicet.ybh.util.DotSession;

@Transactional(readOnly=true)
@Service(YbhQueryService.SERVICE_NAME)
public class YbhQueryServiceImpl implements YbhQueryService{
	
	@Resource(name=YbhQueryDao.SERVICE_NAME)
	private YbhQueryDao ybhQueryDao;
	public void getSelectedCunList(DotSession ds) {
		ybhQueryDao.getSelectedCunList(ds);
	}

}
