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
    <title>比赛详情</title>
    <link rel="stylesheet" href="/static/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/bootstrap/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="/static/css/datatables.min.css">
    <link rel="stylesheet" href="/static/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/icheck/skins/all.css">
    <link rel="stylesheet" href="/static/css/my.css">

    <script src="/static/js/jquery-1.11.3.js"></script>
    <script src="/static/js/bootstrap/bootstrap.min.js"></script>
    <script src="/static/js/bootstrap/bootstrap-datetimepicker.js"></script>
    <script src="/static/js/bootstrap/bootstrap-datetimepicker.zh-CN.js"></script>

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

    <h3>场次管理</h3>
    <div>
        <button class="btn btn-info" data-toggle="modal" data-target="#gameModal">添加场次</button>
        <a  class="btn btn-info" href="/game/grade/${obj.id}">查看成绩</a>
    </div>
    <div style="margin-top: 20px;">
        <table  class="table  table-bordered"  width="100%">
            <thead>
            <tr>
                <th>场次</th>
                <th>开始时间</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${child}" varStatus="status" >

                <tr>
                    <td >${item.name}</td>
                    <td ><fmt:formatDate value="${item.time}" type="both"/> </td>
                    <td >${item.intro} </td>
                    <td>
                        <a href="javascript:void(0);" onclick="delGame('${item.id}')">删除</a>

                    </td>
                </tr>

            </c:forEach>
            </tbody>
        </table>

    </div>



    <h3>钓区管理</h3>
    <div>
        <button class="btn btn-info" data-toggle="modal" data-target="#roomModal">添加钓区</button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;颜色区分：
        <span class="label label-success">裁判长</span>
        <span class="label label-warning">裁判</span>
        <span class="label label-info">参赛者</span>

    </div>
    <div class="row">
    <c:forEach var="item" items="${rooms}" varStatus="status" >
        <div class="col-md-3 room">
            <input type="hidden" name="rooms" value="${item.id}">
            <h2>${item.name} </h2>
            <a style="float: right;" href="javascript:delRoom('${item.id}')">删除</a>
            <span>${item.intro}</span>
            <br><br>
            <c:forEach var="item2" items="${item.personList}" varStatus="status" >

                <c:if test="${item2.type == 1}">
                    <label class="label label-success">${item2.name}</label>
                </c:if>
                <c:if test="${item2.type == 2}">
                    <label class="label label-warning">${item2.name}</label>
                </c:if>
                <c:if test="${item2.type == 3}">
                    <label class="label label-info">${item2.name}</label>
                </c:if>
                <br><br>

            </c:forEach>
        </div>
    </c:forEach>



    </div>
    <div>
        <h3>人员管理</h3>
        <div style="margin-top: 20px;margin-bottom: 20px;">
            <button class="btn btn-info" data-toggle="modal" data-target="#personModal">添加人员</button>
            <button class="btn btn-info" onclick="resetRoom()">自动分配钓区</button>
        </div>

        <table id="tableAll" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>电话</th>
                <th>身份</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${persons}" varStatus="status" >

                <tr>
                    <td >${item.id}
                        <input type="hidden" p-type="${item.type}" name="persons" value="${item.id}">
                    </td>
                    <td >${item.name} </td>
                    <td >${item.phone} </td>
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
                        &nbsp;&nbsp;
                        <a href="/person/${item.id}" >查看/打印</a>
                    </td>
                </tr>

            </c:forEach>
            </tbody>
        </table>

    </div>

</div>

<div class="modal fade" id="gameModal" tabindex="-1" role="dialog" aria-labelledby="gameModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gameModalLabel">添加场次</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <input type="hidden" name="parentId" value="${obj.id}">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">场次名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="name" placeholder="场次名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">开始时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control datetime" name="time" placeholder="开始时间">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" style="height: 100px;" name="intro" placeholder="备注信息..."></textarea>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="saveGame()">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="roomModal" tabindex="-1" role="dialog" aria-labelledby="roomModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="roomModalLabel">添加钓区</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <input type="hidden" name="gameId" value="${obj.id}">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">钓区名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="name" placeholder="钓区名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" style="height: 100px;" name="intro" placeholder="备注信息..."></textarea>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="saveRoom()">保存</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="personModal" tabindex="-1" role="dialog" aria-labelledby="personModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="personModalLabel">添加人员</h4>
            </div>
            <div class="modal-body" >
                <form class="form-horizontal">
                    <input type="hidden" name="gameId" value="${obj.id}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">身份</label>
                        <div class="col-sm-10">
                            <input type="radio" id="type1" name="type" value="1">&nbsp;
                            <label for="type1" class="">裁判长</label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="type2" name="type" value="2">&nbsp;
                            <label for="type2" class="">裁判</label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="type3" name="type"  value="3" checked>&nbsp;
                            <label for="type3" class="">参赛者</label>&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">钓区</label>
                        <div class="col-sm-10">
                            <input type="radio" id="room0" name="roomId"  value="" checked>&nbsp;
                            <label for="room0" >稍后分配</label>&nbsp;&nbsp;&nbsp;&nbsp;<br>
                            <c:forEach var="item" items="${rooms}" varStatus="status" >
                                <input type="radio" id="type_${item.id}"  value="${item.id}" name="roomId" >&nbsp;
                                <label for="type_${item.id}" >${item.name}</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                <br>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="name" placeholder="姓名/昵称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="phone" placeholder="手机号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">报名费</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="money" placeholder="报名费（整数），单位：元">
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
                <button type="button" class="btn btn-primary" onclick="savePerson()">保存</button>
            </div>
        </div>
    </div>
</div>
</body>

</html>
<script>
    (function($){


        jQuery('#erweima').qrcode({
            text : "<%=request.getRemoteAddr()%>,${obj.id}",
            width:230,
            height:230
        });

        $('input').iCheck({
            checkboxClass: 'iradio_square-red',
            radioClass: 'iradio_square-red',
            increaseArea: '20%' // optional
        });

        $(".datetime").datetimepicker({
            format: 'yyyy/mm/dd hh:ii:ss',
            autoclose: true,
            todayBtn: true,
            language: "zh-CN"
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


    function resetRoom(){
        var rooms = new Array();
        var pers = new Array();
        $('input[name="persons"]').each(function(){
            if($(this).attr("p-type")=="3"){
                pers.push($(this).val());
            }
        });
        $('input[name="rooms"]').each(function(){
            rooms.push($(this).val());
        });

        pers.sort(function(){ return 0.5 - Math.random() })

        tools.action("/person/updateAll",{
            "rooms":rooms.join(","),
            "persons":pers.join(",")
        },function(data){
            tools.tip(data,{1:"操作失败！"});
            location.reload();
        });
    }

    function saveRoom(){

        var param = tools.formParams("roomModal");
        tools.action("/room/save",param,function(data){
            tools.tip(data,{1:"操作失败！"});
            location.reload();
        })

    }

    function saveGame(){

        var param = tools.formParams("gameModal");
        param["time"] = new Date(param["time"].toString());
        tools.action("/game/save",param,function(data){
            tools.tip(data,{1:"操作失败！"});
            location.reload();
        })

    }

    function savePerson(){

        var param = tools.formParams("personModal");
        tools.action("/person/save",param,function(data){

            tools.tip(data,{1:"操作失败！"});
            if(!confirm("是否去打印参赛者信息？")){
                location.reload();
            }else{
                location.href="/person/"+data.data;
            }
        })
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

    function delGame(id){
        if(!confirm("确定删除么？")){
            return;
        }
        tools.action("/game/delete",{id:id},function(data){
            tools.tip(data,{1:"操作失败！"});
            location.reload();
        })
    }

    function delRoom(id){
        if(!confirm("确定删除么？")){
            return;
        }
        tools.action("/room/delete",{id:id},function(data){
            tools.tip(data,{1:"操作失败！"});
            location.reload();
        })
    }
</script>