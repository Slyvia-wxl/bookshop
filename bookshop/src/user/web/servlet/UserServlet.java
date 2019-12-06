package user.web.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.itcast.commons.CommonUtils;
import user.domain.User;
import cn.itcast.servlet.BaseServlet;
import user.service.UserService;

/**
 * UserServlet用来接收客户端请求，处理与WEB相关的问题。
 * 例如获取客户端的请求参数，然后转发或重定向等。
 * 在UserServlet中完成业务功能需要使用UserService。
 * 因为要让一个Servlet中有多个请求处理方法，所以让UserServlet继承BaseServlet
 */
public class UserServlet extends BaseServlet {
	private UserService userService = new UserService();
	
	public String ajaxValidateLoginname(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		String loginname = req.getParameter("loginname");
		boolean b = userService.ajaxValidateLoginname(loginname);//如果登录名已注册就返回true
		resp.getWriter().print(b);
		return null;
	}
	
	public String ajaxValidateEmail(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		String email = req.getParameter("email");
		boolean b = userService.ajaxValidateEmail(email);
		resp.getWriter().print(b);
		return null;
	}
	
	public String ajaxValidateVerifyCode(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		String verifyCode = req.getParameter("verifyCode");
		String vcode = (String) req.getSession().getAttribute("vCode");
		boolean b = verifyCode.equalsIgnoreCase(vcode);
		resp.getWriter().print(b);
		return null;
	}
	
	public String regist(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		/*
		 * 1. 封装表单数据到User对象
		 */
		User formUser = CommonUtils.toBean(req.getParameterMap(), User.class);
		/*
		 * 2. 校验，失败则保存错信息，返回login-regist.jsp显示
		 */
		Map<String,String> errors = validateRegist(formUser, req.getSession());
		if(errors.size() > 0) {
			req.setAttribute("form", formUser);
			req.setAttribute("errors", errors);
			return "f:/jsps/user/login-regist.jsp";
		}
		/*
		 * 3. 使用service完成业务
		 */ 
		userService.regist(formUser);

		return "jsps/welcome.jsp";
	}
	 
	/*
	 * 注册校验
	 * 对表单字段进行各个校验，如果有错误，使用当前字段名称key，错误信息为value，保存到map
	 */
	private Map<String,String> validateRegist(User formUser, HttpSession session) {
		Map<String,String> errors = new HashMap<String,String>();

		String loginname = formUser.getLoginname();
		if(loginname == null || loginname.trim().isEmpty()) {
			errors.put("loginname", "");
		} else if(loginname.length() < 3 || loginname.length() > 20) {
			errors.put("loginname", "用户名长度必须在3-20之间");
		} else if(!userService.ajaxValidateLoginname(loginname)) {
			errors.put("loginname", "已被注册");
		}
		
		String loginpass = formUser.getLoginpass();
		if(loginpass == null || loginpass.trim().isEmpty()) {
			errors.put("loginpass", "密码不为空");
		} else if(loginpass.length() < 3 || loginpass.length() > 20) {
			errors.put("loginpass", "密码长度在3-20之间");
		}
		

		String reloginpass = formUser.getReloginpass();
		if(reloginpass == null || reloginpass.trim().isEmpty()) {
			errors.put("reloginpass", "确认密码不能为空");
		} else if(!reloginpass.equals(loginpass)) {
			errors.put("reloginpass", "两次输入不一致");
		}
		
		String email = formUser.getEmail();
		if(email == null || email.trim().isEmpty()) {
			errors.put("email", "Email不能为空");
		} else if(!email.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$")) {
			errors.put("email", "Email格式错误");
		} else if(!userService.ajaxValidateEmail(email)) {
			errors.put("email", "Email已被注册");
		}
		
		return errors;
	}
	
	
	public String login(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到User对象
		 */
		User formUser = CommonUtils.toBean(req.getParameterMap(), User.class);
		/*
		 * 2. 校验，失败则保存错信息，返回login-regist.jsp显示
		 */
		Map<String,String> errors = validateLogin(formUser, req.getSession());
		if(errors.size() > 0) {
			req.setAttribute("form", formUser);
			req.setAttribute("errors", errors);
			return "f:/jsps/user/login-regist.jsp";
		}
		
		User user = userService.login(formUser);

		if(user == null) {
			req.setAttribute("msg", "用户名或密码错误");
			req.setAttribute("user", formUser);
			return "f:/jsps/user/login-regist.jsp";
		} else {
				req.getSession().setAttribute("sessionUser", user);

				String loginname = user.getLoginname();
				loginname = URLEncoder.encode(loginname, "utf-8");
				Cookie cookie = new Cookie("username", loginname);
				cookie.setMaxAge(60 * 60 * 24 * 10);
				resp.addCookie(cookie);
				return "r:/index.jsp";
		}
	}
	
	private Map<String,String> validateLogin(User formUser, HttpSession session) {
		Map<String,String> errors = new HashMap<String,String>();
		
		String verifyCode = formUser.getVerifyCode();
		String vcode = (String) session.getAttribute("vCode");
		if(verifyCode == null || verifyCode.trim().isEmpty()) {
			errors.put("verifyCode", "验证码不能为空");
		} else if(!verifyCode.equalsIgnoreCase(vcode)) {
			errors.put("verifyCode", "验证吗错误");
		}
		return errors;
	}
	
	public String quit(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException{
			req.getSession().invalidate();
			return "r:/jsps/user/login-regist.jsp";
}
}
