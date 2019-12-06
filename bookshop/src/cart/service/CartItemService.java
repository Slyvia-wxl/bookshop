package cart.service;

import java.sql.SQLException;
import java.util.List;

import cart.dao.CartItemDao;
import cart.domain.CartItem;
import cn.itcast.commons.CommonUtils;

public class CartItemService {
	private CartItemDao cartItemDao = new CartItemDao();
	
	public List<CartItem> loadCartItems(String cartItemIds) {
		try {
			return cartItemDao.loadCartItems(cartItemIds);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public CartItem updateQuantity(String cartItemId, int quantity) {
		try {
			cartItemDao.updateQuantity(cartItemId, quantity);
			return cartItemDao.findByCartItemId(cartItemId);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void batchDelete(String cartItemIds) {
		try {
			cartItemDao.batchDelete(cartItemIds);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void add(CartItem cartItem) {
		try {

			CartItem _cartItem = cartItemDao.findByUidAndBid(
					cartItem.getUser().getUid(),
					cartItem.getBook().getBid());
			if(_cartItem == null) {
				cartItem.setCartItemId(CommonUtils.uuid());
				cartItemDao.addCartItem(cartItem);
			} else {
				int quantity = cartItem.getQuantity() + _cartItem.getQuantity();
				cartItemDao.updateQuantity(_cartItem.getCartItemId(), quantity);
			}
		} catch(Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<CartItem> myCart(String uid) {
		try {
			return cartItemDao.findByUser(uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
