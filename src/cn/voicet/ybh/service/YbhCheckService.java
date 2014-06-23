package cn.voicet.ybh.service;

import cn.voicet.ybh.util.DotSession;

public interface YbhCheckService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YbhCheckServiceImpl";
	void getYbhListByCurBM(DotSession ds);
}
