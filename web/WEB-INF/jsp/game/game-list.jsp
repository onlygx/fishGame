<%--
  Created by IntelliJ IDEA.
  User: GaoXiang
  Date: 2016/1/7 0007
  Time: 下午 12:06
  To change this template use File | Settings | File Templates.
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
    <title>比赛列表</title>
    <link rel="stylesheet" href="/static/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/datatables.min.css">
    <link rel="stylesheet" href="/static/css/my.css">

    <script src="/static/js/jquery-1.11.3.js"></script>
    <script src="/static/js/bootstrap/bootstrap.min.js"></script>
    <script src="/static/js/datatables.min.js"></script>
    <script src="/static/js/tools.js"></script>
</head>
<body>
<jsp:include page="../navbar.jsp"></jsp:include>

<div class="container" >


    <div >
        <h2>比赛列表</h2>
        <button class="btn btn-info" data-toggle="modal" data-target="#myModal">添加比赛</button>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>比赛</th>
                <th>时间</th>
                <th>场次数量</th>
                <th>主办</th>
                <th>承办</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="item" items="${list}" varStatus="status" >

                <tr>
                    <td  scope="row">${item.name}</td>
                    <td class="rate-time"><fmt:formatDate value="${item.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td class="rate-value">${item.childCount}</td>
                    <td  scope="row">${item.zhuban}</td>
                    <td class="rate-value">${item.chengban}</td>
                    <td>
                        <a href="/game/${item.id}">查看/编辑</a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="/game/grade/${item.id}">查看成绩/抽奖</a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0);" onclick="delGame('${item.id}')">删除</a>
                    </td>
                </tr>

            </c:forEach>

            </tbody>
        </table>
    </div>
</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加比赛信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">比赛名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="name" placeholder="比赛名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">主办方</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="zhuban" placeholder="主办方名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">承办方</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="chengban" placeholder="承办方名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" style="height: 100px;" name="intro" placeholder="备注信息..."></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="save()">保存</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    function save(){

        var param = tools.formParams("myModal");
        tools.action("/game/save",param,function(data){
            tools.tip(data,{1:"操作失败！"});
            location.reload();
        })
    }


    function delGame(id){
        if(!confirm("确定删除么？")){
            return;
        }
        tools.action("/game/delete",{"id":id},function(data){
            tools.tip(data,{1:"操作失败！"});
            location.reload();
        })

    }

</script>