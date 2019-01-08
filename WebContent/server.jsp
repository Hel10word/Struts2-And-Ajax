<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test</title>

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap-table.js"></script>
    <script type="text/javascript" src="js/bootstrap-table-zh-CN.js"></script>
    
    <link type="text/css" rel="stylesheet" href="css/bootstrap-table.css">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
    <div style="padding: 20px;">
        <div style="float: left;padding: 6px;">
            <button type="button" class="btn btn-primary" data-toggle="button" id="backIndex">返回客户端</button>
        </div>
        <table id="screenTable">
        </table>
    </div>
    
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">只可以修改发送内容与是否已读</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="txt_departmentname">发送者</label>
                        <input type="text" name="txt_departmentname" class="form-control" id="txt_sendName" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="txt_parentdepartment">内容</label>
                        <input type="text" name="txt_parentdepartment" class="form-control" id="txt_content">
                    </div>
                    <div class="form-group">
                        <label for="txt_departmentlevel">接收者</label>
                        <input type="text" name="txt_departmentlevel" class="form-control" id="txt_receiveName" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="txt_statu">是否已读(Y/N)</label>
                        <input type="text" name="txt_statu" class="form-control" id="txt_isRead">
                    </div>
                    <div class="form-group">
                        <label for="txt_departmentlevel">时间</label>
                        <input type="text" name="txt_departmentlevel" class="form-control" id="txt_time" readonly="readonly">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                    <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
		function AddFunctionAlyt(value,row,index){
		    return[
		    '<button type="button" id="tableEditor" class="btn btn-warning">编辑</button>&nbsp;&nbsp;',
		    '<button type="button" id="tableDelete" class="btn btn-danger">删除</button>'
		    ].join('');
		}
		window.operateEvents={
		    "click #tableEditor":function(e,vlaue,row,index){
		    	$("#myModalLabel").text("只可以修改发送内容与是否已读");
		    	$("#txt_sendName").val(row.sendName);
		    	$("#txt_content").val(row.content);
		    	$("#txt_receiveName").val(row.receiveName);
		    	$("#txt_isRead").val(row.isRead);
		    	$("#txt_time").val(row.time);
	            $('#myModal').modal();
		    },
		    "click #tableDelete":function(e,vlaue,row,index){
		    	$.ajax({
	                type: "post",
	                url: "delete",
	                data:{
	                	SendName:row.sendName,
	                	ReceiveName:row.receiveName,
	                    Time:row.time
	                    },
	                success: function(data){
	                	alert("消息删除成功");
	                	window.location.reload();
	                },
	                error: function(){}
	            }); 
		    }
		};
		$('#backIndex').click(function () {
		    window.location.href="index.jsp";
		});
		$('#btn_submit').click(function(){
			if($("#txt_isRead").val()=='Y'||$("#txt_isRead").val()=='N'){
				$.ajax({
                    type: "post",
                    url: "serverUpdate",
                    data:{
                    	IsReade:$("#txt_isRead").val(),
                    	Content:$("#txt_content").val(),
                        SendName:$("#txt_sendName").val(),
                        ReceiveName:$("#txt_receiveName").val(),
                        Time:$("#txt_time").val()
                        },
                    success: function(data){
                        alert("修改消息成功");
                        window.location.reload();
                    },
                    error: function(){}
                }); 
			}else{
				alert("修改失败 是否已读只能为 (Y/N)");
			}
			
		});
        $('#screenTable').bootstrapTable({
            typs:"get",
            url:"select",
            striped : true,                     // 是否显示行间隔色
            showRefresh: true,                  //是否显示刷新按钮
            showColumns: true,                  //是否显示所有的列
            clickToSelect: true,                //是否启用点击选中行
            pageNumber: 1,                      //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                    //是否启用排序
            sortOrder: "asc",                   //排序方式
            clickToSelect: true,                //是否启用点击选中行
            showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
            minimumCountColumns: 2,             //最少允许的列数
            uniqueId: "no",                     //每一行的唯一标识，一般为主键列
            search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [{
                field: 'sendName',
                title: '发送者'
            }, {
                field: 'content',
                title: '内容'
            }, {
                field: 'receiveName',
                title: '接收者'
            }, {
                field: 'isRead',
                title: '是否已读(Y/N)'
            }, {
                field: 'time',
                title: '时间'
            }, {
                field: 'button',
                title: '操作',
                width:300,
                align: 'center',
                events:operateEvents,//给按钮注册点击事件
                formatter:AddFunctionAlyt//添加按钮
            }]
        });
        
</script>
</html>