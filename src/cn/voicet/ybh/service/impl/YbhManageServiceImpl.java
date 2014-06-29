package cn.voicet.ybh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YbhManageDao;
import cn.voicet.ybh.service.YbhManageService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhManageForm;

@Transactional(readOnly=true)
@Service(YbhManageService.SERVICE_NAME)
public class YbhManageServiceImpl implements YbhManageService{
	
	@Resource(name=YbhManageDao.SERVICE_NAME)
	private YbhManageDao ybhManageDao;

	public void getYbhListByCurBM(DotSession ds) {
		ybhManageDao.getYbhListByCurBM(ds);
	}
	public void getYbhFamilyDetailInfo(DotSession ds) {
		ybhManageDao.getYbhFamilyDetailInfo(ds);
	}

	public void getFamilyIncome(DotSession ds) {
		ybhManageDao.getFamilyIncome(ds);
	}

	public void saveFamilyInfo(DotSession ds, YbhManageForm ybhManageForm) {
		ybhManageDao.saveFamilyInfo(ds, ybhManageForm);
	}

	public void saveMemberInfo(DotSession ds, YbhManageForm ybhManageForm) {
		ybhManageDao.saveMemberInfo(ds, ybhManageForm);
	}

	public void deleteMemberInfo(DotSession ds, YbhManageForm ybhManageForm) {
		ybhManageDao.deleteMemberInfo(ds, ybhManageForm);
	}

	public void saveYearInfo(DotSession ds, YbhManageForm ybhManageForm) {
		ybhManageDao.saveYearInfo(ds, ybhManageForm);
	}
	
	public void saveYbhIncome(YbhManageForm ybhManageForm) {
		ybhManageDao.saveYbhIncome(ybhManageForm);
	}

}
