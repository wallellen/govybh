package cn.voicet.ybh.dao;

import cn.voicet.ybh.util.DotSession;

public interface YbhPeopleDao extends BaseDao{
	public final static String SERVICE_NAME = "cn.voicet.ybh.dao.impl.YbhPeopleDaoImpl";
	void getSelectedHuList(DotSession ds);
}