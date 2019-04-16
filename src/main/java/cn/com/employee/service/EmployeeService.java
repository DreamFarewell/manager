package cn.com.employee.service;

import java.util.List;

import cn.com.employee.page.Page;
import cn.com.employee.po.EmployeeinformationCustom;
import cn.com.employee.po.EmployeeinformationQueryVo;
/**
 * service接口
 * @author 胡金光
 *
 */
public interface EmployeeService {
	//添加员工
	void addEmployee(EmployeeinformationCustom employeeinformationCustom) throws Exception;
	//根据员工号更新员工信息
	void updateEmployee(Integer id, EmployeeinformationCustom employeeinformationCustom) throws Exception;
	void deleteEmployee(Integer id) throws Exception;
	//根据员工id查找员工信息
	EmployeeinformationCustom selectById(Integer id) throws Exception;
	//根据员工姓名查找员工列表
	List<EmployeeinformationCustom> selectEmployeeList(EmployeeinformationQueryVo employeeinformationQueryVo)
			throws Exception;
	//批量删除
	void batchDeleteEmployee(Integer[] id) throws Exception;
	//批量修改
	void batchUpdateEmployee(EmployeeinformationQueryVo employeeinformationQueryVo) throws Exception;
	//批量修改的查询
	List<EmployeeinformationCustom> batchFindUpdate(Integer[] id) throws Exception;
	//分页查询
	Page<EmployeeinformationCustom> getPage(int pageNumber) throws Exception;
}