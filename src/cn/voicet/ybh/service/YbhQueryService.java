package cn.voicet.ybh.service;

import java.util.Map;

import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YearDataForm;

@SuppressWarnings("unchecked")
public interface YbhQueryService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YbhQueryServiceImpl";
	void getSelectedCunList(DotSession ds);
}
