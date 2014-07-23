package cn.voicet.ybh.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.stereotype.Repository;

import cn.voicet.ybh.dao.YbhFarmerDao;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.util.VTJime;
import cn.voicet.ybh.web.form.YbhFarmerForm;

@Repository(YbhFarmerDao.SERVICE_NAME)
@SuppressWarnings({"unchecked","static-access"})
public class YbhFarmerDaoImpl extends BaseDaoImpl implements YbhFarmerDao {
	private static Logger log = Logger.getLogger(YbhFarmerDaoImpl.class);
	
	public void getSelectedXianList(final DotSession ds) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_xian_selectlist(?,?)}");
				cs.setString(1, ds.rbm);
				cs.setInt(2, 1);
				cs.execute();
				ResultSet rs = cs.getResultSet();
				ds.initData();
				ds.list = new ArrayList();	
				Map map;
				if(rs!=null){
					while (rs.next()) {
						map = new HashMap();
						ds.putMapDataByColName(map, rs);
		        		ds.list.add(map);
					}
				}
				return null;
			}
		});
	}

	public void getFarmerInfoList(final DotSession ds, final YbhFarmerForm ybhFarmerForm) {
		final int apr[]={0,1,2,4,6,7,9,11,12,14,16};
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				String str = "";
				CallableStatement cs = conn.prepareCall("{call ybh_query_family(?,?,?,?,?,?,?)}");
				cs.setString(1, ds.account);
				cs.setString(2, ds.rbm);
				String a[]=(String[]) ds.map.get("qarr");
				for(int i=0; i<11; i++)
				{
					if(a[apr[i]].length()>0)
					{
						if(i<2)
							str+=a[apr[i]];
						else if((i-2)%3==2)
						{
							if(!a[apr[i]].equals("0"))
							{
								str+=a[apr[i]];
							}
						}
						else
						{
							if(a[apr[i]].equals("1") && a[apr[i]+1].length()>0) 
							{
								str+=">=";
								str+=a[apr[i]+1];
							}
							else if(a[apr[i]].equals("2") && a[apr[i]+1].length()>0)
							{
								str+="<=";
								str+=a[apr[i]+1];
							}
						}
					}
					str+=";";
				}
				System.out.println(str);
				cs.setString(3, str);
				cs.setString(4, ybhFarmerForm.getXmlist());
				cs.setInt(5, 200);
				cs.registerOutParameter(6, Types.INTEGER);
				cs.registerOutParameter(7, Types.INTEGER);
				cs.execute();
				ResultSet rs = cs.getResultSet();
				ds.initData();
				ds.list2 = new ArrayList();
				Map map;
				if(rs!=null){
					while (rs.next()) {
						map = new HashMap();
						VTJime.putMapDataByColName(map, rs);
		        		ds.list2.add(map);
					}
				}
				//取出参(农户总数)
				ds.map.put("farmernt", cs.getObject(6));
				ds.map.put("peoplent", cs.getObject(7));
				return null;
			}
		});
	}

	public void getAllFarmerInfoList(final DotSession ds, final YbhFarmerForm ybhFarmerForm) {
		final int apr[]={0,1,2,4,6,7,9,11,12,14,16};
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				String str = "";
				CallableStatement cs = conn.prepareCall("{call ybh_query_family(?,?,?,?,?,?,?)}");
				cs.setString(1, ds.account);
				cs.setString(2, ds.rbm);
				String a[]=(String[]) ds.map.get("qarr");
				for(int i=0; i<11; i++)
				{
					if(a[apr[i]].length()>0)
					{
						if(i<2)
							str+=a[apr[i]];
						else if((i-2)%3==2)
						{
							if(!a[apr[i]].equals("0"))
							{
								str+=a[apr[i]];
							}
						}
						else
						{
							if(a[apr[i]].equals("1") && a[apr[i]+1].length()>0) 
							{
								str+=">=";
								str+=a[apr[i]+1];
							}
							else if(a[apr[i]].equals("2") && a[apr[i]+1].length()>0)
							{
								str+="<=";
								str+=a[apr[i]+1];
							}
						}
					}
					str+=";";
				}
				cs.setString(3, str);
				cs.setString(4, ybhFarmerForm.getXmlist());
				//参数为0，导出所有记录
				cs.setInt(5, 0);
				cs.registerOutParameter(6, Types.INTEGER);
				cs.registerOutParameter(7, Types.INTEGER);
				log.info("query param of export farmer: account:"+ds.account+", rbm:"+ds.rbm+", qstr:"+str+", xmlist:"+ybhFarmerForm.getXmlist()+"rownum:"+0);
				cs.execute();
				ResultSet rs = cs.getResultSet();
				ds.initData();
				ds.list2 = new ArrayList();
				Map map;
				if(rs!=null){
					while (rs.next()) {
						map = new HashMap();
						VTJime.putMapDataByColName(map, rs);
		        		ds.list2.add(map);
					}
				}
				//取出参(农户总数)
				ds.map.put("farmernt", cs.getObject(6));
				ds.map.put("peoplent", cs.getObject(7));
				return null;
			}
		});
	}
}
