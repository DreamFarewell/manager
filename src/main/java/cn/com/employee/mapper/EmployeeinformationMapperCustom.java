package cn.com.employee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.employee.po.EmployeeinformationCustom;
import cn.com.employee.po.EmployeeinformationQueryVo;
/**
 * EmployeeinformationMapperCustom<p>（查找全部员工信息mapper接口）</p>
 * @author 胡金光
 *
 */
public interface EmployeeinformationMapperCustom {
	public List<EmployeeinformationCustom> findStaff(EmployeeinformationQueryVo employeeinformationQueryVo) throws Exception;
	/**
	 * 
	 *<p>Description:批量删除
	 *</p>
	 * @return
	 * @throws Exception
	 */
	public void batchDeleteEmployee(Integer[] id) throws Exception;
	/**
	 * 
	 *<p>Description:批量修改
	 *</p>
	 * @param employeeinformationCustom
	 * @return
	 * @throws Exception
	 */
	public void batchUpdateEmployee(EmployeeinformationQueryVo employeeinformationQueryVo) throws Exception;
	
	public List<EmployeeinformationCustom> batchFindUpdate(Integer[] id) throws Exception;
	
	/**
	 * 分页查询总记录数
	 */
	public int getRecordsCount() throws Exception;
	/**
	 * 分页查询列表
	 */
	public List<EmployeeinformationCustom> pageList(@Param("index")int index, @Param("pageSize")int pageSize) throws Exception;
}