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
import com.icss.entity.Book;
import com.icss.util.Log;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class ShopcarAction {
	@Autowired
	private BookBiz bookBiz;
	
	@RequestMapping("/showShopcar")
	public String showCar(@SessionAttribute Map<String,Integer> shopcar,Model model) throws Exception {		
		String isbns = "";
		int i = 0;
		for(String isbn : shopcar.keySet()) {
			if(i==0) {
				isbns = isbn;
			}else {
				isbns = isbns + "-" + isbn;
			}
			i++;
		}
		List<Book> books = bookBiz.getShopBooks(isbns);	
		double allPrice = 0;
		if(books != null) {				
			for(Book bk : books) {
				allPrice += bk.getPrice() * shopcar.get(bk.getIsbn());
			}
		}	
		model.addAttribute("allPrice",allPrice);
		model.addAttribute("books",books);
		return "/jsp/ShopCar.jsp";
	}
	/**
	 * 加入购物车
	 * @param isbn
	 * @throws Exception
	 */
	@RequestMapping("/addShopcar")
	public String addShopcar(@SessionAttribute Map<String,Integer> shopcar,
			                    @RequestParam String isbn,HttpServletRequest request) throws Exception{
		Integer num = shopcar.get(isbn);
		if(num == null) {
			shopcar.put(isbn,1);
		}else {
			num += 1;
			shopcar.put(isbn,num);		   
		}	
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		String url = basePath + "app/user/showShopcar";
		//此处使用重定向的好处是，刷新浏览器地址栏，避免商品重复添加到购物车
		return "redirect:"+url;
		
	}
	
	@RequestMapping("/removeShopcar")
	public String removeShopcar(@SessionAttribute Map<String,Integer> shopcar,
			                  @RequestParam String isbn) throws Exception{
		shopcar.remove(isbn);
		return "forward:" + "/app/user/showShopcar";
	}
	
	@RequestMapping("/clearShopcar")
	public String clearShopcar(@SessionAttribute Map<String,Integer> shopcar) throws Exception{
		shopcar.clear();
		return "forward:" + "/app/user/showShopcar";
		
	}
	
	/**
	 * 调整购物车中商品的数量
	 * @param isbn
	 * @param num
	 * @throws Exception
	 */
	@RequestMapping("/numShopcar")
	public void numShopcar( @SessionAttribute Map<String,Integer> shopcar ,
							@RequestParam  String isbn , 
			                @RequestParam  int num) throws Exception{
		Log.logger.info("修改商品数量:isbn=" + isbn + ",num=" + num);
		shopcar.put(isbn,num);		
	}
}
