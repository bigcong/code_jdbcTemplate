
${r'<#include "../fragments/header.ftl"/>'}
<section id="content_wrapper">
    <header id="topbar">
        <div class="topbar-left">
            <ol class="breadcrumb">
                <li class="crumb-active">币种管理</li>
                <li class="crumb-icon"><span class="glyphicon glyphicon-home"></span></li>
                <li class="crumb-link"><a href="admin/index">首页</a></li>
                <li class="crumb-trail">币种管理</li>
                <li class="crumb-trail">币种行为设置</li>
            </ol>
            <ol>
            </ol>
        </div>
    </header>
    <div id="content">
        <div class="panel panel-info" id="p5" data-panel-color="panel-info" data-panel-fullscreen="false"
             data-panel-title="false" data-panel-remove="false" data-panel-collapse="false">
            <div class="panel-heading ui-sortable-handle">
                <span class="panel-title">币种提现限制</span>
                <span class="panel-controls"><a href="#" class="panel-control-loader"></a></span></div>
            <div class="panel-body">


                <div class="panel" id="spy4">
                    <div class="panel-body pn">
                        <form action="list" method="post" name="${className_x}Form" id="${className_x}Form">
                            <input type="hidden" name="start" id="start" value="1">
                        <#list tableCarrays as tableCarray>
                            <input type="text" name="${tableCarray.carrayName_x}" id="${tableCarray.carrayName_x}"
                                   class="w110 h-25"
                                   placeholder="${tableCarray.remark}"/>
                        </#list>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" id="seach" onclick="search();">
                                    查询
                                </button>

                                <a class="btn btn-primary" href="load">增加</a>

                            </div>

                        </form>


                        <div class="table-responsive">
                            <table class="table table-bordered mbn table-hover">
                                <thead>

                                <tr>
                                <tr class="main_head">
                                <#list tableCarrays as tableCarray>
                                    <th>${tableCarray.remark}</th>
                                </#list>
                                    <th>操作</th>
                                </tr>

                                </tr>
                                </thead>
                                <tbody id="back-data" style="table-layout:fixed">
                                </tbody>
                            </table>
                            <div class="dt-panelfooter clearfix">
                                <div aria-live="polite" role="status" id="goodsListPage" class="dataTables_info">
                                </div>
                                <div id="datatable5_paginate" class="dataTables_paginate paging_simple_numbers">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</section>
<div id="dtBox"></div>


<script id="paramList" type="text/html">
    {{# for(var i = 0, len = paramList.length; i < len; i++){ }}
    <tr class="message-unread">
    <#list tableCarrays as tableCarray>
    <td style="text-align: center"> {{paramList[i].${tableCarray.carrayName_x}}}</td>


    </#list>
        <td>
            <a href="load?${key_x}={{paramList[i].${key_x} }}">修改</a>
            | <a href="javascript:del${className_d}('{{paramList[i].${key_x} }}');">删除</a>
        </td>

    </tr>
    {{# } }}
</script>


<script type="application/javascript">
    var layer, laytpl, laypage;
    layui.use(['laytpl', 'laypage', 'layer'], function () {
        laytpl = layui.laytpl;
        laypage = layui.laypage;
        layer = layui.layer;
        search()


    });


    //查询
    function search() {
        var curr=$("#start").val();
        $.ajax({
            url: "list",
            data:  $("#${className_x}Form").serialize(),
            method: 'post',
            success: function (data) {
                $("#goodsListPage").html("当前在第" + curr + "页/共" + data.totalPage + "页（" + data.total + "条记录)");
                paramList = data.list;
                var gettpl = document.getElementById('paramList').innerHTML;
                laytpl(gettpl).render(data, function (html) {
                    $("#back-data").html(html);
                });
                laypage({
                    cont: $("#datatable5_paginate"), //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
                    pages: data.totalPage, //通过后台拿到的总页数
                    curr: curr, //当前页
                    jump: function (obj, first) { //触发分页后的回调
                        if (!first) { //点击跳页触发函数自身，并传递当前页：obj.curr
                            $("#start").val(obj.curr);

                            search();
                        }
                    }
                });

            }
        });


    }
    function del${className_d}(${className_x}Id) {
        if (confirm("确定要删除该记录？")) {
            var url = "delete?${key_x}=" + ${className_x}Id;
            $.get(url, function(data) {
                search()
            });
        }
    }








</script>


${r'<#include "../fragments/footer.ftl"/>'}