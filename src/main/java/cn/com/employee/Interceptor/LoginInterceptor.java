/**
 *<p>Title:LoginInterceptor.java</p>
 *<p>Description:</p>
 *<p></p>
 *<p></p>
 *@date 2019年2月16日
 *@author 胡金光
 */
package cn.com.employee.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 胡金光
 *
 */
public class LoginInterceptor implements HandlerInterceptor {

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.web.servlet.HandlerInterceptor#afterCompletion(javax.
	 * servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse,
	 * java.lang.Object, java.lang.Exception)
	 */
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.web.servlet.HandlerInterceptor#postHandle(javax.servlet.
	 * http.HttpServletRequest, javax.servlet.http.HttpServletResponse,
	 * java.lang.Object, org.springframework.web.servlet.ModelAndView)
	 */
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.
	 * http.HttpServletRequest, javax.servlet.http.HttpServletResponse,
	 * java.lang.Object)
	 */
	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		// 获取 请求的url
		String url = arg0.getRequestURI();
		// 判断 url是否为公开地址
		// 这里公开地址是登录提交的地址
		if (url.indexOf("login.action") >= 0) {
			// 如果进行登录提交则放行
			return true;
		}
		// 获得session
		HttpSession session = arg0.getSession();
		// 从session中抽取出用户信息
		String user = (String) session.getAttribute("username");
		String userType = (String) session.getAttribute("userType");
		// 如果用户信息存在，且用户类型是ordinary，放行;用户类型是super,放行
		if (user != null && userType.equals("ordinary")) {
			return true;
		} else if (user != null && userType.equals("super")) {
			return true;
		}
		// 如果用户身份需要谁，跳转到登录页面
		arg0.getRequestDispatcher("/page/login.jsp").forward(arg0, arg1);
		return true;
	}
}