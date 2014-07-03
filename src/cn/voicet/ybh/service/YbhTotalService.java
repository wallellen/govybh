package cn.voicet.ybh.service;

import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhTotalForm;

@SuppressWarnings("unchecked")
public interface YbhTotalService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YbhTotalServiceImpl";
	void getYbhTotalInfo(DotSession ds, YbhTotalForm ybhTotalForm);
}
