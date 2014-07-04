package cn.voicet.ybh.service;

import cn.voicet.ybh.util.DotSession;

public interface YbhPeopleService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YbhPeopleServiceImpl";
	void getSelectedXianList(DotSession ds);
}
