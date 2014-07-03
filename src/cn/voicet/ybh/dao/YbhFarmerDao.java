package cn.voicet.ybh.dao;

import cn.voicet.ybh.util.DotSession;

public interface YbhFarmerDao extends BaseDao{
	public final static String SERVICE_NAME = "cn.voicet.ybh.dao.impl.YbhFarmerDaoImpl";
	void getSelectedXianList(DotSession ds);
}
