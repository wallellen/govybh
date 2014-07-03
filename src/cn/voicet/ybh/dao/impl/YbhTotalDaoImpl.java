package cn.voicet.ybh.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.stereotype.Repository;

import cn.voicet.ybh.dao.YbhTotalDao;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhTotalForm;

@Repository(YbhTotalDao.SERVICE_NAME)
@SuppressWarnings({"unchecked","static-access"})
public class YbhTotalDaoImpl extends BaseDaoImpl implements YbhTotalDao {

	public void getYbhTotalInfo(final DotSession ds, final YbhTotalForm ybhTotalForm) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = null;
				if(ybhTotalForm.getZhibiao().equals("cun"))
				{
					cs = conn.prepareCall("{call ybh_look_100chun(?,?,?,?)}");
				}
				else if(ybhTotalForm.getZhibiao().equals("hu"))
				{
					cs = conn.prepareCall("{call ybh_look_1000hu(?,?,?,?)}");
				}
				cs.setString(1, ds.rbm);
				cs.setInt(2, ybhTotalForm.getYear());
				cs.setInt(3, ybhTotalForm.getMode());
				cs.setInt(4, 1);
				cs.execute();
				ResultSet rs = cs.getResultSet();
				if(null != rs){
					while(rs.next()){
						ResultSetMetaData rsm =rs.getMetaData();
						int colCount = rsm.getColumnCount();
						String colName;
						for(int i=1; i<=colCount; i++)
						{
							colName=rsm.getColumnName(i);
							ds.map.put(colName, rs.getString(i));
						}
					}
				}
				return null;
			}
		});
	}

}
