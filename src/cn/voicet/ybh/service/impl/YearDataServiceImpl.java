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

	public void saveYbhIncome(YearDataForm yearDataForm) {
		yearDataDao.saveYbhIncome(yearDataForm);
	}
}
