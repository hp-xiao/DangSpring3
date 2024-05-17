package com.icss.action;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.icss.biz.UserBiz;
import com.icss.dto.TurnPage;
import com.icss.entity.Order;
import com.icss.entity.User;
import com.icss.exception.InputEmptyException;
import com.icss.exception.KeyClashException;
import com.icss.util.JsonUtil;
import com.icss.util.Log;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserAction {
	@Autowired
	private UserBiz userBiz;
	
	@RequestMapping("/user/myorder3")
	public String myOrders3( @SessionAttribute User user,Model model,@RequestParam(defaultValue = "1") int page) throws Exception{
		TurnPage tp = new TurnPage();
		tp.page = page;
		tp.rows = 8;
		if(tp.page < 1)
			tp.page = 1;				
		List<Order> list = userBiz.gerMyOrders(user.getUname(),tp);
		model.addAttribute("tp", tp);
		model.addAttribute("orders", list);
		return "/jsp/myOrder.jsp";
	}
	
	@RequestMapping("/user/myorder")
	public String myOrder() {
		return "/jsp/myOrder2.jsp";
	}
	
	
	//返回数据格式{"total":100,"rows":10,["","",""]}
	@ResponseBody
	@RequestMapping("/user/myorder2")
	public String myOrders2( @SessionAttribute User user,
							@RequestParam(defaultValue = "1") int page, 
							@RequestParam(defaultValue="5") int rows) throws Exception{
		String result = null;
		
		TurnPage tp = new TurnPage();
		tp.page = page;
		tp.rows = rows;
		if(tp.page < 1)
			  tp.page = 1;				
		List<Order> list = userBiz.gerMyOrders(user.getUname(),tp);
		if(list.size() > 0) {
			ObjectMapper mapper=new ObjectMapper();
	        //调用mapper的writeValueAsString()方法把一个对象或集合转为json字符串
			String data = mapper.writeValueAsString(list);
			result = JsonUtil.getDatagridJSON(tp.getAllRows(),data);	
			Log.logger.info("myOrders2返回信息：" + result);
		}
		
		return result;
		
	}
	
	@GetMapping("/regist")
	public String regist() {
		return "/jsp/regist.jsp";
	}
	
	@PostMapping("/regist")
	public String regist(User user,Model model) throws Exception {	
		user.setRole(2);		
		try {
			userBiz.addUser(user);
			model.addAttribute("msg", user.getUname() + "注册成功，请登录");
			return "/jsp/login.jsp";
		}catch(InputEmptyException e) {
			model.addAttribute("msg",e.getMessage());
			return "/jsp/regist.jsp";
		}catch(KeyClashException e){
			model.addAttribute("msg",e.getMessage());
			return "/jsp/regist.jsp";
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
			return "/err/errMsg.jsp";
		}		
	}
	
	@GetMapping("/login")
	public String login() {
		return "/jsp/login.jsp";
	}
	
	@ResponseBody
	@PostMapping("/login")
	public int login(@RequestParam String uname, @RequestParam String pwd,
			           HttpSession session)  {
		int iRet;
		
		try {
			User user;
			user = userBiz.login(uname, pwd);
			if (user == null) {
				iRet = 0;
			} else {			
				session.setAttribute("user",user);			
				session.setAttribute("shopcar",new HashMap<String,Integer>());				
				iRet = 1;				
			}
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
			iRet = -1;		
		} 	
		
		return iRet;		
	}
	
	@RequestMapping("/user/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		String url = basePath + "app/login";
		return "redirect:" + url;
	}
	
	@ResponseBody
	@RequestMapping("/unameValid")
	public int validUname(@RequestParam String uname) {
		Log.logger.info("UnameValidSvl受到请求参数uname=" + uname);
		
	    int iRet;
		if(uname == null || uname.equals("")) {
			iRet = 0;                     //用户名为空
		}else {			
			try {
				boolean bRet = userBiz.validUname(uname);
				if(bRet) {
					iRet = 1;          //重名,已存在
				}else {
					iRet = 2;             //未找到，可以使用
				}
			} catch (Exception e) {
				Log.logger.error(e.getMessage(),e);
				iRet = -1;
			}
		}
		return iRet;
	}

}
