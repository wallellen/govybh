package cn.voicet.ybh.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.stereotype.Repository;

import cn.voicet.ybh.dao.YbhManageDao;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhManageForm;

@Repository(YbhManageDao.SERVICE_NAME)
@SuppressWarnings({"unchecked","static-access"})
public class YbhManageDaoImpl extends BaseDaoImpl implements YbhManageDao {

	/** 显示样本户管理列表 */
	public void getYbhListByCurBM(final DotSession ds) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_bm_describle(?,?,?,?)}");
				cs.setString(1, ds.curBM);
				cs.setInt(2, 1);
				cs.setInt(3, 2014);
				cs.setInt(4, 1);
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
	
	public void getYbhFamilyDetailInfo(final DotSession ds) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_family_detail(?,?)}");
				cs.setString(1, ds.curHM);
				cs.setInt(2, 1);
				cs.execute();
				ResultSet rs = null;
				ds.initData();
				ds.list = new ArrayList();
				ds.list2 = new ArrayList();
				int rid=0;
				int updateCount = -1;
				Map map;
				do{
					updateCount = cs.getUpdateCount();
					if(updateCount != -1){	
						cs.getMoreResults();
						continue;
					}
					rs = cs.getResultSet();
					if(null != rs){
						while(rs.next()){
							if(rid ==0){
								ResultSetMetaData rsm =rs.getMetaData();
								int colCount = rsm.getColumnCount();
								String colName;
								for(int i=1; i<=colCount; i++)
								{
									colName=rsm.getColumnName(i);
									ds.map.put(colName, rs.getString(i));
								}
								/*
								ds.map.put("hm", rs.getString(i++));
								ds.map.put("hname", rs.getString(i++));
								ds.map.put("zhu", rs.getString(i++));
								ds.map.put("population", rs.getString(i++));
								ds.map.put("labornum", rs.getString(i++));
								ds.map.put("fields", rs.getString(i++));
								ds.map.put("house", rs.getString(i++));
								ds.map.put("property", rs.getString(i++));
								ds.map.put("telnum", rs.getString(i++));
								ds.map.put("dcause", rs.getString(i++));
								ds.map.put("idcno", rs.getString(i++));
								ds.map.put("frname", rs.getString(i++));
								ds.map.put("frtel", rs.getString(i++));
								ds.map.put("frwork", rs.getString(i++));
								*/
							}else if (rid == 1 ){
								map = new HashMap();
								ds.putMapDataByColName(map, rs);
								ds.list.add(map);
							}else if(rid == 2){
								map = new HashMap();
								ds.putMapDataByColName(map, rs);
								ds.list2.add(map);
							}
						}
					}
					if(rs != null){
						cs.getMoreResults();
						rid++;
						continue;
					}
				}while(!(updateCount == -1 && rs == null));
				return null;
			}
		});
		
	}
	
	/** 保存家庭基本信息 */
	public void saveFamilyInfo(final DotSession ds, final YbhManageForm ybhManageForm) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_family_update(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
				cs.setString(1, ds.curHM);
				cs.setString(2, ybhManageForm.getHname());
				cs.setString(3, ybhManageForm.getZhu());
				cs.setString(4, ybhManageForm.getFields());
				cs.setString(5, ybhManageForm.getHouse());
				cs.setInt(6, ybhManageForm.getProperty());
				cs.setInt(7, ybhManageForm.getDcause());
				cs.setString(8, ybhManageForm.getIdcno());
				cs.setString(9, ybhManageForm.getHtel());
				cs.setString(10, ybhManageForm.getFrname());
				cs.setString(11, ybhManageForm.getFrtel());
				cs.setString(12, ybhManageForm.getFrwork());
				cs.setInt(13, 1);
				cs.execute();
				return null;
			}
		});
	}

	/** 更新家庭成员信息 */
	public void saveMemberInfo(final DotSession ds, final YbhManageForm ybhManageForm) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = null;
				cs = conn.prepareCall("{call ybh_member_update(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
				cs.setString(1, ds.curHM);
				cs.setInt(2, ybhManageForm.getMid());
				cs.setString(3, ybhManageForm.getUname());
				cs.setInt(4, ybhManageForm.getSex());
				cs.setInt(5, ybhManageForm.getAge());
				cs.setInt(6, ybhManageForm.getSchool());
				cs.setInt(7, ybhManageForm.getEducation());
				cs.setInt(8, ybhManageForm.getHealth());
				cs.setString(9, ybhManageForm.getDcno());
				cs.setInt(10, ybhManageForm.getLabors());
				cs.setInt(11, ybhManageForm.getWorks());
				cs.setInt(12, ybhManageForm.getBla());
				cs.setInt(13, ybhManageForm.getTbfd());
				cs.setInt(14, 1);
				cs.execute();
				return null;
			}
		});
	}
	
	/** 删除家庭成员 */
	public void deleteMemberInfo(final DotSession ds, final YbhManageForm ybhManageForm) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = null;
				cs = conn.prepareCall("{call ybh_member_delete(?,?,?)}");
				cs.setString(1, ds.rbm);
				cs.setString(2, ds.curHM);
				cs.setInt(3, ybhManageForm.getMid());
				cs.execute();
				return null;
			}
		});
	}


	public void getFamilyIncome(final DotSession ds) {
		
	}

	public void saveYearInfo(final DotSession ds, final YbhManageForm ybhManageForm) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = null;
				cs = conn.prepareCall("{call ybh_year_update(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
				cs.setString(1, ds.curHM);
				cs.execute();
				return null;
			}
		});
	}

	
}
