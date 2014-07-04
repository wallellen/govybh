package cn.voicet.ybh.dao;

import cn.voicet.ybh.util.DotSession;

public interface YbcManageDao extends BaseDao{
	public final static String SERVICE_NAME = "cn.voicet.ybh.dao.impl.YbcManageDaoImpl";
	void getSelectedCunList(DotSession ds);
}
