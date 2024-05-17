package com.icss.biz;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icss.dao.BookDao;
import com.icss.dao.UserDao;
import com.icss.dto.TurnPage;
import com.icss.entity.Book;
import com.icss.entity.Order;
import com.icss.entity.OrderInfo;
import com.icss.entity.User;
import com.icss.exception.InputEmptyException;
import com.icss.exception.KeyClashException;
import com.icss.util.Log;
import com.icss.util.OrderUtil;

@Service
public class UserBiz {
	@Autowired
	private UserDao userDao;
	@Autowired
	private BookBiz bkBiz;
	@Autowired
	private BookDao bkDao;
	
	/**
	 * 校验用户名是否存在
	 * @param uname
	 * @return  true表示存在    false不存在
	 * @throws Exception
	 */
	public boolean validUname(String uname) throws Exception {
		return userDao.validUname(uname);
	}
	
	/**
	 *    �ҵĶ���
	 * @param uname
	 * @return
	 * @throws Exception
	 */
	public List<Order> gerMyOrders(String uname,TurnPage tp) throws Exception {		
		return userDao.gerMyOrders(uname,tp);		
	}
	
	/**
	 * ���ﳵ����
	 * @param uname
	 * @param allMoney
	 * @param car
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Throwable.class)
	public String payMoney(String uname,double allMoney,Map<String,Integer> car) throws Exception {		
		String orderNo = OrderUtil.createNewOrderNo();		
		userDao.pay(uname, allMoney);
		Order order = new Order();
		order.setOrderNo(orderNo);
		order.setAllMoney(allMoney);
		order.setPayTime(new Date());
		order.setUname(uname);
		userDao.createOrder(order);
		//4. д�붩����ϸ
		for(Map.Entry<String,Integer> entry : car.entrySet()) {
			OrderInfo info = new OrderInfo();
			info.setIsbn(entry.getKey());
			info.setNum(entry.getValue());
			info.setOrderNo(orderNo);			
			Book bk = bkBiz.getBookInfo(entry.getKey());
			info.setRprice(bk.getPrice());   
			userDao.createOrderDetail(info);			
			bkDao.minusBookNum(entry.getKey(), entry.getValue());
		}			
		
		return orderNo;
	}
	

	/**
	 * �û���¼
	 * @param uname
	 * @param pwd
	 * @return
	 * @throws Exception
	 */
	public synchronized User login(String uname,String pwd) throws Exception{
		if(uname == null || uname.equals("")) {
			throw new RuntimeException("�û�������Ϊ��...");
		}
		if(pwd == null || pwd.equals("")) {
			throw new RuntimeException("���벻��Ϊ��...");
		}
		Log.logger.info(Thread.currentThread().getId() + "�����¼��uname=" + uname);		
		return userDao.login(uname, pwd);		
	}
	
	/**
	 * 添加用户   （没有异常就表示添加成功）
	 * @param user
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Throwable.class)
	public void addUser(User user) throws Exception {
		if(user.getUname() == null || user.getUname().equals("")) {
			throw new InputEmptyException("用户名不能为空");
		} 
		//判断用户名是否重复
		boolean bRet = userDao.validUname(user.getUname());
		if(bRet) {
			throw new KeyClashException("用户名冲突");
		}else {
			userDao.addUser(user);	
		}			
	}
}
