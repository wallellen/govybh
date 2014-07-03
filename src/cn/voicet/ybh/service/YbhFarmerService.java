package cn.voicet.ybh.service;

import java.util.Map;

import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YearDataForm;

@SuppressWarnings("unchecked")
public interface YbhFarmerService {
	public final static String SERVICE_NAME = "cn.voicet.ybh.service.impl.YbhFarmerServiceImpl";
	void getSelectedXianList(DotSession ds);
}
