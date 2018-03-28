package ${packageName}.entity;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

/**
 * ${className}
 * @author lilaizhen
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ${className_d}{

    <#--列出所有的字段 -->
	<#list tableCarrays as tableCarray>
	/**
	   ${tableCarray.remark}
	 */
	private ${tableCarray.carrayType} ${tableCarray.carrayName_x};
	</#list>
}
