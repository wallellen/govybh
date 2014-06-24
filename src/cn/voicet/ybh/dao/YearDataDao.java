package cn.voicet.ybh.dao;

import cn.voicet.ybh.util.DotSession;

public interface YearDataDao extends BaseDao{
	public final static String SERVICE_NAME = "cn.voicet.ybh.dao.impl.YearDataDaoImpl";
	void getYbhYearInfo(DotSession ds);
	void getYbhListByCurBM(DotSession ds);
}
