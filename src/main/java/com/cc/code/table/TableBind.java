package com.cc.code.table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 表的主外键关系
 * @author bigcong
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TableBind {
	/**
	 * // 键名称
	 */
	private String keyName;
	/**
	 * // 键类型
	 */
	private String keyType;
	/**
	 * // 大写表名称
	 */
	private String tableName_d;
	/**
	 * // 小写表名称
	 */
	private String tableName_x;
	/**
	 * // 大写字段名称
	 */
	private String carrayName_d;
	/**
	 *小写字段名称
	 */
	private String carrayName_x;
}
