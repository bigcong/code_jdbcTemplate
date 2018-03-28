package ${packageName}.service.impl;
import java.util.*;
import ${packageName}.dao.${className_d}Dao;
import ${packageName}.entity.${className_d};
import ${packageName}.service.${className_d}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import lombok.extern.slf4j.Slf4j;

/**
 * ${className}
 * @author lilaizhen
 * @date 2018/4/1
 */
@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public  class ${className_d}ServiceImpl implements ${className_d}Service{
    @Autowired
	private ${className_d}Dao ${className_x}Dao;
	
	@Override
	public List<${className_d}> listPage${className_d}(${className_d} ${className_x}){
		return ${className_x}Dao.listPage${className_d}(${className_x});
	}

	@Override
	public List<${className_d}> list${className_d}(${className_d} ${className_x}){
	    return ${className_x}Dao.list${className_d}(${className_x});
	}  

	
	@Override
	public void  delete${className_d}(${className_d} ${className_x}){
	     ${className_x}Dao.delete${className_d}(${className_x});
	}

	@Override
	public void insertSelective(${className_d} ${className_x}){
	 ${className_x}Dao.insertSelective(${className_x});
	}
	
	@Override
	public void updateByPrimaryKeySelective(${className_d} ${className_x}){
		 ${className_x}Dao.updateByPrimaryKeySelective(${className_x});
	}
	
}