package cn.voicet.ybh.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YearDataDao;
import cn.voicet.ybh.service.YearDataService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YearDataForm;

@Transactional(readOnly=true)
@Service(YearDataService.SERVICE_NAME)
public class YearDataServiceImpl implements YearDataService{
	
	@Resource(name=YearDataDao.SERVICE_NAME)
	private YearDataDao yearDataDao;

	public void getYbhYearInfo(DotSession ds) {
		yearDataDao.getYbhYearInfo(ds);
	}

	public void getYbhListByCurBM(DotSession ds) {
		yearDataDao.getYbhListByCurBM(ds);
	}

	public Map queryCunYbhInfoWithYear(DotSession ds, YearDataForm yearDataForm) {
		return yearDataDao.queryCunYbhInfoWithYear(ds, yearDataForm);
	}

	public void saveCunYbhData(YearDataForm yearDataForm) {
		yearDataDao.saveCunYbhData(yearDataForm);
	}

	public void getYbhFamilyDetailInfo(DotSession ds) {
		yearDataDao.getYbhFamilyDetailInfo(ds);
	}

	public void getFamilyIncome(DotSession ds) {
		yearDataDao.getFamilyIncome(ds);
	}

	public void saveFamilyInfo(DotSession ds, YearDataForm yearDataForm) {
		yearDataDao.saveFamilyInfo(ds, yearDataForm);
	}

	public void saveMemberInfo(DotSession ds, YearDataForm yearDataForm) {
		yearDataDao.saveMemberInfo(ds, yearDataForm);
	}

	public void deleteMemberInfo(DotSession ds, YearDataForm yearDataForm) {
		yearDataDao.deleteMemberInfo(ds, yearDataForm);
	}

}
