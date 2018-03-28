package ${packageName}.service;
import java.util.*;
import ${packageName}.entity.${className_d};

/**
 * ${className}
 */
public interface ${className_d}Service{
   
	List<${className_d}> listPage${className_d}(${className_d} ${className_x});
	
	List<${className_d}> list${className_d}(${className_d} ${className_x});
	 
	void delete${className_d}(${className_d} ${className_x});

	void insertSelective(${className_d} ${className_x});

	void updateByPrimaryKeySelective(${className_d} ${className_x});
	
}