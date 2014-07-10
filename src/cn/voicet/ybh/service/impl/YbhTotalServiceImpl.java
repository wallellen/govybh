package cn.voicet.ybh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YbhTotalDao;
import cn.voicet.ybh.service.YbhTotalService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhTotalForm;

@Transactional(readOnly=true)
@Service(YbhTotalService.SERVICE_NAME)
public class YbhTotalServiceImpl implements YbhTotalService{
	
	@Resource(name=YbhTotalDao.SERVICE_NAME)
	private YbhTotalDao ybhTotalDao;

	public void getYbhTotalInfo(DotSession ds, YbhTotalForm ybhTotalForm) {
		ybhTotalDao.getYbhTotalInfo(ds, ybhTotalForm);
	}

	public void getYbhYearInfo(DotSession ds) {
		ybhTotalDao.getYbhYearInfo(ds);
	}
}
