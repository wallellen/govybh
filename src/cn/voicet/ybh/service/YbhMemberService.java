package cn.voicet.ybh.service;

import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhMemberForm;

public interface YbhMemberService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YbhMemberServiceImpl";
	void getSelectedXianList(DotSession ds);
	void getMemberInfoList(DotSession ds, YbhMemberForm ybhMemberForm);
	void getAllMemberInfoList(DotSession ds, YbhMemberForm ybhMemberForm);
	void queryMemberZBList(DotSession ds);
}
