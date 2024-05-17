package com.icss.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.icss.biz.BookBiz;
import com.icss.biz.UserBiz;
import com.icss.entity.Book;
import com.icss.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PayAction {
	
	@Autowired
	private BookBiz bookBiz;
	@Autowired
	private UserBiz userBiz;
	
	@RequestMapping("/user/pay")
	public String payMoney(@SessionAttribute Map<String,Integer> shopcar,
			            @SessionAttribute User user,
			            @SessionAttribute  double allMoney,HttpServletRequest request) throws Exception{
		String orderNo = userBiz.payMoney(user.getUname(), allMoney, shopcar);	
		user.setAccount(user.getAccount() - allMoney);
		shopcar.clear();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		String url = basePath + "app/user/payok?orderNo=" + orderNo;
		
		return "redirect:" + url;
		
	}
	
	@RequestMapping("/user/payok")
	public String payOK(@RequestParam String orderNo) {
		return "/jsp/payOK.jsp?orderNo=" + orderNo;
	}
	
	@RequestMapping("/user/checkout")
	public String checkout(@SessionAttribute Map<String,Integer> shopcar,
			              Model model,HttpSession session)throws Exception{
		int i=0;
		String isbns = "";
		for(Map.Entry<String,Integer> entry : shopcar.entrySet()) {
			if(i==0) {
				isbns = entry.getKey();
			}else {
				isbns = isbns + "-" + entry.getKey();
			}
			i++;
		}	
		double allMoney = 0;
		List<Book> books = bookBiz.getShopBooks(isbns);
		for(Book bk : books) {
			int num = shopcar.get(bk.getIsbn()); 
			bk.setNum(num);
			allMoney += bk.getPrice() * num;
		}
		model.addAttribute("books", books);			
		session.setAttribute("allMoney",allMoney);
		return "/jsp/checkout.jsp";
	}

}
