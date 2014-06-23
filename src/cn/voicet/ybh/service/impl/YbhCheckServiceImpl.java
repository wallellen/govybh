package cn.voicet.ybh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YbhCheckDao;
import cn.voicet.ybh.service.YbhCheckService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhCheckForm;

@Transactional(readOnly=true)
@Service(YbhCheckService.SERVICE_NAME)
public class YbhCheckServiceImpl implements YbhCheckService{
	
	@Resource(name=YbhCheckDao.SERVICE_NAME)
	private YbhCheckDao ybhCheckDao;

	public void getYbhListByCurBM(DotSession ds) {
		ybhCheckDao.getYbhListByCurBM(ds);
	}

	public void selectYbhWithOpcode(YbhCheckForm ybhCheckForm) {
		ybhCheckDao.selectYbhWithOpcode(ybhCheckForm);
	}

}
