package cn.voicet.ybh.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YbcManageDao;
import cn.voicet.ybh.service.YbcManageService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbcManageForm;

@Transactional(readOnly=true)
@Service(YbcManageService.SERVICE_NAME)
public class YbcManageServiceImpl implements YbcManageService{
	
	@Resource(name=YbcManageDao.SERVICE_NAME)
	private YbcManageDao ybcManageDao;
	public void getSelectedCunList(DotSession ds) {
		ybcManageDao.getSelectedCunList(ds);
	}
	public Map queryCunYbhInfoWithYear(DotSession ds,
			YbcManageForm ybcManageForm) {
		return ybcManageDao.queryCunYbhInfoWithYear(ds, ybcManageForm);
	}
	public void getYbhYearInfo(DotSession ds) {
		ybcManageDao.getYbhYearInfo(ds);
	}
	public void getYbcYearInfo(DotSession ds) {
		ybcManageDao.getYbcYearInfo(ds);
	}

}
