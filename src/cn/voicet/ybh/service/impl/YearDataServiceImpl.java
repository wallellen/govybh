package cn.voicet.ybh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YearDataDao;
import cn.voicet.ybh.service.YearDataService;
import cn.voicet.ybh.util.DotSession;

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

}
