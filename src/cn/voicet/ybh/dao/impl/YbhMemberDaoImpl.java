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

import cn.voicet.ybh.dao.YbhMemberDao;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.util.VTJime;
import cn.voicet.ybh.web.form.YbhMemberForm;

@Repository(YbhMemberDao.SERVICE_NAME)
@SuppressWarnings({"unchecked","static-access"})
public class YbhMemberDaoImpl extends BaseDaoImpl implements YbhMemberDao {

	private static Logger log = Logger.getLogger(YbhMemberDaoImpl.class);
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

	public void getMemberInfoList(final DotSession ds, final YbhMemberForm ybhMemberForm) {
		final int apr[]={0,1,2,4,5,6,7,8,9};
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				String str = "";
				CallableStatement cs = conn.prepareCall("{call ybh_query_member(?,?,?,?,?,?)}");
				cs.setString(1, ds.account);
				cs.setString(2, ds.rbm);
				String a[]=(String[]) ds.map.get("marr");
				for(int i=0; i<9; i++)
				{
					if(a[apr[i]].length()>0)
					{
						if(i!=2)
						{
							if(!a[apr[i]].equals("0")){
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
				System.out.println("str before:"+str);
				String zhibiao = "";
				String[] dsZhibiao = (String[]) ds.map.get("zhibiao");
				for(int i=0; i<dsZhibiao.length; i++)
				{
					zhibiao+=dsZhibiao[i];
				}
				System.out.println("zhibiao replace before:"+zhibiao);
				zhibiao = zhibiao.replace("#", ";");

				System.out.println("zhibiao replace after:"+zhibiao);
				str=str+zhibiao;
				
				System.out.println("str after:"+str);
				cs.setString(3, str);
				cs.setString(4, ybhMemberForm.getXmlist());
				cs.setInt(5, 500);
				cs.registerOutParameter(6, Types.INTEGER);
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
				//取出参(人口总数)
				ds.map.put("membernt", cs.getObject(6));
				return null;
			}
		});		
	}

	public void getAllMemberInfoList(final DotSession ds, final YbhMemberForm ybhMemberForm) {
		final int apr[]={0,1,2,4,5,6,7,8,9};
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				String str = "";
				CallableStatement cs = conn.prepareCall("{call ybh_query_member(?,?,?,?,?,?)}");
				cs.setString(1, ds.account);
				cs.setString(2, ds.rbm);
				String a[]=(String[]) ds.map.get("marr");
				for(int i=0; i<9; i++)
				{
					if(a[apr[i]].length()>0)
					{
						if(i!=2)
						{
							if(!a[apr[i]].equals("0")){
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
				System.out.println("str before:"+str);
				String zhibiao = "";
				String[] dsZhibiao = (String[]) ds.map.get("zhibiao");
				for(int i=0; i<dsZhibiao.length; i++)
				{
					zhibiao+=dsZhibiao[i];
				}
				System.out.println("zhibiao replace before:"+zhibiao);
				zhibiao = zhibiao.replace("#", ";");

				System.out.println("zhibiao replace after:"+zhibiao);
				str=str+zhibiao;
				
				System.out.println("str after:"+str);
				cs.setString(3, str);
				cs.setString(4, ybhMemberForm.getXmlist());
				cs.setInt(5, 0);
				cs.registerOutParameter(6, Types.INTEGER);
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
				//取出参(人口总数)
				ds.map.put("membernt", cs.getObject(6));
				return null;
			}
		});				
	}

	public void queryMemberZBList(final DotSession ds) {
		String procedureSql = "{call ybh_query_member_zblist()}";
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
