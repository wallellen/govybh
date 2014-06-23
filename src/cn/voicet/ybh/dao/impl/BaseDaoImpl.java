package cn.voicet.ybh.dao.impl;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import cn.voicet.ybh.dao.BaseDao;

public class BaseDaoImpl extends JdbcDaoSupport implements BaseDao {
	
	@Resource(name="jdbcTemplate")
	public final void setDataSourceDi(JdbcTemplate jdbcTemplate) {
		super.setJdbcTemplate(jdbcTemplate);
	}
}
