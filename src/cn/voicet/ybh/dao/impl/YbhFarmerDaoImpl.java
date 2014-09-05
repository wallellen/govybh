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
import org.springframework.jdbc.core.CallableStatementCallback;
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
		final int apr[]={0,1,2,4,6,7,9,11};
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				String str = "";
				CallableStatement cs = conn.prepareCall("{call ybh_query_familyex(?,?,?,?,?,?,?,?)}");
				cs.setString(1, ds.account);
				cs.setString(2, ds.rbm);
				cs.setString(3, (String)ds.map.get("zbYear"));
				String a[]=(String[]) ds.map.get("qarr");
				for(int i=0; i<8; i++)
				{
					if(a[apr[i]].length()>0)
					{
						if(i<2 || i>12)
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
				log.info("str before:"+str);
				log.info("xmlist:"+ybhFarmerForm.getXmlist());
				
				String zhibiao = "";
				String[] dsZhibiao = (String[]) ds.map.get("zhibiao");
				for(int i=0; i<dsZhibiao.length; i++)
				{
					zhibiao+=dsZhibiao[i];
				}
				log.info("zhibiao replace before:"+zhibiao);
				zhibiao = zhibiao.replace("#", ";");

				log.info("zhibiao replace after:"+zhibiao);
				str=str+zhibiao;
				log.info("str after:"+str);
				cs.setString(4, str);
				cs.setString(5, ybhFarmerForm.getXmlist());
				cs.setInt(6, 200);
				cs.registerOutParameter(7, Types.INTEGER);
				cs.registerOutParameter(8, Types.INTEGER);
				cs.execute();
				ResultSet rs = cs.getResultSet();
				ds.initData();
				ds.list3 = new ArrayList();
				Map map;
				if(rs!=null){
					while (rs.next()) {
						map = new HashMap();
						VTJime.putMapDataByColName(map, rs);
		        		ds.list3.add(map);
					}
				}
				//取出参(农户总数)
				ds.map.put("farmernt", cs.getObject(7));
				ds.map.put("peoplent", cs.getObject(8));
				return null;
			}
		});
	}

	public void getAllFarmerInfoList(final DotSession ds, final YbhFarmerForm ybhFarmerForm) {
		final int apr[]={0,1,2,4,6,7,9,11};
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				String str = "";
				CallableStatement cs = conn.prepareCall("{call ybh_query_familyex(?,?,?,?,?,?,?,?)}");
				cs.setString(1, ds.account);
				cs.setString(2, ds.rbm);
				cs.setString(3, (String)ds.map.get("zbYear"));
				String a[]=(String[]) ds.map.get("qarr");
				for(int i=0; i<8; i++)
				{
					if(a[apr[i]].length()>0)
					{
						if(i<2 || i>12)
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
				log.info("str before:"+str);
				log.info("xmlist:"+ybhFarmerForm.getXmlist());
				
				String zhibiao = "";
				String[] dsZhibiao = (String[]) ds.map.get("zhibiao");
				for(int i=0; i<dsZhibiao.length; i++)
				{
					zhibiao+=dsZhibiao[i];
				}
				log.info("zhibiao replace before:"+zhibiao);
				zhibiao = zhibiao.replace("#", ";");

				log.info("zhibiao replace after:"+zhibiao);
				str=str+zhibiao;
				log.info("str after:"+str);
				cs.setString(4, str);
				cs.setString(5, ybhFarmerForm.getXmlist());
				cs.setInt(6, 0);
				cs.registerOutParameter(7, Types.INTEGER);
				cs.registerOutParameter(8, Types.INTEGER);
				cs.execute();
				ResultSet rs = cs.getResultSet();
				ds.initData();
				ds.list3 = new ArrayList();
				Map map;
				if(rs!=null){
					while (rs.next()) {
						map = new HashMap();
						VTJime.putMapDataByColName(map, rs);
		        		ds.list3.add(map);
					}
				}
				//取出参(农户总数)
				ds.map.put("farmernt", cs.getObject(7));
				ds.map.put("peoplent", cs.getObject(8));
				return null;
			}
		});
	}

	public void queryFamilyZBList(final DotSession ds) {
		String procedureSql = "{call ybh_query_family_zblist()}";
		this.getJdbcTemplate().execute(procedureSql, new CallableStatementCallback() {
			public Object doInCallableStatement(CallableStatement cs)
					throws SQLException, DataAccessException {
				cs.execute();
				ResultSet rs = cs.getResultSet();
				ds.list2 = new ArrayList();	
				Map map;
				if(rs!=null){
					while (rs.next()) {
						map = new HashMap();
						ds.putMapDataByColName(map, rs);
		        		ds.list2.add(map);
					}
				}
				return null;
			}
		});
	}
}
