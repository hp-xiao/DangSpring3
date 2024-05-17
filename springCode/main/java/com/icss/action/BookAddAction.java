package com.icss.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.icss.biz.BookBiz;
import com.icss.entity.Book;
import com.icss.entity.Category;

@Controller
public class BookAddAction {
	@Autowired
	private BookBiz bookBiz;
	
	@InitBinder
    public void initBinder(WebDataBinder binder,String price) {		
        binder.registerCustomEditor(String.class,
                new StringTrimmerEditor(true));        

        binder.registerCustomEditor(Date.class,
                new CustomDateEditor(new SimpleDateFormat("MM/dd/yyyy"), true));
        
        if(price==null || price.equals("")) {
        	binder.setDisallowedFields("price");
        }
    }
	
	@GetMapping("/back/bookadd")
	public String addBook(Model model) throws Exception{	
		List<Category> caList = bookBiz.getAllCategory();
		model.addAttribute("caList", caList);
		return "/back/bookAdd.jsp";		
	}
	
	@PostMapping("/back/bookadd")
	public String addBook(Book book ,@RequestParam MultipartFile fpic,Model model) throws Exception{	
		if (!fpic.isEmpty()) {
			byte[] bytes = fpic.getBytes();
			String fname = "/bkpic/" + fpic.getOriginalFilename();
			book.setPic(fname);
			File file = new File("c:/img" + fname);
			fpic.transferTo(file);
		}	
		bookBiz.addBook(book);
		model.addAttribute("msg", book.getBname() +"上传成功");
		List<Category> caList = bookBiz.getAllCategory();
		model.addAttribute("caList", caList);
		return "/back/bookAdd.jsp";		
	}

}
