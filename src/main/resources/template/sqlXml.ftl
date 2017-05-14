package ${packageName}.dao.impl;

import ${packageName}.dao.${className_d}Dao;
import ${packageName}.entity.${className_d};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.*;

import org.springframework.stereotype.Repository;

import java.util.*;
import java.util.stream.*;
/**
* ${className}
*/
@Repository
public class ${className_d}DaoImpl implements ${className_d}Dao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public List<${className_d}> listPage${className_d}(${className_d} ${className_x}) {
		StringBuffer s=new StringBuffer();
		String select = "select ${stringCarrayNames3} from ${className} ";
		s.append(select );
        Map<String,Object> m=map(${className_x});
        String where = "where 1=1 " + m.keySet().stream().map(t -> " and" + t + "=?").collect(Collectors.joining(" "));
		${className_x}.setTotal(count(where,m.values().toArray()));
		s.append(where);
		String limit = " limit " + ${className_x}.getStart() + "," + ${className_x}.getSize();
		s.append(limit);
		RowMapper<${className_d}> rowMapper = new BeanPropertyRowMapper<${className_d}>(${className_d}.class);
		List<${className_d}> list = jdbcTemplate.query(s.toString(), rowMapper,m.values().toArray());

		return list;
	}



    @Override
    public void insertSelective(${className_d} ${className_x}) {
		StringBuffer s = new StringBuffer();
		s.append("insert into ${className}(");
        Map<String, Object> m = map(${className_x});
        s.append(String.join(",", m.keySet()));
        s.append(") values (");
        s.append(String.join("?", m.keySet()));
        s.append(")");
        System.out.println(s.toString());
        jdbcTemplate.update(s.toString(), m.values().toArray());
	}

    @Override
    public void updateByPrimaryKeySelective(${className_d} ${className_x}) {
		StringBuffer s = new StringBuffer();
		s.append("update ${className} set ");
        Map<String, Object> m = map(${className_x});
        String update = m.keySet().stream().map(t -> t + "=?").collect(Collectors.joining(","));
        s.append(update);
        System.out.println(update);
        s.append(" where 	${key}=" + ${className_x}.get${key_d}());
        jdbcTemplate.update(s.toString(), m.values().toArray());

	}



    @Override
    public List<${className_d}> list${className_d}(${className_d} ${className_x}) {
        StringBuffer s=new StringBuffer();
        String select = "select ${stringCarrayNames3} from ${className} ";
        s.append(select );
        Map<String,Object> m=map(${className_x});
        String where = "where 1=1 " + m.keySet().stream().map(t -> " and" + t + "=?").collect(Collectors.joining(" "));
        s.append(where);
        RowMapper<${className_d}> rowMapper = new BeanPropertyRowMapper<${className_d}>(${className_d}.class);
        List<${className_d}> list = jdbcTemplate.query(s.toString(), rowMapper,m.values().toArray());

        return list;
	}
	public void  delete${className_d}(${className_d} ${className_x}){
		StringBuffer s=new StringBuffer();
		String select = "delete  from ${className} ";
        Map<String,Object> m=new HashMap();
        s.append(select);
        String where = "where 1=1 " + m.keySet().stream().map(t -> " and" + t + "=?").collect(Collectors.joining(" "));
        s.append(where);
		jdbcTemplate.update(s.toString(),m.values().toArray());

	}
	private static Map<String,Object> map(${className_d} ${className_x}) {
		Map<String,Object> map=new HashMap();
<#list tableCarrays as tableCarray>
	<#if tableCarray.carrayType=="String">
    	if (${className_x}.get${tableCarray.carrayName_d}() != null && !${className_x}.get${tableCarray.carrayName_d}().equals("")) {
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




}
