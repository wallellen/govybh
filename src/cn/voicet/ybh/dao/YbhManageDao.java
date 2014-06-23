package cn.voicet.ybh.dao;

import cn.voicet.ybh.util.DotSession;

public interface YbhManageDao extends BaseDao{
	public final static String SERVICE_NAME = "cn.voicet.ybh.dao.impl.YbhManageDaoImpl";
	void getYbhListByCurBM(DotSession ds);
}
