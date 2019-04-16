package cn.com.employee.mapper;

import cn.com.employee.po.Employeeinformation;
import cn.com.employee.po.EmployeeinformationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployeeinformationMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinformation
     *
     * @mbg.generated Wed Feb 06 14:35:18 CST 2019
     */
    long countByExample(EmployeeinformationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinformation
     *
     * @mbg.generated Wed Feb 06 14:35:18 CST 2019
     */
    int deleteByExample(EmployeeinformationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinformation
     *
     * @mbg.generated Wed Feb 06 14:35:18 CST 2019
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinformation
     *
     * @mbg.generated Wed Feb 06 14:35:18 CST 2019
     */
    int insert(Employeeinformation record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinformation
     *
     * @mbg.generated Wed Feb 06 14:35:18 CST 2019
     */
    int insertSelective(Employeeinformation record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinformation
     *
     * @mbg.generated Wed Feb 06 14:35:18 CST 2019
     */
    List<Employeeinformation> selectByExample(EmployeeinformationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinformation
     *
     * @mbg.generated Wed Feb 06 14:35:18 CST 2019
     */
    Employeeinformation selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinformation
     *
     * @mbg.generated Wed Feb 06 14:35:18 CST 2019
     */
    int updateByExampleSelective(@Param("record") Employeeinformation record, @Param("example") EmployeeinformationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinformation
     *
     * @mbg.generated Wed Feb 06 14:35:18 CST 2019
     */
    int updateByExample(@Param("record") Employeeinformation record, @Param("example") EmployeeinformationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinformation
     *
     * @mbg.generated Wed Feb 06 14:35:18 CST 2019
     */
    int updateByPrimaryKeySelective(Employeeinformation record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinformation
     *
     * @mbg.generated Wed Feb 06 14:35:18 CST 2019
     */
    int updateByPrimaryKey(Employeeinformation record);
}