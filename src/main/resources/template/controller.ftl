package ${packageName}.controller;

import ${packageName}.entity.${className_d};
import ${packageName}.service.${className_d}Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import com.xyhj.lian.util.RespEntity;
import com.xyhj.utils.DateUtils;
import com.xyhj.utils.UserUtil;


import java.util.*;

@Controller
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
	@RequestMapping("list")
    @ResponseBody
	public  Map<String, Object> list(${className_d} ${className_x}) {
		${className_x}.setOrderBy(" order by create_time desc ");
		List<${className_d}> ${className_x}List = ${className_x}Service.listPage${className_d}(${className_x});
		int totalPage = ${className_x}.getTotal() / ${className_x}.getSize();
		if (${className_x}.getTotal() % ${className_x}.getSize() != 0) {
  			totalPage++;
		}
		int finalTotalPage = totalPage;
		return new HashMap<String, Object>() {{
			put("list", ${className_x}List);
			put("total", ${className_x}.getTotal());
			put("totalPage", finalTotalPage);
		}};
	}
	
	/**
	 * 保存
	 * 
	 * @param ${className_x}
	 * @return
	 */
	@RequestMapping(value = "/save")
	@ResponseBody
	public RespEntity save( ${className_d} ${className_x}) {

		String uname = UserUtil.getUsername();
		${className_x}.setLastEditBy(uname);
		${className_x}.setLastEditTime(DateUtils.getNow());
	    try {
			if (${className_x}.get${key_d}() == null || ${className_x}.get${key_d}().intValue() == 0) {
				${className_x}.setCreateBy(uname);
				${className_x}.setCreateTime(DateUtils.getNow());
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
}
