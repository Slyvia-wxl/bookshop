package admin.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.servlet.BaseServlet;
import order.domain.Order;
import order.service.OrderService;
import pager.PageBean;
import user.domain.User;

public class AdminOrderServlet extends BaseServlet {
	private OrderService orderService = new OrderService();
	
	public String deliver(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");

		int status = orderService.findStatus(oid);
		if(status != 2) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "状态不对，不能发货");
			return "f:/adminjsps/msg.jsp";
		}
		orderService.updateStatus(oid, 3);
		req.setAttribute("code", "success");
		req.setAttribute("msg", "发货成功");
		return "f:/adminjsps/msg.jsp";		
	}
	
	public String cancel(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");

		int status = orderService.findStatus(oid);
		if(status != 1) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "状态不对，不能取消");
			return "f:/adminjsps/msg.jsp";
		}
		orderService.updateStatus(oid, 5);
		req.setAttribute("code", "success");
		req.setAttribute("msg", "订单已取消");
		return "f:/adminjsps/msg.jsp";		
	}
	
	public String load(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		Order order = orderService.load(oid);
		req.setAttribute("order", order);
		String btn = req.getParameter("btn");
		req.setAttribute("btn", btn);
		return "/adminjsps/admin/order/desc.jsp";
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
	
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		int pc = getPc(req);
		String url = getUrl(req);
		PageBean<Order> pb = orderService.findAll(pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/adminjsps/admin/order/list.jsp";
	}
	
	public String findByStatus(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		int pc = getPc(req);

		String url = getUrl(req);

		int status = Integer.parseInt(req.getParameter("status"));

		PageBean<Order> pb = orderService.findByStatus(status, pc);

		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/adminjsps/admin/order/list.jsp";
	}
}
