package com.cc.code.connection;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 
 * @author bigcong
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DataSourceConfig {
	public String driver;
	public String url;
	public String user;
	public String pass;
	public int dataSourceType;

	public static final int MYSQL = 1;
	public static final int SQLSERVER = 2;
}
