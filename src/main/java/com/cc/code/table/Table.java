package com.cc.code.table;

import lombok.Data;

import java.util.List;
import java.util.Set;

/**
 * 
 * @author bigcong
 *
 */
@Data
public class Table {
    /**
     * 原表名称
     */
    private String className;
    /**
     * 大写表名称
     */
    private String className_d;
    /**
     * 小写表名称
     */
    private String className_x;
    /**
     *
     */
    private String packageName;
    /**
     * 表字段
     */
    private List<TableCarray> tableCarrays;
    /**
     *
     */
    private String key;
    /**
     * 主键小写
     */
    private String key_x;
    /**
     * 主键大写
     */
    private String key_d;
    /**
     * 表索引
     */
    private List<TableIndex> tableIndexs;
    /**
     * 表主外键
     */
    private List<TableBind> tableBinds;
    /**
     * 需要导入的POJO
     */
    private Set<String> importPojos;
    /**
     * ","拼接大写字段
     */
    private String stringCarrayNames1;
    /**
     * int id ,String userCord ,..
     */
    private String stringCarrayNames2;
    /**
     * // ","拼接原字段
     */
    private String stringCarrayNames3;
    /**
     * // "#%s#,"拼接小写字段
     */
    private String stringCarrayNames4;
    /**
     * // "%s=#%s#,"拼接原字段-小写字段
     */
    private String stringCarrayNames5;
    /**
     * // "%s=#%s#,"拼接原字段-小写字段
     */
    private String stringCarrayNames6;
    /**
     * // "%s=#%s#,"拼接原字段-小写字段
     */
    private String stringCarrayNames7;
    /**
     * //根据主键得到实体
     */
    private String stringCarrayNames8;

    public Table(String className, String classNameD, String classNameX, String packageName,
            List<TableCarray> tableCarrays, List<TableIndex> tableIndexs, List<TableBind> tableBinds,
            Set<String> importPojos, String stringCarrayNames1, String stringCarrayNames2, String stringCarrayNames3,
            String stringCarrayNames4, String stringCarrayNames5, String stringCarrayNames6, String stringCarrayNames7) {
        super();
        this.className = className;
        className_d = classNameD;
        className_x = classNameX;
        this.packageName = packageName;
        this.tableCarrays = tableCarrays;
        this.tableIndexs = tableIndexs;
        this.tableBinds = tableBinds;
        this.importPojos = importPojos;
        this.stringCarrayNames1 = stringCarrayNames1;
        this.stringCarrayNames2 = stringCarrayNames2;
        this.stringCarrayNames3 = stringCarrayNames3;
        this.stringCarrayNames4 = stringCarrayNames4;
        this.stringCarrayNames5 = stringCarrayNames5;

        this.stringCarrayNames6 = stringCarrayNames6;
        this.stringCarrayNames7 = stringCarrayNames7;
    }
}
