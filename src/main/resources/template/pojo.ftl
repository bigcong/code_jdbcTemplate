package ${packageName}.entity;
import java.io.Serializable;
import lombok.Data;

/**
 * ${className}
 * @author lilaizhen
 */
@Data
public class ${className_d}{

    <#--列出所有的字段 -->
	<#list tableCarrays as tableCarray>
	/**
	   ${tableCarray.remark}
	 */
	private ${tableCarray.carrayType} ${tableCarray.carrayName_x};
	</#list>
}
