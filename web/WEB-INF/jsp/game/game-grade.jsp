<%--
  Created by IntelliJ IDEA.
  User: GaoXiang
  Date: 2016/1/8 0008
  Time: 上午 10:01
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>比赛成绩/抽奖</title>
    <link rel="stylesheet" href="/static/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/datatables.min.css">
    <link rel="stylesheet" href="/static/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/icheck/skins/all.css">
    <link rel="stylesheet" href="/static/css/my.css">

    <script src="/static/js/jquery-1.11.3.js"></script>
    <script src="/static/js/bootstrap/bootstrap.min.js"></script>
    <script src="/static/js/datatables.min.js"></script>
    <script src="/static/js/dataTables.bootstrap.min.js"></script>
    <script src="/static/js/jquery.qrcode.js"></script>
    <script src="/static/js/qrcode.js"></script>
    <script src="/static/js/icheck.min.js"></script>
    <script src="/static/js/tools.js"></script>

</head>
<body>
<jsp:include page="../navbar.jsp"></jsp:include>
<div class="jumbotron">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div id="erweima"></div>
            </div>
            <div class="col-md-9">
                <h1>${obj.name}</h1>
                <p>${obj.intro}</p>
                <label class="label label-info"> 主办方：${obj.zhuban}</label>
                <br><br>
                <label class="label label-success"> 承办方：${obj.chengban}</label>
            </div>
        </div>
    </div>
</div>
<div class="container">

    <div>
        <h3>所有人员总成绩</h3>
        <di style="padding-bottom: 50px;">
            <button class="btn btn-info" onclick="luck()">抽奖</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中奖用户：<span id="luckResoult">点击抽奖开始抽奖...</span>
        </di>

        <table id="tableAll" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>选择</th>
                <th>编号</th>
                <th>姓名</th>
                <th>电话</th>
                <th>总尾数</th>
                <th>总重量</th>
                <th>身份</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${persons}" varStatus="status" >

                <tr>
                    <td  >
                        <input type="checkbox" id="p_${item.id}" name="persons" value="${item.id}">

                    </td>
                    <td  >${item.id} </td>
                    <td id="n_${item.id}">${item.name} </td>
                    <td >${item.phone} </td>
                    <td >${item.number} </td>
                    <td >${item.weight} </td>
                    <td >
                        <c:if test="${item.type == 1}">
                            <label class="label label-success">裁判长</label><br><br>
                        </c:if>
                        <c:if test="${item.type == 2}">
                            <label class="label label-warning">裁判</label><br><br>
                        </c:if>
                        <c:if test="${item.type == 3}">
                            <label class="label label-info">参赛者</label><br><br>
                        </c:if>
                    </td>
                    <td >${item.intro} </td>
                    <td>
                        <a href="javascript:void(0);" onclick="delPerson('${item.id}')">删除</a>

                    </td>
                </tr>

            </c:forEach>
            </tbody>
        </table>

        <h3>场次成绩</h3>
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <c:forEach var="item" items="${child}" varStatus="status">
                <li role="presentation" class="${status.count==1?'active':''}">
                    <a href="#tab_${item.id}" aria-controls="tab_${item.id}" role="tab" data-toggle="tab">
                            ${item.name}
                    </a>
                </li>
            </c:forEach>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <c:forEach var="item" items="${child}" varStatus="status">
                <div role="tabpanel" class="tab-pane ${status.count==1?'active':''}" id="tab_${item.id}">
                    <table class="table ">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>尾数</th>
                            <th>重量</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item2" items="${item.personList}" varStatus="status">

                            <tr>
                                <td scope="row">${item2.name} </td>
                                <td class="rate-time ">${item2.number} </td>
                                <td class="rate-value"><c:out value="${item2.weight}"/></td>
                                <td>
                                    <a href="javascript:void(0);" onclick="delPerson('${item2.id}')">删除</a>

                                </td>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:forEach>
        </div>

    </div>

</div>
</body>
</html>
<script>
    (function ($) {
        jQuery('#erweima').qrcode({
            text : "<%=request.getRemoteAddr()%>,${obj.id}",
            width: 230,
            height: 230
        });

        $("#tableAll").DataTable({
            "aLengthMenu": [[100, 200, 300, -1],[100, 200, 300, "全部"]],
            "oLanguage": {//语言设置
                "sLengthMenu": "每页显示  _MENU_ 条记录",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                },
                "sZeroRecords": "抱歉， 没有找到",
                "sInfoEmpty": "没有数据"
            }
        });
    })(jQuery);

    function luck(){
        var pers = new Array();
        $('input[name="persons"]:checked').each(function(){
            pers.push($(this).val());
        });
        var random = parseInt(Math.random()*pers.length);
        var id = pers[random];
        var name = $("#n_"+id).text();
        $("#luckResoult").text(name);
        $("#p_"+id).attr("checked",false);
    }

    function delPerson(id){
        if(!confirm("确定删除么？")){
            return;
        }
        tools.action("/person/delete",{id:id},function(data){
            tools.tip(data,{1:"操作失败！"});
            location.reload();
        })
    }
</script>