package cn.voicet.ybh.dao;

import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhTotalForm;

public interface YbhTotalDao extends BaseDao{
	public final static String SERVICE_NAME = "cn.voicet.ybh.dao.impl.YbhTotalDaoImpl";
	void getYbhTotalInfo(DotSession ds, YbhTotalForm ybhTotalForm);
}
