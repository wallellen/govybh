package cn.voicet.ybh.service;

import cn.voicet.ybh.util.DotSession;

public interface YearDataService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YearDataServiceImpl";
	void getYbhYearInfo(DotSession ds);
}
