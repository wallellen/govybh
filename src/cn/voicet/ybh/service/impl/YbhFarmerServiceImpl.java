package cn.voicet.ybh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YbhFarmerDao;
import cn.voicet.ybh.service.YbhFarmerService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhFarmerForm;

@Transactional(readOnly=true)
@Service(YbhFarmerService.SERVICE_NAME)
public class YbhFarmerServiceImpl implements YbhFarmerService{
	
	@Resource(name=YbhFarmerDao.SERVICE_NAME)
	private YbhFarmerDao ybhFarmerDao;

	public void getSelectedXianList(DotSession ds) {
		ybhFarmerDao.getSelectedXianList(ds);
	}

	public void getFarmerInfoList(DotSession ds, YbhFarmerForm ybhFarmerForm) {
		ybhFarmerDao.getFarmerInfoList(ds, ybhFarmerForm);
	}

	public void getAllFarmerInfoList(DotSession ds, YbhFarmerForm ybhFarmerForm) {
		ybhFarmerDao.getAllFarmerInfoList(ds, ybhFarmerForm);
	}

}
