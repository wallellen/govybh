package cn.voicet.ybh.service;

import java.util.Map;

import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbcManageForm;

public interface YbcManageService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YbcManageServiceImpl";
	void getSelectedCunList(DotSession ds);
	Map queryCunYbhInfoWithYear(DotSession ds, YbcManageForm ybcManageForm);
	void getYbhYearInfo(DotSession ds);
	void getYbcYearInfo(DotSession ds);
}
