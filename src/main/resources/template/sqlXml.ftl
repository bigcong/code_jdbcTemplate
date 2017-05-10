package ${packageName}.dao.impl;

import ${packageName}.dao.${className_d}Dao;
import ${packageName}.entity.${className_d};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.*;

import org.springframework.stereotype.Repository;

import java.util.*;

/**
* Created by cong on 2017/5/4.
*/
@Repository
public class ${className_d}DaoImpl implements ${className_d}Dao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public List<${className_d}> listPage${className_d}(${className_d} ${className_x}) {
		StringBuffer s=new StringBuffer();
		String select = "select ${stringCarrayNames3} from ${className} ";
		s.append(select);
		String where=where(${className_x});
		${className_x}.setTotal(count(where));
		s.append(where);
		String limit = " limit " + ${className_x}.getStart() + "," + ${className_x}.getSize();
		s.append(limit);
		RowMapper<${className_d}> rowMapper = new BeanPropertyRowMapper<${className_d}>(${className_d}.class);
		List<${className_d}> list = jdbcTemplate.query(s.toString(), rowMapper);

		return list;
	}



    @Override
    public void insertSelective(${className_d} ${className_x}) {
		Map<String,String> map=new HashMap<>();
		StringBuffer s = new StringBuffer();
		s.append("insert into ${className}(");
		<#list tableCarrays as tableCarray>
		<#if tableCarray.carrayType=="String">
        if (${className_x}.get${tableCarray.carrayName_d}() != null && !${className_x}.get${tableCarray.carrayName_d}().equals("")) {
			map.put("${tableCarray.carrayName}","'" + ${className_x}.get${tableCarray.carrayName_d}()+"'");
        }
		<#else>
        if (${className_x}.get${tableCarray.carrayName_d}() != null) {
			map.put("${tableCarray.carrayName}",  ${className_x}.get${tableCarray.carrayName_d}()+"");
        }
		</#if>
	</#list>
		for (String key : map.keySet()) {
			s.append(key + ",");
		}
		s.append(") values (");
		for (String key : map.values()) {
			s.append(key + ",");
		}
		s.append(")");
		System.out.println(s.toString());
		String sql = s.toString().replace(",)", ")");
		System.out.println(sql);
		jdbcTemplate.update(sql);


	}

    @Override
    public void updateByPrimaryKeySelective(${className_d} ${className_x}) {
		StringBuffer s = new StringBuffer();
		s.append("update ${className} set ");


<#list tableCarrays as tableCarray>
	<#if tableCarray.carrayType=="String">
    	if (${className_x}.get${tableCarray.carrayName_d}() != null && !${className_x}.get${tableCarray.carrayName_d}().equals("")) {
    		s.append("${tableCarray.carrayName}='" + ${className_x}.get${tableCarray.carrayName_d}()+"',");
    	}
	<#else>
    	if (${className_x}.get${tableCarray.carrayName_d}() != null) {
    		s.append(" ${tableCarray.carrayName}=" + ${className_x}.get${tableCarray.carrayName_d}()+",");
    	}
	</#if>
</#list>
		s.append(" where 	#{key}="=${className_x}.get#{key_d});
		System.out.println(s.toString());
		String sql = s.toString().replace(", where", " where");
		jdbcTemplate.update(sql);



	}



    @Override
    public List<${className_d}> list${className_d}(${className_d} ${className_x}) {
		StringBuffer s=new StringBuffer();
		String select = "select ${stringCarrayNames3} from ${className} ";
		s.append(select);
		s.append(where(${className_x}));
		RowMapper<${className_d}> rowMapper = new BeanPropertyRowMapper<${className_d}>(${className_d}.class);
    	List<${className_d}> list = jdbcTemplate.query(s.toString(), rowMapper);

        return list;
	}
	public void  delete${className_d}(${className_d} ${className_x}){
		StringBuffer s=new StringBuffer();
		String select = "delete  from ${className} ";
		s.append(select);
		s.append(where(${className_x}));
		jdbcTemplate.update(s.toString());

	}
	private static String where(${className_d} ${className_x}) {
		StringBuffer s = new StringBuffer();
		s.append(" where 1=1");
<#list tableCarrays as tableCarray>
	<#if tableCarray.carrayType=="String">
    	if (${className_x}.get${tableCarray.carrayName_d}() != null && !${className_x}.get${tableCarray.carrayName_d}().equals("")) {
    		s.append("	and ${tableCarray.carrayName}='" + ${className_x}.get${tableCarray.carrayName_d}()+"'");
    	}
	<#else>
    	if (${className_x}.get${tableCarray.carrayName_d}() != null) {
    		s.append("	and ${tableCarray.carrayName}=" + ${className_x}.get${tableCarray.carrayName_d}()+"");
    	}
	</#if>
</#list>
		return s.toString();

	}
	private Integer count(String where) {
		String sql = "select count(*) from ${className}" + where;
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}




}
