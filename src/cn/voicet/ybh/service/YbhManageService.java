package cn.voicet.ybh.service;

import cn.voicet.ybh.util.DotSession;

public interface YbhManageService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YbhManageServiceImpl";
	void getYbhListByCurBM(DotSession ds);
}
