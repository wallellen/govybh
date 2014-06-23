package cn.voicet.ybh.dao;

import cn.voicet.ybh.util.DotSession;

public interface YbhCheckDao extends BaseDao{
	public final static String SERVICE_NAME = "cn.voicet.ybh.dao.impl.YbhCheckDaoImpl";
	void getYbhListByCurBM(DotSession ds);
}
