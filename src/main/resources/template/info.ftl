
${r'<#include "../fragments/header.ftl"/>'}

<section id="content_wrapper">
    <div class="admin-form theme-primary">
        <div class="admin-form theme-primary">
            <div id="p1" class="panel heading-border panel-primary">
                <div class="panel-body bg-light">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">币种设置</h4>
                    </div>
                    <form method="post" action="" id="${className_x}Form">
                        <input type="hidden" name="${key_x}"   value="${r'<#if'} ${className_x}.${key_x}?exists>${r'$'}{${className_x}.${key_x}} ${r'</#if>'}" id="${key_x}"/>
                        <table class="table table-bordered table-hover">
                <#list tableCarrays as tableCarray>

                            <tr >
                                <th>${tableCarray.remark}:</th>
                                <td>
                                    <input  type="text" name="${tableCarray.carrayName_x}" value="${r'<#if'}  ${className_x}.${tableCarray.carrayName_x}?exists>${r'$'}{${className_x}.${tableCarray.carrayName_x}}    ${r'</#if>'}" id="${tableCarray.carrayName_x}" class="gui-input">
                                </td>
                            </tr>
                    </#list>

                            <tr>
                                <td colspan="2">

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" id="closeModal"
                                                onclick="history.back(-1);">返回
                                        </button>
                                        <button type="button" class="btn btn-primary"
                                                id="save" <#--onclick="history.back(-1);-->
                                        ">保存</button>
                                    </div>
                                </td>

                            </tr>


                        </table>


                    </form>

                </div>
            </div>
        </div>
    </div>

</section>
<script type="application/javascript">
    var layer, laytpl, laypage;
    layui.use(['laytpl', 'laypage', 'layer'], function () {
        laytpl = layui.laytpl;
        laypage = layui.laypage;
        layer = layui.layer;

        $("#save").click(function () {
            $.ajax({
                "url": 'save',
                "type": "POST",
                "data": $("#${className_x}Form").serialize(),
                "success": function (data) {

                    if (data.status == 200) {
                        alert("修改成功");
                        setTimeout(function () {
                            history.back(-1);
                        }, 300);
                    } else {
                        $.messager.alert("操作提示", "修改失败，请重试");
                    }
                }
            });
        });


    });


</script>
${r'<#include "../fragments/footer.ftl"/>'}








