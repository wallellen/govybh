package cn.voicet.ybh.dao;

import cn.voicet.ybh.util.DotSession;

public interface InitPassDao {
	public final static String SERVICE_NAME = "cn.voicet.ybh.dao.impl.InitPassDaoImpl";
	void initPasswordByDqbm(DotSession ds, String dqbm);
}
