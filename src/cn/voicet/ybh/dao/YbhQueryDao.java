package cn.voicet.ybh.dao;

import cn.voicet.ybh.util.DotSession;

public interface YbhQueryDao extends BaseDao{
	public final static String SERVICE_NAME = "cn.voicet.ybh.dao.impl.YbhQueryDaoImpl";
	void getSelectedCunList(DotSession ds);
}
