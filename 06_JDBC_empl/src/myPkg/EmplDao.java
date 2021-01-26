package myPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmplDao {
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	private String user = "jspid";
	private String password = "jsppw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	int count;
	
	public EmplDao(){
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<EmplBean> getAllEmpls(){
		ArrayList<EmplBean> list  = new ArrayList<EmplBean>();
		String sql = "select * from empl order by mid";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int mid = rs.getInt("mid");
				String name =  rs.getString("name");
				int did = rs.getInt("did");
				int salary = rs.getInt("salary");
				EmplBean bean = new EmplBean(mid, name, did, salary);
				/* EmplBean bean = new EmplBean(); 
				 * bean.setMid(mid);
				 * bean.setName(name);
				 * bean.setDid(did);
				 * bean.setSalary(salary);
				 * */
				
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if( ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return list;
		
		
	}
	
	public int insertData(EmplBean bean){
		String sql = "insert into empl values (e_seq.nextval,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bean.getName());
			ps.setInt(2, bean.getDid());
			ps.setInt(3, bean.getSalary());
			count = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return count;
	}
	public EmplBean getEmpleByMid(int mid2){
		EmplBean bean = null;
		
		String sql = "select * from empl where mid = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, mid2);
			rs = ps.executeQuery();
			while(rs.next()) {
				int mid = rs.getInt("mid");
				String name = rs.getString("name");
				int did = rs.getInt("did");
				int salary = rs.getInt("salary");
				bean = new EmplBean(mid,name,did,salary);
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
finally {
			
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if( ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return bean;
		
	}
	
	public int updateData(EmplBean bean) {
		
		String sql="update empl set name =?, did=?, salary=? where mid=?"; 
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bean.getName());
			ps.setInt(2, bean.getDid());
			ps.setInt(3, bean.getSalary());
			ps.setInt(4, bean.getMid());
			count = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return count;
		
	}
	
	

}
