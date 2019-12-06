package cart.web.servlet;

import cart.domain.CartItem;
import cart.service.CartItemService;
import user.domain.User;
import cn.itcast.commons.CommonUtils;
import book.domain.Book;
import cn.itcast.servlet.BaseServlet;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CartItemServlet extends BaseServlet {
	private CartItemService cartItemService = new CartItemService();
	
	public String loadCartItems(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String cartItemIds = req.getParameter("cartItemIds");
		double total = Double.parseDouble(req.getParameter("total"));

		List<CartItem> cartItemList = cartItemService.loadCartItems(cartItemIds);

		req.setAttribute("cartItemList", cartItemList);
		req.setAttribute("total", total);
		req.setAttribute("cartItemIds", cartItemIds);
		return "f:/jsps/cart/showitem.jsp";
	}
	
	public String updateQuantity(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String cartItemId = req.getParameter("cartItemId");
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		CartItem cartItem = cartItemService.updateQuantity(cartItemId, quantity);
		
		StringBuilder sb = new StringBuilder("{");
		sb.append("\"quantity\"").append(":").append(cartItem.getQuantity());
		sb.append(",");
		sb.append("\"subtotal\"").append(":").append(cartItem.getSubtotal());
		sb.append("}");

		resp.getWriter().print(sb);
		return null;
	}
	
	public String batchDelete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String cartItemIds = req.getParameter("cartItemIds");
		cartItemService.batchDelete(cartItemIds);
		return myCart(req, resp);
	}
	
	public String add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Map map = req.getParameterMap();
		CartItem cartItem = CommonUtils.toBean(map, CartItem.class);
		Book book = CommonUtils.toBean(map, Book.class);
		User user = (User)req.getSession().getAttribute("sessionUser");
		cartItem.setBook(book);
		cartItem.setUser(user);
		
		cartItemService.add(cartItem);
		return myCart(req, resp);
	}
	
	public String myCart(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		User user = (User)req.getSession().getAttribute("sessionUser");
		String uid = user.getUid();

		List<CartItem> cartItemLIst = cartItemService.myCart(uid);

		req.setAttribute("cartItemList", cartItemLIst);
		return "f:/jsps/cart/cart.jsp";
	}
}
