package cn.com.employee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.com.employee.page.Page;
import cn.com.employee.po.EmployeeinformationCustom;
import cn.com.employee.po.EmployeeinformationQueryVo;
import cn.com.employee.service.EmployeeService;
import cn.com.employee.validation.ValidGroupSequence;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;

	/**
	 * 分页
	 */
	@RequestMapping("/employeeAllSubmit")
	public String employeeAllSubmit(Model model, @RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber)
			throws Exception {
		Page<EmployeeinformationCustom> page = new Page<EmployeeinformationCustom>();
		page = employeeService.getPage(pageNumber);
		List<EmployeeinformationCustom> list = page.getList();
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "show";
	}

	/**
	 * <p>
	 * Description: 添加员工信息提交
	 * </p>
	 * 
	 * @param employeeinformationCustom
	 */
	@RequestMapping("/employeeInsertSubmit")
	public String employeeInsertSubmit(Model model,
			@Validated({ ValidGroupSequence.class }) EmployeeinformationCustom employeeinformationCustom,
			BindingResult bindingResult) throws Exception {
		if (bindingResult.hasErrors()) {
			// 输出错误信息
			List<ObjectError> allErrors = bindingResult.getAllErrors();
			for (ObjectError objectErrors : allErrors) {
				// 输出错误信息到控制台
				System.out.println(objectErrors.getDefaultMessage());
			}
			// 将错误信息传到页面
			model.addAttribute("allErrors", allErrors);
			return "add";
		}
		employeeService.addEmployee(employeeinformationCustom);
		return "success";
	}

	/**
	 * 
	 * <p>
	 * Description: 删除员工信息提交
	 * </p>
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/employeeDeleteSubmit")
	public String employeeDeleteSubmit(Integer id) throws Exception {
		if (id != null) {
			employeeService.deleteEmployee(id);
			return "success";
		} else {
			return "error";
		}
	}

	/**
	 * 批量删除
	 * 
	 * @param employee_id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/employeeBatchDeleteSubmit")
	public String employeeBatchDeleteSubmit(Integer[] employee_id) throws Exception {
		if (employee_id.length > 1) {
			employeeService.batchDeleteEmployee(employee_id);
			return "success";
		} else if (employee_id.length == 1 && employee_id[0] != null) {
			employeeService.deleteEmployee(employee_id[0]);
			return "success";
		} else {
			return "error";
		}
	}

	/**
	 * 员工信息更新
	 * 
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/employeeUpdate")
	public String employeeUpdate(Model model, Integer id) throws Exception {
		EmployeeinformationCustom employee = employeeService.selectById(id);
		model.addAttribute("employee", employee);
		return "alter";
	}

	/**
	 * 
	 * <p>
	 * Description:批量修改
	 * </p>
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/employeeBetchUpdateSubmit")
	public String employeeBetchUpdateSubmit(EmployeeinformationQueryVo employeeinformationQueryVo) throws Exception {
		if (employeeinformationQueryVo != null) {
			employeeService.batchUpdateEmployee(employeeinformationQueryVo);
			return "success";
		} else {
			return "error";
		}
	}

	@RequestMapping("/employeeBetchUpdatePage")
	public String employeeBetchUpdatePage(Model model, Integer[] employee_id) throws Exception {
		List<EmployeeinformationCustom> employeeList = null;
		if (employee_id.length >= 1) {
			employeeList = employeeService.batchFindUpdate(employee_id);
			model.addAttribute("employeeList", employeeList);
			return "updateBatch";
		} else {
			return "error";
		}
	}

	/**
	 * 
	 * <p>
	 * Description:员工信息修改提交
	 * </p>
	 * 
	 * @param model
	 * @param id
	 * @param employeeinformationCustom
	 * @return "success" : 成功页面 "error" : 错误页面
	 * @throws Exception
	 */
	@RequestMapping("/employeeUpdateSubmit")
	public String employeeUpdateSubmit(Model model, Integer id, EmployeeinformationCustom employeeinformationCustom)
			throws Exception {
		try {
			if (id != 0 && id != null) {
				employeeService.updateEmployee(id, employeeinformationCustom);
				return "success";
			} else {
				return "error";
			}
		} catch (NullPointerException npe) {
			model.addAttribute("er", "操作失败");
			return "error";
		}
	}

	/**
	 * <p>
	 * Description:查找员工提交
	 * </p>
	 * 
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/employeeQueryDisplay")
	public String employeeQueryDisplay(Model model, String findType, String value) throws Exception {
		List<EmployeeinformationCustom> employeeList = null;
		EmployeeinformationCustom employeeForId = null;
		/**
		 * 如果传入数据是name则按照name进行查询,如果是id按照id进行查询，否则跳转到错误页面
		 */
		if (findType.replace("", "").equals("name")) {
			EmployeeinformationCustom employee = new EmployeeinformationCustom();
			employee.setName(value);
			EmployeeinformationQueryVo employeeQueryVo = new EmployeeinformationQueryVo();
			employeeQueryVo.setEmployeeinformationCustom(employee);
			employeeList = employeeService.selectEmployeeList(employeeQueryVo);
			if (employeeList != null) {
				model.addAttribute("employeeList", employeeList);
				return "query";
			} else {
				model.addAttribute("inexistence", "您要查找的员工信息不存在，请核对后再进行查询！");
				return "query";
			}

		} else if (findType.trim().equals("id") && Integer.valueOf(value.replace("", "")) > 0) {
			employeeForId = employeeService.selectById(Integer.valueOf(value.replace("", "")));
			if (employeeForId != null) {
				model.addAttribute("employee", employeeForId);
				return "query";
			} else {
				model.addAttribute("inexistence", "您要查找的员工信息不存在，请核对后再进行查询！");
				return "query";
			}
		} else {
			return "error";
		}
	}
}