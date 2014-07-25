package cn.voicet.ybh.service;

import cn.voicet.ybh.util.DotSession;

public interface InitPassService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.InitPassServiceImpl";
	void initPasswordByDqbm(DotSession ds, String dqbm);
}
