/**
 *<p>Title:LoginController.java</p>
 *@date 2019年2月16日
 *@author 胡金光
 */
package cn.com.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.employee.po.UserCustom;
import cn.com.employee.service.UserService;

/**
 * @author 胡金光
 *
 */
@Controller
public class LoginController {
	@Autowired
	private UserService userService;

	@RequestMapping("/login")
	public String login(Model model, HttpSession session, String userType, String user, String password)
			throws Exception {
		// 判断页面传过来的值是否为空
		UserCustom uc = new UserCustom();
		uc.setUser(user);
		uc.setPassword(password);
		uc.setUserType(userType);
		// 判断数据库中是否存在该用户
		// 如果信息和数据库中的匹配,则向下执行
		if (userService.getUser(uc)) {
			if (userType.replace("", "").equals("ordinary")) {
				/* 如果是普通管理员用户，则跳转到普通管理员用户权限所在范围的主页 */
				session.setAttribute("username", uc.getUser());
				session.setAttribute("userType", uc.getUserType());
				return "redirect:/employee/employeeAllSubmit.action";
			} else if (userType.replace("", "").equals("super")) {
				/* 如果是超级管理员用户，则跳转到超级管理员用户权限用户所在范围的主页 */
				session.setAttribute("username", uc.getUser());
				session.setAttribute("userType", uc.getUserType());
				return "redirect:/super/manageUser.action";
			}
		} else if (userService.judgePassword(uc)) {
			/* 如果只是用户的密码不匹配，则把错误信息和回显数据传回到登录页面 */
			model.addAttribute("user", user);
			model.addAttribute("password", password);
			model.addAttribute("userType", userType);
			model.addAttribute("lose", "密码不正确");
			return "login";
		} else {
			/* 如果和数据库中的数据完全不匹配，则把错误信息和回显数据传回到登录页面 */
			model.addAttribute("user", user);
			model.addAttribute("password", password);
			model.addAttribute("userType", userType);
			model.addAttribute("lose", "用户信息不存在");
			return "login";
		}
		model.addAttribute("lose", "账号或密码不正确，请重新输入！");
		return "login";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		
		session.invalidate();
		return "redirect:/employee/employeeAllSubmit.action";
	}
}
