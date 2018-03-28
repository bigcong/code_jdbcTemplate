package com.cc.code.generator;

import com.cc.code.connection.ConnectionFactory;
import com.cc.code.connection.DataSourceConfig;
import com.cc.code.fileWriter.FileWriterFactory;
import com.cc.code.table.Table;
import com.cc.code.util.TableUtil;
import freemarker.template.Configuration;

import java.sql.Connection;
import java.util.List;

/**
 * @author bigcong
 */
public class Generator {

    private String packageName;


    private String[] tableNames;
    private String url;

    private DataSourceConfig cfg;

    /**
     * @throws Exception
     */
    public Generator(String packageName, DataSourceConfig cfg, String url) {
        super();
        this.packageName = packageName;
        this.cfg = cfg;
        this.url = url;
    }

    /**
     * @throws Exception
     */
    public Generator(String[] tableNames, String packageName, DataSourceConfig cfg, String url) {
        super();
        this.packageName = packageName;
        this.tableNames = tableNames;
        this.cfg = cfg;
        this.url = url;
    }

    /**
     * {方法功能中文描述}
     *
     * @param entity
     * @param controller
     * @param dao
     * @param service
     * @param serviceImpl
     * @param daoImpl
     * @throws Exception
     * @author: cuicong
     * @datetime:2015年9月15日下午3:25:45
     */
    public void generate(boolean entity, boolean controller, boolean dao, boolean service, boolean serviceImpl,
                         boolean daoImpl)

            throws Exception {

        //获得数据库连接
        Connection conn = ConnectionFactory.getConnection(cfg);

        //获取所有的表名
        List<Table> tables = TableUtil.getTables(conn, packageName, tableNames);

        //获取模板
        Configuration configuration = FileWriterFactory.getConfiguration("");

        for (Table table : tables) {
            if (entity) {
                buildFactory(table, configuration, FileWriterFactory.POJO);
            }
            if (controller) {
                buildFactory(table, configuration, FileWriterFactory.CONTROLLER);
            }
            if (dao) {
                buildFactory(table, configuration, FileWriterFactory.MAPPER);
            }
            if (daoImpl) {
                buildFactory(table, configuration, FileWriterFactory.SQLXML);
            }
            if (service) {
                buildFactory(table, configuration, FileWriterFactory.SERVICE);
            }
            if (serviceImpl) {
                buildFactory(table, configuration, FileWriterFactory.SERVICE_IMPL);
            }
        }
        System.err.println("祝贺你,生成成功！");
    }

    /**
     *
     */
    public void buildFactory(Table table, Configuration configuration, int type) {
        String templateUrl = "";
        switch (type) {
            case FileWriterFactory.POJO:
                templateUrl = "entity.ftl";
                break;
            case FileWriterFactory.CONTROLLER:
                templateUrl = "controller.ftl";
                break;
            case FileWriterFactory.MAPPER:
                templateUrl = "dao.ftl";
                break;
            case FileWriterFactory.SERVICE:
                templateUrl = "service.ftl";
                break;
            case FileWriterFactory.SERVICE_IMPL:
                templateUrl = "serviceImp.ftl";
                break;
            case FileWriterFactory.SQLXML:
                templateUrl = "daoImpl.ftl";
                break;
        }
        build(table, configuration, templateUrl, type);
    }

    /**
     * @param table
     * @param configuration
     */
    public void build(Table table, Configuration configuration, String templateUrl, int type) {
        FileWriterFactory.dataSourceOut(configuration, // 解析对象
                templateUrl, //模板名称
                table, //数据对象
                type, url);
    }

}
