package ${packageName}.entity;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

/**
 * ${className}
 * @author lilaizhen
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class ${className_d} extends Page{

    <#--列出所有的字段 -->
	<#list tableCarrays as tableCarray>
	/**
	   ${tableCarray.remark}
	 */
	private ${tableCarray.carrayType} ${tableCarray.carrayName_x};
	</#list>
}
