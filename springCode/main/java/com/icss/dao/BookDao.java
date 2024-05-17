package com.icss.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icss.dto.MBook;
import com.icss.entity.Book;
import com.icss.entity.Category;
import com.icss.mapper.IBookMapper;
import com.icss.util.Log;

@Repository
public class BookDao extends BaseDao{
	
	@Autowired
	private IBookMapper bookMapper;
	
	/**
	 * ͼ��ۿ��
	 * @param isbn
	 * @param num
	 * @throws Exception
	 */
	public void minusBookNum(String isbn,int num) throws Exception{
		Log.logger.info("�ۿ�棺isbn=" + isbn + ",num=" + num);
	}
	
	/**
	 * ���ݹ��ﳵ�е�isbn��ͬʱ��ȡ�౾ͼ����Ϣ
	 * @param isbns
	 * @return   'is01','is02','is03'
	 * @throws Exception
	 */
	public List<Book> getShopBooks(String isbns) throws Exception {
		String[] szISBN = isbns.split("-");
		String newIsbns = "";
		for(int i=0;i<szISBN.length;i++) {
			if(i==0) {
					newIsbns = "'" + szISBN[i] + "'";
			}else {
				newIsbns = newIsbns +  ",'" + szISBN[i] + "'";	
			}
		}
		return bookMapper.getShopBooks(newIsbns);		
	}
	
	/**
	 * У�����isbn�Ƿ��Ѿ�����
	 * @param isbn
	 * @return   true �����Ѵ���   false������
	 * @throws Exception
	 */
	public boolean validISBN(String isbn) throws Exception {	
		boolean bRet = false;
		
		Book bk = bookMapper.validISBN(isbn);
		if(bk != null) {
			bRet = true;
		}
		
		return bRet;
	}
	
	
	/**
	 * ����ͼ���isbn����ȡͼ�����飨����blob���ݣ�
	 * @param isbn
	 * @return
	 * @throws Exception
	 */
	public Book getBookInfo(String isbn) throws Exception {
		
		return bookMapper.getBookInfo(isbn);
	}
	
	/**
	 * ��ȡͼƬ���ֽ���
	 * @param isbn
	 * @return
	 * @throws Exception
	 */
	public byte[] getBkpic(String isbn) throws Exception {
		byte[] pic = null;
				
//		String sql = "select pic from tbook where isbn=?";
//		Connection conn = this.openConnection();
//		PreparedStatement ps = conn.prepareStatement(sql);
//		ps.setString(1,isbn);
//		ResultSet rs = ps.executeQuery();
//		while(rs.next()) {
//			pic = rs.getBytes("pic");
//			break;
//		}
//		rs.close();
//		ps.close();
//		this.closeConnection(conn);
//		
		return pic;		
	}
	
	/**
	 * ��ȡ������ҳ�Ƽ���ͼ��
	 * @return
	 * @throws Exception
	 */
	public List<MBook> getAllMainBook() throws Exception {		
		return bookMapper.getAllMainBook();
	}
	
	/**
	 * ͼ�����
	 * @param book
	 * @throws Exception
	 */
	public void addBook(Book book) throws Exception{
		bookMapper.addBook(book);
	}

	/**
	 * ��ȡ����ͼ��Ŀ¼
	 * @return
	 * @throws Exception
	 */
	public List<Category> getAllCategory() throws Exception {	
		return bookMapper.getAllCategory();
	}

}
