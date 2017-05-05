package ${packageName}.service;
import java.util.*;
import ${packageName}.entity.${className_d};

/**
 * ${className}
 */
public interface ${className_d}Service{
   
	
	/**
	 * 根据条件 查询全部listPageAccount
	 */
	 
	public List<${className_d}> listPage${className_d}(${className_d} ${className_x});
	


	

	
	/**
	 * 根据根据条件查询${className_d} 
	 */
	public List<${className_d}> list${className_d}(${className_d} ${className_x});  
	 

	 /**
	 * 很据实体类删除
	 */
	
	public void  delete${className_d}(${className_d} ${className_x});
	

	/**
	 *有条件的更新
	 */
	
	public void insertSelective(${className_d} ${className_x});
	/**
	 *根据主键有条件的更新
	 */
	
	public void updateByPrimaryKeySelective(${className_d} ${className_x});
	
}