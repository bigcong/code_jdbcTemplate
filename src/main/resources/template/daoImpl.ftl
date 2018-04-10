package ${packageName}.dao.impl;

import ${packageName}.dao.${className_d}Dao;
import ${packageName}.entity.${className_d};
import com.google.common.base.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.*;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import java.util.*;
import java.util.stream.*;

/**
 *
 * @author lilaizhen
 * @date 2018/4/10
 */
@Repository
public class ${className_d}DaoImpl implements ${className_d}Dao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<${className_d}> listPage${className_d}(${className_d} ${className_x}) {
		StringBuilder s=new StringBuilder();
		String select = "select ${stringCarrayNames3} from ${className} ";
		s.append(select );
        Map<String,Object> m=map(${className_x});
        String where = "where 1=1 " + m.keySet().stream().map(t -> " and " + t + "=?").collect(Collectors.joining(" "));
		${className_x}.setTotal(count(where,m.values().toArray()));
		s.append(where);
		if (!Strings.isNullOrEmpty(${className_x}.getOrderBy())) {
			s.append(${className_x}.getOrderBy());
		}
		String limit = " limit " + (${className_x}.getStart()-1)*${className_x}.getSize() + "," + ${className_x}.getSize();
		s.append(limit);
		return jdbcTemplate.query(s.toString(), new BeanPropertyRowMapper<>(${className_d}.class),m.values().toArray());
	}

    @Override
    public void insertSelective(${className_d} ${className_x}) {
		StringBuilder s=new StringBuilder();
		s.append("insert into ${className}(");
        Map<String, Object> m = map(${className_x});
        s.append(String.join(",", m.keySet()));
        s.append(") values (");
		List<String> query = m.keySet().stream().map(t -> "?").collect(Collectors.toList());
		s.append(String.join(",", query));
		s.append(")");
        jdbcTemplate.update(s.toString(), m.values().toArray());
	}

    @Override
    public void updateByPrimaryKeySelective(${className_d} ${className_x}) {
    	StringBuilder s=new StringBuilder();
		s.append("update ${className} set ");
        Map<String, Object> m = map(${className_x});
        String update = m.keySet().stream().map(t -> t + "=?").collect(Collectors.joining(","));
        s.append(update);
        s.append(" where ${key}=" + ${className_x}.get${key_d}());
        jdbcTemplate.update(s.toString(), m.values().toArray());
	}

    @Override
    public List<${className_d}> list${className_d}(${className_d} ${className_x}) {
    	StringBuilder s=new StringBuilder();
        String select = "select ${stringCarrayNames3} from ${className} ";
        s.append(select );
        Map<String,Object> m=map(${className_x});
        String where = "where 1=1 " + m.keySet().stream().map(t -> " and " + t + "=?").collect(Collectors.joining(" "));
        s.append(where);
    	return jdbcTemplate.query(s.toString(), new BeanPropertyRowMapper<>(${className_d}.class),m.values().toArray());
	}

    @Override
	public void  delete${className_d}(${className_d} ${className_x}){
    	StringBuilder s=new StringBuilder();
		String select = "delete  from ${className} ";
        Map<String,Object> m=map(${className_x});
        s.append(select);
        String where = "where 1=1 " + m.keySet().stream().map(t -> " and " + t + "=?").collect(Collectors.joining(" "));
        s.append(where);
		jdbcTemplate.update(s.toString(),m.values().toArray());
	}

	private static Map<String,Object> map(${className_d} ${className_x}) {
		Map<String,Object> map=new HashMap();
		<#list tableCarrays as tableCarray>
			<#if tableCarray.carrayType=="String">
				if (!Strings.isNullOrEmpty(${className_x}.get${tableCarray.carrayName_d}())) {
					map.put("${tableCarray.carrayName}",${className_x}.get${tableCarray.carrayName_d}());
				}
			<#else>
				if (${className_x}.get${tableCarray.carrayName_d}() != null) {
					map.put("${tableCarray.carrayName}",${className_x}.get${tableCarray.carrayName_d}());
				}
			</#if>
		</#list>
		return map;
	}
	private Integer count(String where,Object[] objects) {
		String sql = "select count(*) from ${className} " + where;
		return jdbcTemplate.queryForObject(sql, Integer.class,objects);
	}

    @Override
	public ${className_d} get(Long ${key_x}){
		try{
    		return jdbcTemplate.queryForObject("select * from ${className} where id = ?",new BeanPropertyRowMapper<>(${className_d}.class),${key_x});
    	}catch (EmptyResultDataAccessException e){
			return null;
		}
	}
}
