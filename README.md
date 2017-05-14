# 本项目为spring boot+jdbcTemplate,生成基本的增删改查方法

## 使用方法
1. 配置gradle环境，导入项目，刷新依赖
2. 打开com.cc.code.build下的build文件，在generator方法填入必要参数,例如：
```
    public static void generator() throws Exception {
            // 得到数据源
            DataSourceConfig cfg = new DataSourceConfig("com.mysql.jdbc.Driver", "jdbc:mysql://loalhost:3306/cc",
                    "root", "cc", DataSourceConfig.MYSQL);
            /**
             * 第一个参数:选择你要生成的表名,此参数可选。不写默认生成全部
             * 第二个参数:生成的文件的作存放的包名
             * 第三个参数:数据源配置
             * 第四个参数:生成目标文件的位置
             */
            Generator generator = new Generator(new String[]{"cc",}, "com.cc", cfg, "/Users/cong/cc/generate");
            generator.generate(true, true, true, true, true, true, true, true, true);
    
     }
```
3. 运行main方法，cd进入生成目标文件的位置（cd /Users/cong/cc/generate），将生成的文件复制到自己的项目工程中

4. entity包下的继承的Page，为分页对象，可自行配置，例如：
```
package com.cc.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Created by cong on 2017/5/5.
 */
public class Page {


    @JsonIgnore
    Integer start = 0;
    /**
     * 每页多少条
     */
    @JsonIgnore
    Integer size = 20;
    /**
     *共多少条
     */
    @JsonIgnore
    Integer total = 0;




    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }
}


```

5. have fun

    


