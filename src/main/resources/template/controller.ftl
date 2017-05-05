package ${packageName}.controller;

import ${packageName}.entity.${className_d};
import ${packageName}.service.${className_d}Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@Slf4j
@RequestMapping(value = "/${className_x}")
public class ${className_d}Controller {

	@Autowired
	private ${className_d}Service ${className_x}Service;



	/**
	 * 显示列表
	 * @param ${className_x}
	 * @return
	 */
	@GetMapping("list")
	public List<${className_d}>list(${className_d} ${className_x}) {
		
		List<${className_d}> ${className_x}List = ${className_x}Service.listPage${className_d}(${className_x});
		return ${className_x}List ;
	}
	


	/**
	 * 保存
	 * 
	 * @param ${className_x}
	 * @return
	 */
	@PostMapping(value = "/save")
	public ${className_d} save(@RequestBody ${className_d} ${className_x}) {
	    try {
			if (${className_x}.get${key_d}() == null || ${className_x}.get${key_d}().intValue() == 0) {
				${className_x}Service.insertSelective(${className_x});
			} else {
				${className_x}Service.updateByPrimaryKeySelective(${className_x});
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ${className_x};
	}



	
	/**
	 * 查看详情
	 * @param  ${className_x}
	 */
	@PostMapping(value = "/delete")
	public String delete(${className_d} ${className_x}) {
		${className_x}Service.delete${className_d}(${className_x});
		return "success";
	}
}
