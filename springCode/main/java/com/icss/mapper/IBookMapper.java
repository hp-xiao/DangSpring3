package com.icss.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.icss.dto.MBook;
import com.icss.entity.Book;
import com.icss.entity.Category;

public interface IBookMapper {
	public List<MBook> getAllMainBook() throws Exception ;
	
	public Book getBookInfo(@Param("isbn") String isbn) throws Exception;
	
	public List<Book> getShopBooks(@Param("isbns") String isbns) throws Exception;
	
	public List<Category> getAllCategory() throws Exception;
	
	public void addBook(Book book) throws Exception;
	
	public Book validISBN(@Param("isbn") String isbn) throws Exception;
}
