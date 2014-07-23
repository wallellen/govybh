package cn.voicet.ybh.dao;

import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhMemberForm;

public interface YbhMemberDao extends BaseDao{
	public final static String SERVICE_NAME = "cn.voicet.ybh.dao.impl.YbhMemberDaoImpl";
	void getSelectedXianList(DotSession ds);
	void getMemberInfoList(DotSession ds, YbhMemberForm ybhMemberForm);
	void getAllMemberInfoList(DotSession ds, YbhMemberForm ybhMemberForm);
}
