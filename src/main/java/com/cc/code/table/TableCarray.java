package com.cc.code.table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 表字段
 *@author bigcong
 * 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TableCarray {
	/**
	 *  // 原名称
	 */
	private String carrayName;
	/**
	 * // 首字母大写
	 */
	private String carrayName_d;
	/**
	 * // 首字母小写
	 */
	private String carrayName_x;
	/**
	 * // 字段类型
	 */
	private String carrayType;
	/**
	 *  //字段注释
	 */
	private String remark;

}
