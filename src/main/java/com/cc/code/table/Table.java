package com.cc.code.table;

import lombok.Data;

import java.util.List;
import java.util.Set;

/**
 * @author bigcong
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

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getClassName_d() {
        return className_d;
    }

    public void setClassName_d(String className_d) {
        this.className_d = className_d;
    }

    public String getClassName_x() {
        return className_x;
    }

    public void setClassName_x(String className_x) {
        this.className_x = className_x;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public List<TableCarray> getTableCarrays() {
        return tableCarrays;
    }

    public void setTableCarrays(List<TableCarray> tableCarrays) {
        this.tableCarrays = tableCarrays;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getKey_x() {
        return key_x;
    }

    public void setKey_x(String key_x) {
        this.key_x = key_x;
    }

    public String getKey_d() {
        return key_d;
    }

    public void setKey_d(String key_d) {
        this.key_d = key_d;
    }

    public List<TableIndex> getTableIndexs() {
        return tableIndexs;
    }

    public void setTableIndexs(List<TableIndex> tableIndexs) {
        this.tableIndexs = tableIndexs;
    }

    public List<TableBind> getTableBinds() {
        return tableBinds;
    }

    public void setTableBinds(List<TableBind> tableBinds) {
        this.tableBinds = tableBinds;
    }

    public Set<String> getImportPojos() {
        return importPojos;
    }

    public void setImportPojos(Set<String> importPojos) {
        this.importPojos = importPojos;
    }

    public String getStringCarrayNames1() {
        return stringCarrayNames1;
    }

    public void setStringCarrayNames1(String stringCarrayNames1) {
        this.stringCarrayNames1 = stringCarrayNames1;
    }

    public String getStringCarrayNames2() {
        return stringCarrayNames2;
    }

    public void setStringCarrayNames2(String stringCarrayNames2) {
        this.stringCarrayNames2 = stringCarrayNames2;
    }

    public String getStringCarrayNames3() {
        return stringCarrayNames3;
    }

    public void setStringCarrayNames3(String stringCarrayNames3) {
        this.stringCarrayNames3 = stringCarrayNames3;
    }

    public String getStringCarrayNames4() {
        return stringCarrayNames4;
    }

    public void setStringCarrayNames4(String stringCarrayNames4) {
        this.stringCarrayNames4 = stringCarrayNames4;
    }

    public String getStringCarrayNames5() {
        return stringCarrayNames5;
    }

    public void setStringCarrayNames5(String stringCarrayNames5) {
        this.stringCarrayNames5 = stringCarrayNames5;
    }

    public String getStringCarrayNames6() {
        return stringCarrayNames6;
    }

    public void setStringCarrayNames6(String stringCarrayNames6) {
        this.stringCarrayNames6 = stringCarrayNames6;
    }

    public String getStringCarrayNames7() {
        return stringCarrayNames7;
    }

    public void setStringCarrayNames7(String stringCarrayNames7) {
        this.stringCarrayNames7 = stringCarrayNames7;
    }

    public String getStringCarrayNames8() {
        return stringCarrayNames8;
    }

    public void setStringCarrayNames8(String stringCarrayNames8) {
        this.stringCarrayNames8 = stringCarrayNames8;
    }


}
