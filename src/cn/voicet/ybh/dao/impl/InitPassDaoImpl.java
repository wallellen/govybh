package cn.voicet.ybh.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.stereotype.Repository;

import cn.voicet.ybh.dao.InitPassDao;
import cn.voicet.ybh.util.DotSession;

@Repository(InitPassDao.SERVICE_NAME)
public class InitPassDaoImpl extends BaseDaoImpl implements InitPassDao {

	public void initPasswordByDqbm(final DotSession ds, final String dqbm) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_inituserpwd(?,?)}");
				cs.setString(1, ds.account);
				cs.setString(2, dqbm);
				cs.execute();
				return null;
			}
		});
	}
	
}
