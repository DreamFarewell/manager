package cn.com.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/jsp")
public class PageJumpController {
	/**
	 * 转向show页面
	 */
	@RequestMapping("/index")
	public String index() throws Exception {
		return "redirect:/employee/employeeAllSubmit.action";
	}
	/**
	 * 转向manageUser页面
	 */
	@RequestMapping("/home")
	public String home() throws Exception {
		return "redirect:/super/manageUser.action";
	}
	/**
	 * 转向query页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("queryPage")
	public String queryPage() throws Exception {
		return "query";
	}
	/**
	 * 转向add页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/insertPage")
	public ModelAndView insertPage() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("add");
		modelAndView.getView();
		return modelAndView;
	}
}
