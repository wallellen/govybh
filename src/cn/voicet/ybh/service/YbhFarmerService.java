package cn.voicet.ybh.service;

import cn.voicet.ybh.util.DotSession;

public interface YbhFarmerService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YbhFarmerServiceImpl";
	void getSelectedXianList(DotSession ds);
	void getFarmerInfoList(DotSession ds);
}
