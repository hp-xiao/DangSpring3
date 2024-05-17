package com.icss.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.icss.entity.Order;
import com.icss.entity.OrderInfo;
import com.icss.entity.User;

public interface IUserMapper {
	public User login(@Param("uname") String uname,
			          @Param("pwd") String pwd) throws Exception;
	
	public void pay(@Param("uname") String uname,
			        @Param("money") double money) throws Exception;
	
	public void createOrder(Order order) throws Exception;
	
	public void createOrderDetail(OrderInfo info) throws Exception;
	
	/**
	 * 获得我的订单总数
	 * @return
	 * @throws Exception
	 */
	public int getMyOrdersNum(@Param("uname") String uname) throws Exception;
	
	/**
	 * 根据翻页参数，获取我的订单
	 * @param uname
	 * @param istart
	 * @param rows
	 * @return
	 * @throws Exception
	 */
	public List<Order> getMyOrders2(@Param("uname") String uname,
									@Param("iStart") int iStart,
									@Param("rows") int rows) throws Exception;
	
	/**
	 * 使用PageHelper进行分页
	 * @param uname
	 * @return
	 * @throws Exception
	 */
	public List<Order> getMyOrders(@Param("uname") String uname) throws Exception;
	
	public User validUname(@Param("uname") String uname) throws Exception;
	
	public void addUser(User user) throws Exception;
}
