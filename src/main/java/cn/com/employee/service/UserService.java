package cn.com.employee.service;

import java.util.List;

import cn.com.employee.po.UserCustom;

public interface UserService {
	//获得用户
	boolean getUser(UserCustom user) throws Exception;
	//根据主键查询用户
	UserCustom findUserById(Integer id) throws Exception;
	//获得用户列表
	List<UserCustom> getUserList() throws Exception;
	//删除用户
	void deleteUser(String user,String userType) throws Exception;
	//更新用户
	void updateUser(Integer id,UserCustom userCustom) throws Exception;
	//新建用户
	void insertUser(UserCustom userCustom) throws Exception;
	//判断用户是否存在于数据库
	boolean judge(String user,String userType) throws Exception;
	//判断用户密码是否正确
	boolean judgePassword(UserCustom userCustom) throws Exception;
}