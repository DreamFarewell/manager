package cn.com.employee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.com.employee.po.UserCustom;
import cn.com.employee.service.UserService;

@Controller
@RequestMapping("/super")
public class SuperUserController {
	@Autowired
	private UserService userService;
	/**
	 * 用户列表
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manageUser")
	public String manageUser(Model model) throws Exception {
		List<UserCustom> userList = userService.getUserList();
		model.addAttribute("userList",userList);
		return "manageUser";
	}
	
	/**
	 * 删除用户
	 * @param user
	 * @param userType
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteUser")
	public String deleteUser(@RequestParam("username")String user,@RequestParam("type")String userType) throws Exception {
		if(user!=null && userType!=null) {
			userService.deleteUser(user, userType);
				return "success";
		}else {
			return "error";
		}
	}
	/**
	 * 修改单个用户提交查找
	 */
	@RequestMapping("/updateUserPage")
	public String updateUserPage(Model model,@RequestParam("id")Integer id) throws Exception {
		UserCustom userCustom = userService.findUserById(id);
		model.addAttribute("userCustom", userCustom);
		return "updateUser";
	}
	/**
	 * 更新用户
	 */
	@RequestMapping("/updateUser")
	public String updateUser(@RequestParam("id")Integer id,@RequestParam("user")String user,@RequestParam("password")String password,@RequestParam("type")String type) throws Exception {
		UserCustom userCustom = new UserCustom();
		userCustom.setUser(user);
		userCustom.setPassword(password);
		userCustom.setUserType(type);
		userService.updateUser(id, userCustom);
		return "success";
	}
	/**
	 * 添加新用户页面
	 */
	@RequestMapping("/insertUserPage")
	public String insertUserPage() throws Exception {
		return "insertUser";
	}
	/**
	 * 添加新用户提交
	 */
	@RequestMapping("/insertUser")
	public String insertUser(Model model,String user,String password,@RequestParam("type")String userType) throws Exception {
		/*
		 * 判断用户是否存在于数据库
		 */
		if(userService.judge(user, userType)) {
			UserCustom userCustom = new UserCustom();
			userCustom.setUser(user);
			userCustom.setPassword(password);
			userCustom.setUserType(userType);
			userService.insertUser(userCustom);
			return "success";
		}else {
			model.addAttribute("user", user);
			model.addAttribute("password", password);
			model.addAttribute("lose", "用户名已存在");
			return "insertUser";
		}
	}
}
