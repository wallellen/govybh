package cn.voicet.ybh.service;

import java.util.Map;

import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YearDataForm;

public interface YearDataService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YearDataServiceImpl";
	void getYbhYearInfo(DotSession ds);
	void getYbhListByCurBM(DotSession ds);
	Map queryCunYbhInfoWithYear(DotSession ds, YearDataForm yearDataForm);
	void saveCunYbhData(YearDataForm yearDataForm);
	void getYbhFamilyDetailInfo(DotSession ds);
	void getFamilyIncome(DotSession ds);
	void saveFamilyInfo(DotSession ds, YearDataForm yearDataForm);
}
