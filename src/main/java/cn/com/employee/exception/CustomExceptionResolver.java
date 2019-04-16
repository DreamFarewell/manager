package cn.com.employee.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * 全局异常处理器
 * 
 * @author 胡金光
 *
 */
public class CustomExceptionResolver implements HandlerExceptionResolver {
	/**
	 * @exception 系统抛出的异常
	 * @handler 处理器适配器要执行的Handler对象
	 */
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception exception) {
		/**
		 * 如果 该异常类型是系统自定义的异常，直接取出异常信息，在错误页面展示
		 */
		CustomException customException = null;
		if (exception instanceof CustomException) {
			customException = (CustomException) exception;
			// 错误信息
			String message = customException.getMessage();
			ModelAndView modelAndView = new ModelAndView();
			// 将错误信息传到页面
			modelAndView.addObject("message", message);
			modelAndView.setViewName("error");
			return modelAndView;
		} else {
			/**
			 * 如果 该异常类型不是系统自定义的异常，构造一个自定义的异常类型类型（信息为“未知错误”）
			 */
			customException = new CustomException("未知错误");
			// 错误信息
			String message = customException.getMessage();
			ModelAndView modelAndView = new ModelAndView();
			// 将错误信息传到页面
			modelAndView.addObject("message", message);
			modelAndView.setViewName("error");
			return modelAndView;
		}

	}
}
