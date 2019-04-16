package cn.com.employee.po;

import java.util.List;


/**
 * 员工查询包装类
 * @author 胡金光
 *
 */
public class EmployeeinformationQueryVo {
	private EmployeeinformationCustom employeeinformationCustom;
	private List<EmployeeinformationCustom> employeeList;
	
	public EmployeeinformationCustom getEmployeeinformationCustom() {
		return employeeinformationCustom;
	}
	public void setEmployeeinformationCustom(EmployeeinformationCustom employeeinformationCustom) {
		this.employeeinformationCustom = employeeinformationCustom;
	}
	public List<EmployeeinformationCustom> getEmployeeList() {
		return employeeList;
	}
	public void setEmployeeList(List<EmployeeinformationCustom> employeeList) {
		this.employeeList = employeeList;
	}
}