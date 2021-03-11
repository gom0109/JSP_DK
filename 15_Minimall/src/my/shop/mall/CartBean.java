package my.shop.mall;

import java.util.Vector;

import my.shop.ProductBean;
import my.shop.ProductDao;

public class CartBean { //��ٱ���
	private Vector<ProductBean> clist;
	public CartBean() {
		clist = new Vector<ProductBean>();
	}
	
	public void addProduct(int pnum, int selectqty) {
		ProductDao pdao = ProductDao.getInstance();
		ProductBean pbean = pdao.selectByNum(pnum);
		
		//������ǰ
		
		for(int i=0; i<clist.size();i++) {
			ProductBean bean = clist.get(i);
			if(bean.getPnum()==pnum) {
				//clist���� �ƿ� ������ �ٽ� ����ϴ¹�� �����غ���
				bean.setPqty(selectqty+bean.getPqty());
				bean.setTotalPrice(bean.getPrice()*(bean.getPqty()));
				bean.setTotalPoint(bean.getPoint()*(bean.getPqty()));
				return;
			}
		}
		
		//����ǰ
		pbean.setPqty(selectqty);
		pbean.setTotalPrice(pbean.getPrice()*selectqty);
		pbean.setTotalPoint(pbean.getPoint()*selectqty);
		clist.add(pbean);
		
		System.out.println("��ٱ��� ����"+ clist.size());
	}
	
	public Vector<ProductBean> getAllProduct(){
		return clist;
		
	}
	
	public void updateProduct(int pnum, int amt) {
		for(int i=0;i<clist.size();i++) {
			ProductBean bean = clist.get(i);
			if(bean.getPnum()==pnum) {
				bean.setPqty(amt);
				bean.setTotalPrice(bean.getPrice()*bean.getPqty());
				bean.setTotalPoint(bean.getPoint()*bean.getPqty());
			}
		}
	}
	public void deleteProduct(int pnum) {
		for(int i=0;i<clist.size();i++) {
			ProductBean bean = clist.get(i);
			if(bean.getPnum()==pnum) {
				clist.remove(i);
			}
		}
	}
	
	public void deleteAllProduct() {
		clist.clear();
	}
}
