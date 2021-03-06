package ${packageName}.controller;

import ${packageName}.entity.${className_d};
import ${packageName}.service.${className_d}Service;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.polarisex.common.RespEntity;

import java.util.*;

@RestController
@Log4j2
@RequestMapping(value = "/${className_x}")
public class ${className_d}Controller {

	@Autowired
	private ${className_d}Service ${className_x}Service;

	/**
	 * 显示列表
	 * @param ${className_x}
	 * @return
	 */
	@RequestMapping("list")
	public  RespEntity list(${className_d} ${className_x}) {
		List<${className_d}> ${className_x}List = ${className_x}Service.listPage${className_d}(${className_x});
		int totalPage = ${className_x}.getTotal() / ${className_x}.getSize();
		if (${className_x}.getTotal() % ${className_x}.getSize() != 0) {
  			totalPage++;
		}
		int finalTotalPage = totalPage;
		Map<String,Object> map= new HashMap<String, Object>() {{
			put("list", ${className_x}List);
			put("total", ${className_x}.getTotal());
			put("totalPage", finalTotalPage);
		}};
		return RespEntity.success(map);
	}
	
	/**
	 * 保存
	 * 
	 * @param ${className_x}
	 * @return
	 */
	@RequestMapping(value = "/save")
	public RespEntity save( ${className_d} ${className_x}) {

	    try {
			if (${className_x}.get${key_d}() == null || ${className_x}.get${key_d}().intValue() == 0) {
				${className_x}Service.insertSelective(${className_x});
			} else {
				${className_x}Service.updateByPrimaryKeySelective(${className_x});
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return RespEntity.success("");
	}

	/**
	 * 查看详情
	 * @param  ${className_x}
	 */
	@RequestMapping(value = "/delete")
	public RespEntity delete(${className_d} ${className_x}) {
		${className_x}Service.delete${className_d}(${className_x});
		return RespEntity.success("");
	}
	@RequestMapping(value = "/get")
	public RespEntity get(Long ${key_x}){
		return RespEntity.success(${className_x}Service.get(${key_x}));
	}

}
