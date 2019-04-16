package cn.com.employee.exception;

@SuppressWarnings("serial")
/**
 * 用户自定义异常
 * @author 胡金光
 *
 */
public class CustomException extends Exception{
	//异常信息
	private String message;
	public CustomException(String message) {
		super(message);
		this.setMessage(message);
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}