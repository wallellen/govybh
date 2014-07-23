package cn.voicet.ybh.dao;

import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhFarmerForm;

public interface YbhFarmerDao extends BaseDao{
	public final static String SERVICE_NAME = "cn.voicet.ybh.dao.impl.YbhFarmerDaoImpl";
	void getSelectedXianList(DotSession ds);
	void getFarmerInfoList(DotSession ds, YbhFarmerForm ybhFarmerForm);
	void getAllFarmerInfoList(DotSession ds, YbhFarmerForm ybhFarmerForm);
}
