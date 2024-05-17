package com.icss.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icss.dao.BookDao;
import com.icss.dto.MBook;
import com.icss.entity.Book;
import com.icss.entity.Category;

@Service
public class BookBiz {
	
	@Autowired
	private BookDao bookDao;
	
	/**
	 * ���ݹ��ﳵ�е�isbn��ͬʱ��ȡ�౾ͼ����Ϣ
	 * @param isbns ��ʽ������  is001-is002-is003
	 * @return
	 * @throws Exception
	 */
	public List<Book> getShopBooks(String isbns) throws Exception {
		List<Book> books = null;
		if(isbns != null && !isbns.equals("")) {		
			books =  bookDao.getShopBooks(isbns);		
		}
		
		return books;
		
	}
	
	/**
	 * У�����isbn�Ƿ��Ѿ�����
	 * @param isbn
	 * @return   true �����Ѵ���   false������
	 * @throws Exception
	 */
	public boolean validISBN(String isbn) throws Exception {
		return bookDao.validISBN(isbn);		
	}
	
	/**
	 * ����ͼ���isbn����ȡͼ�����飨����blob���ݣ�
	 * @param isbn
	 * @return
	 * @throws Exception
	 */
	public Book getBookInfo(String isbn) throws Exception {		
		return bookDao.getBookInfo(isbn);		
	}
	
	/**
	 * ��ȡͼƬ���ֽ���
	 * @param isbn
	 * @return
	 * @throws Exception
	 */
	public byte[] getBkpic(String isbn) throws Exception {		
		return bookDao.getBkpic(isbn);			
	}
	
	/**
	 * ��ȡ������ҳ�Ƽ���ͼ��
	 * @return
	 * @throws Exception
	 */
	public List<MBook> getAllMainBook() throws Exception {		
		return bookDao.getAllMainBook();		
	}
	
	/**
	 * ��ȡ����ͼ��Ŀ¼
	 * @return
	 * @throws Exception
	 */
	public List<Category> getAllCategory() throws Exception {		
		return bookDao.getAllCategory();		
	}
	
	/**
	 * ͼ�����
	 * @param book
	 * @throws Exception
	 */
	public void addBook(Book book) throws Exception{		
		bookDao.addBook(book);			
	}

}
