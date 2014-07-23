package cn.voicet.ybh.service;

import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhFarmerForm;

public interface YbhFarmerService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YbhFarmerServiceImpl";
	void getSelectedXianList(DotSession ds);
	void getFarmerInfoList(DotSession ds, YbhFarmerForm ybhFarmerForm);
	void getAllFarmerInfoList(DotSession ds, YbhFarmerForm ybhFarmerForm);
}
