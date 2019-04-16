/**
 *<p>Title:LoginAccountNumber.java</p>
 *<p>Description:</p>
 *<p></p>
 *<p></p>
 *@date 2019年2月16日
 *@author 胡金光
 */
package cn.com.employee.po;

/**
 * @author 胡金光
 *
 */
public class User{
	private Integer id;
	private String user;
	private String password;
	private String userType;
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
}