package ${packageName}.dao;
import java.util.*;
import ${packageName}.entity.${className_d};

public interface ${className_d}Dao{

	List<${className_d}> listPage${className_d}(${className_d} ${className_x});

	void insertSelective(${className_d} ${className_x});

	void updateByPrimaryKeySelective(${className_d} ${className_x});

	List<${className_d}> list${className_d}(${className_d} ${className_x});

	void delete${className_d}(${className_d} ${className_x});

	${className_d} get(Long ${key_x});
}