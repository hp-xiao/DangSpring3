package com.icss.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.biz.BookBiz;
import com.icss.dto.MBook;
import com.icss.entity.Book;

@Controller
public class BookAction {
	
	@Autowired
	private BookBiz bookBiz;
	
	@RequestMapping("/main")
	public String getMainBook(Model model) throws Exception{	
		List<MBook> books = bookBiz.getAllMainBook();
		model.addAttribute("books",books);
		return "/jsp/main.jsp";
	}
	
	@RequestMapping("/bookInfo")
	public String getBookInfo(@RequestParam String isbn,Model model) throws Exception{
		Book bk = bookBiz.getBookInfo(isbn);
		model.addAttribute("bk",bk);
		return "/jsp/BookDetail.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/validISBN")
	public int validISBN(@RequestParam String isbn) {
		int iRet;
		try {
			boolean bRet = bookBiz.validISBN(isbn);
			if(bRet) {
				iRet = 1;
			}else {
				iRet = 0;
			}
		} catch (Exception e) {
			iRet = -1;
		}
		return iRet;
	}

}
