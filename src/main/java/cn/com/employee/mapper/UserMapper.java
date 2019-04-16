package cn.com.employee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.employee.po.UserCustom;

public interface UserMapper {
	/**
	 * 获得用户
	 */
	public UserCustom getUser(@Param("user")String user) throws Exception;
	/**
	 * 查询数据库中是否存在该用户
	 */
	public Integer judgeUser(@Param("user")String user,@Param("userType")String userType) throws Exception;
	/**
	 * 根据主键查询用户
	 */
	public UserCustom findUserById(@Param("id")Integer id) throws Exception;
	/**
	 * 获得用户列表
	 */
	public List<UserCustom> getUserList() throws Exception;
	/**
	 * 创建用户
	 * @param user
	 * @throws Exception
	 */
	public void insertUser(@Param("userCustom")UserCustom user) throws Exception;
	/**
	 * 修改用户密码
	 */
	public void updatePassword(@Param("user")String user,@Param("password")String password) throws Exception;
	/**
	 * 删除用户
	 * @param user
	 * @throws Exception
	 */
	public void deleteUser(@Param("user")String user,@Param("userType")String userType) throws Exception;
	/**
	 * 更新用户
	 * @param id
	 * @param userCustom
	 * @throws Exception
	 */
	public void updateUser(@Param("id")Integer id, @Param("userCustom")UserCustom userCustom) throws Exception;
}