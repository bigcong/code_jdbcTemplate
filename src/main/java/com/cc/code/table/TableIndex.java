package com.cc.code.table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

/**
 * 表的索引
 * 
 * @author bigcong
 * 
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TableIndex {
	/**
	 * // 索引名称
	 */
	private String indexName;
	/**
	 * // 原关联字段
	 */
	private List<String> carrayNames;
	/**
	 * // 大写关联字段
	 */
	private List<String> carrayNames_d;
	/**
	 * // 小写关联字段
	 */
	private List<String> carrayNames_x;
	/**
	 * // 原字段+小写字段
	 */
	private List<Map<String, String>> carrayNameMaps;
	/**
	 * // 直接拼接大写字段
	 */
	private String stringCarrayNames1;
	/**
	 * // ","拼接大写字段
	 */
	private String stringCarrayNames2;
	/**
	 * // 类型+ ","拼接大写字段
	 */
	private String stringCarrayNames3;
	/**
	 * // ","拼接小写字段
	 */
	private String stringCarrayNames4;
	/**
	 * // sqlMap中sql用的 原字段-小写字段
	 */
	private String stringCarrayNames5;
	/**
	 *  // 是否唯一索引
	 */
	private boolean unique;
}
