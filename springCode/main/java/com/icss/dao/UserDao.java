package com.icss.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.icss.dto.TurnPage;
import com.icss.entity.Order;
import com.icss.entity.OrderInfo;
import com.icss.entity.User;
import com.icss.mapper.IUserMapper;
import com.icss.util.Log;

@Repository
public class UserDao extends BaseDao{	
	
	@Autowired
	private IUserMapper userMapper;
	
	public boolean validUname(String uname) throws Exception {
		Log.logger.info("UserDao -- >> validUname ....");
		
		boolean bRet = false;
		
		User user = userMapper.validUname(uname);
		if(user != null) {
			bRet = true;
		}		
		
		return bRet;
	}
	
	/**
	 * 添加用户   （没有异常就表示添加成功）
	 * @param user
	 * @throws Exception
	 */
	public void addUser(User user) throws Exception {
		Log.logger.info("UserDao -- >> add ....");		
		userMapper.addUser(user);
	}
	
	public List<Order> gerMyOrders(String uname,TurnPage tp) throws Exception {
		List<Order> list = null;
		
		PageHelper.startPage(tp.page,tp.rows);
		list = userMapper.getMyOrders(uname);
		PageInfo<Order> pi = new PageInfo<Order>(list);
		tp.allPages = pi.getPages();
		tp.allRows = (int)pi.getTotal();
		return pi.getList();		
	}
	
	public List<Order> gerMyOrders222(String uname,TurnPage tp) throws Exception {
		List<Order> list = null;
		
		tp.allRows = userMapper.getMyOrdersNum(uname);
		tp.allPages = (tp.allRows-1)/tp.rows + 1;
		if(tp.page > tp.allPages)
			tp.page = tp.allPages;
		int iStart = (tp.page-1)*tp.rows; 	
		list = userMapper.getMyOrders2(uname, iStart, tp.rows);
		
		return list;
	}	
	
	/**
	 * �û�����
	 * @param uname
	 * @param money
	 * @throws Exception
	 */
	public void pay(String uname,double money) throws Exception{
		Log.logger.info("�û����uname=" + uname + ",money=" + money );//
		userMapper.pay(uname, money);
	}
	
	/**
	 * ��������
	 * @param order
	 * @throws Exception
	 */
	public void createOrder(Order order) throws Exception {
		userMapper.createOrder(order);
	}
	
	/**
	 * ���ɶ�����ϸ
	 * @param info
	 * @throws Exception
	 */
	public void createOrderDetail(OrderInfo info) throws Exception{
		userMapper.createOrderDetail(info);
	}
	
	
	
	/**
	 * ʹ��PreparedStatementִ��Ԥ����SQL
	 * @param uname
	 * @param pwd
	 * @return
	 * @throws Exception
	 */
	public User login(String uname,String pwd) throws Exception{		
		return userMapper.login(uname, pwd);
	}	

}
