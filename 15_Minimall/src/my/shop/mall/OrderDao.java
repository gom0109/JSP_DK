package my.shop.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import my.shop.ProductBean;
import oracle.net.ns.SessionAtts;

public class OrderDao {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
	public OrderDao() {
		
		
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext =(Context)initContext.lookup("java:/comp/env");//java:/comp/env는 내부적으로 존재하는 폴더 이곳에 초기설정정보(Context.xml)를 집어넣는다.
			DataSource ds =  (DataSource)envContext.lookup("jdbc/OracleDB");//Context.xml의 내용중 jdbc/OracleDB 라는 이름을 가진 정보
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		}//초기설정정보를 읽어온다
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		System.out.println("conn : "+ conn);
	}
	
	public int insertOrder(Vector<ProductBean> vec, int mno){
		int cnt=0;
		for(int i=0;i<vec.size();i++) {
			ProductBean pb = vec.get(i);
			String sql = "insert into orders(orderId,memno,pnum,qty,amount) values(orderseq.nextval,?,?,?,?)";
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, mno);
				ps.setInt(2, pb.getPnum());
				ps.setInt(3, pb.getPqty());
				ps.setInt(4, pb.getTotalPrice());
				cnt += ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				if(ps!=null) {
					try {
						ps.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			
		}return cnt;
	}
	public ArrayList<OrderBean> getOrderList(String memid) {
		System.out.println("memid=" +memid);
		ArrayList<OrderBean> list =new ArrayList<OrderBean>();
		String sql = "select m.name mname, m.id mid, p.pname,o.qty,o.amount from (members m join orders o on m.no=o.memno) join product p on o.pnum=p.pnum where m.id = ?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, memid);
			rs = ps.executeQuery();
			while(rs.next()) {
				String mname= rs.getString("mname");
				String mid= rs.getString("mid");
				String pname= rs.getString("p.pname");
				int qty = rs.getInt("o.qty");
				int amount = rs.getInt("o.amount");
				OrderBean obean = new OrderBean(mname, mid, pname, qty, amount);
				list.add(obean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
}
