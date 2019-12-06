package category.web.servlet;

import category.domain.Category;
import cn.itcast.servlet.BaseServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import category.service.CategoryService;


public class CategoryServlet extends BaseServlet {
	private CategoryService categoryService = new CategoryService();
	
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Category> parents = categoryService.findAll();
		req.setAttribute("parents", parents);
		return "f:/jsps/top.jsp";
	}

}
