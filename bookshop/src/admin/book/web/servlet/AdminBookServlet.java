package admin.book.web.servlet;

import category.domain.Category;
import category.service.CategoryService;
import cn.itcast.commons.CommonUtils;
import book.service.BookService;
import book.domain.Book;
import pager.PageBean;
import cn.itcast.servlet.BaseServlet;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.web.servlet.BookServlet;

public class AdminBookServlet extends BaseServlet {
	private BookService bookService = new BookService();
	private CategoryService  categoryService = new CategoryService();
	
	public String delete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String bid = req.getParameter("bid");
		
		Book book = bookService.load(bid);
		String savepath = this.getServletContext().getRealPath("/");
		new File(savepath, book.getImage_w()).delete();
		new File(savepath, book.getImage_b()).delete();
		
		bookService.delete(bid);
		
		req.setAttribute("msg", "删除图书成功");
		return "f:/adminjsps/msg.jsp";
	}
	
	public String edit(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Map map = req.getParameterMap();
		Book book = CommonUtils.toBean(map, Book.class);
		Category category = CommonUtils.toBean(map, Category.class);
		book.setCategory(category);
		
		bookService.edit(book);
		req.setAttribute("msg", "修改图书成功");
		return "f:/adminjsps/msg.jsp";
	}
	
	public String load(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String bid = req.getParameter("bid");
		Book book = bookService.load(bid);
		req.setAttribute("book", book);

		req.setAttribute("parents", categoryService.findParents());

		String pid = book.getCategory().getParent().getCid();
		req.setAttribute("children", categoryService.findChildren(pid));

		return "f:/adminjsps/admin/book/desc.jsp";
	}
	
	public String ajaxFindChildren(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pid = req.getParameter("pid");
		List<Category> children = categoryService.findChildren(pid);
		String json = toJson(children);
		System.out.println(json);
		resp.getWriter().print(json);
		return null;
	}
	
	// {"cid":"fdsafdsa", "cname":"fdsafdas"}
	private String toJson(Category category) {
		StringBuilder sb = new StringBuilder("{");
		sb.append("\"cid\"").append(":").append("\"").append(category.getCid()).append("\"");
		sb.append(",");
		sb.append("\"cname\"").append(":").append("\"").append(category.getCname()).append("\"");
		sb.append("}");
		return sb.toString();
	}
	
	// [{"cid":"fdsafdsa", "cname":"fdsafdas"}, {"cid":"fdsafdsa", "cname":"fdsafdas"}]
	private String toJson(List<Category> categoryList) {
		StringBuilder sb = new StringBuilder("[");
		for(int i = 0; i < categoryList.size(); i++) {
			sb.append(toJson(categoryList.get(i)));
			if(i < categoryList.size() - 1) {
				sb.append(",");
			}
		}
		sb.append("]");
		return sb.toString();
	}
	
	public String addPre(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Category> parents = categoryService.findParents();
		req.setAttribute("parents", parents);
		return "f:/adminjsps/admin/book/add.jsp";
	}
	
	public String findCategoryAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		List<Category> parents = categoryService.findAll();
		req.setAttribute("parents", parents);
		return "f:/adminjsps/admin/top.jsp";
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

	public String findByCategory(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		String cid = req.getParameter("cid");
		PageBean<Book> pb = bookService.findByCategory(cid, pc);
		
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/adminjsps/admin/book/list.jsp";
	}
	

	public String findByAuthor(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		String author = req.getParameter("author");
		PageBean<Book> pb = bookService.findByAuthor(author, pc);
		
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/adminjsps/admin/book/list.jsp";
	}

	public String findByPress(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		String press = req.getParameter("press");
		PageBean<Book> pb = bookService.findByPress(press, pc);
		
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/adminjsps/admin/book/list.jsp";
	}
	

	public String findByBname(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		String bname = req.getParameter("bname");
		PageBean<Book> pb = bookService.findByBname(bname, pc);

		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/adminjsps/admin/book/list.jsp";
	}
	
}
