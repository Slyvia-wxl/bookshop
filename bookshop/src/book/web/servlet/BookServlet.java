package book.web.servlet;

import book.domain.Book;
import pager.PageBean;
import cn.itcast.servlet.BaseServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.service.BookService;

public class BookServlet extends BaseServlet {
	private BookService bookService = new BookService();
	
	public String load(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String bid = req.getParameter("bid");
		Book book = bookService.load(bid);
		req.setAttribute("book", book);
		return "f:/jsps/book/product.jsp";
	}
	
	public String findByBname(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int pc = getPc(req);

		String url = getUrl(req);

		String bname = req.getParameter("bname");

		PageBean<Book> pb = bookService.findByBname(bname, pc);

		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/jsps/book/list.jsp";
	}
	
	public String findByPress(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		int pc = getPc(req);

		String url = getUrl(req);

		String press = req.getParameter("press");

		PageBean<Book> pb = bookService.findByPress(press, pc);

		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/jsps/book/list.jsp";
	}
	
	public String findByAuthor(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		int pc = getPc(req);

		String url = getUrl(req);

		String author = req.getParameter("author");

		PageBean<Book> pb = bookService.findByAuthor(author, pc);

		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/jsps/book/list.jsp";
	}
	
	public String findByCategory(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		int pc = getPc(req);//获取当前页码

		String url = getUrl(req);//获取url，设置给PageBean

		String cid = req.getParameter("cid");//使用BookService查询，得到PageBean
		PageBean<Book> pb = bookService.findByCategory(cid, pc);

		pb.setUrl(url);
		req.setAttribute("pb", pb);//把PageBean保存到request，转发到/jsps/book/list.jsp
		return "f:/jsps/book/list.jsp";
	}
	
	private int getPc(HttpServletRequest req) {
		int pc = 1;
		String param = req.getParameter("pc");
		if(param != null && !param.trim().isEmpty()) {
			try {
				pc = Integer.parseInt(param);
			} catch(RuntimeException e) {}
		}
		return pc;
	}
	
	private String getUrl(HttpServletRequest req) {
		String url = req.getRequestURI() + "?" + req.getQueryString();

		int index = url.lastIndexOf("&pc=");
		if(index != -1) {
			url = url.substring(0, index);
		}
		return url;
	}
}
