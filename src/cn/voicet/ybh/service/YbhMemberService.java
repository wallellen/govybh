package cn.voicet.ybh.service;

import cn.voicet.ybh.util.DotSession;

public interface YbhMemberService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YbhMemberServiceImpl";
	void getSelectedXianList(DotSession ds);
}
