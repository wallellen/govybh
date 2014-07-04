package cn.voicet.ybh.dao;

import cn.voicet.ybh.util.DotSession;

public interface YbhMemberDao extends BaseDao{
	public final static String SERVICE_NAME = "cn.voicet.ybh.dao.impl.YbhMemberDaoImpl";
	void getSelectedXianList(DotSession ds);
	void getMemberInfoList(DotSession ds);
}
