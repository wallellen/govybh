package cn.voicet.ybh.service;

import cn.voicet.ybh.util.DotSession;

@SuppressWarnings("unchecked")
public interface YbhPeopleService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YbhPeopleServiceImpl";
	void getSelectedHuList(DotSession ds);
}
