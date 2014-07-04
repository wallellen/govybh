package cn.voicet.ybh.service;

import cn.voicet.ybh.util.DotSession;

public interface YbcManageService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YbcManageServiceImpl";
	void getSelectedCunList(DotSession ds);
}
