<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>混合式APP 短信</title>
<link rel="stylesheet" type="text/css" href="css\iconfont.css">
<link rel="stylesheet" type="text/css" href="css/chat.css">

</head>
<body>

<div class="chatContainer">

    <div class="chatBox" ref="chatBox">
        <div class="chatBox-head">
            <div class="chatBox-head-one">
                <div id="userName" >
                    <i class="iconfont icon-yonghu"></i>
                    <span>QQ</span>
                </div>
                <div class="chat-close" id="newMsg" style="float: right; margin: 10px 10px 0 0;font-size: 14px">新建</div>
                <div class="chat-close" id="server" style="float: right; margin: 10px 10px 0 0;font-size: 14px">后台</div>
            </div>
            <div class="chatBox-head-two">
                <div class="chat-return"><i class="iconfont icon-fanhui" style="color: #F0F0F0;font-weight: 800;font-size: 20px;"></i></div>
                <div class="chat-people">
                    <div class="ChatInfoHead">
                        <img src="" alt="头像">
                    </div>
                    <div class="ChatInfoName"></div>
                </div>
            </div>
            <div class="chatBox-head-three">
                <div class="chat-return"><i class="iconfont icon-fanhui" style="color: #F0F0F0;font-weight: 800;font-size: 20px;"></i></div>
                <div class="newMsg">
                    <div class="newMsgHead">新建联系人:</div>
                    <div><input type="text" id="NewReceiveName"></div>
                </div>
            </div>
        </div>
        <div class="chatBox-info">
            <div class="chatBox-list" ref="chatBoxlist">
            
				<c:forEach items="${map}" var="item">
					<div class="chat-list-people">
	                    <div><img src="img/icon01.png" alt="头像"></div>
	                    <div class="chat-name">
	                        <p>${item.key}</p>
	                    </div>
	                    <c:if test="${item.value==0}">
	                       <div class="message-num"></div>
	                    </c:if>
	                    <c:if test="${item.value>0}">
                           <div class="message-num">${item.value}</div>
                        </c:if>
	                </div>
				</c:forEach>
            </div>
            <div class="chatBox-kuang" ref="chatBoxkuang">
                <div class="chatBox-content">
                    <div class="chatBox-content-demo" id="chatBox-content-demo">
                    </div>
                </div>
                <div class="chatBox-send">
                    <div class="div-textarea" contenteditable="true"></div>
                    <!-- 发送框三个小图标 -->
                    <div style="float: right;">
                        <label id="chat-tuxiang" title="发送图片" for="inputImage" class="btn-default-styles">
                            <input type="file" onchange="selectImg(this)" accept="image/jpg,image/jpeg,image/png"
                                   name="file" id="inputImage" class="hidden">
                            <i class="iconfont icon-tupian"></i>
                        </label>
                        <button id="chat-fasong" class="btn-default-styles"><i class="iconfont icon-fasong" style="color: #58BA37;font-size: 20px;"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="js/jquery.min.js"></script>
<script>
    // 确定用户姓名 以及修改姓名
    $(function(){
        if(!window.localStorage){
            alert("您的浏览器不支持localstorage");
            return false;
        }else{
            var userName = localStorage.getItem("KeyUserName");
            if(typeof(userName)=='string'&&userName!='null'&&userName.length!=0){
                $('.chatBox-head-one span').text(userName);
            }else{
                userName = prompt("请输入您的用户名","小王");
                localStorage.setItem("KeyUserName",userName);
                RefreshUserList(userName);
            } 
        }
        $("#userName").click(function(){
            if(confirm("是否要修改用户名?")){
            	userName = prompt("请输入您的用户名","小王");
                localStorage.setItem("KeyUserName",userName);
                RefreshUserList(userName);
            }else{
            	RefreshUserList(localStorage.getItem("KeyUserName"));
            }
        })
    })
    // 更新用户的聊天列表
    function RefreshUserList(userName){
    	$.ajax({
            type: "GET",
            url: "refresh?UserName="+userName,
            dataType: "text",
            success: function(data){window.location.reload();},
            error: function(){}
        }); 
    };

    // 响应式
    screenFuc();
    function screenFuc() {
        var topHeight = $(".chatBox-head").innerHeight();//聊天头部高度
        //屏幕小于768px时候,布局change
        var winWidth = $(window).innerWidth();
        if (winWidth <= 768) {
            var totalHeight = $(window).height(); //页面整体高度
            $(".chatBox-info").css("height", totalHeight - topHeight);
            var infoHeight = $(".chatBox-info").innerHeight();//聊天头部以下高度
            //中间内容高度
            $(".chatBox-content").css("height", infoHeight - 46);
            $(".chatBox-content-demo").css("height", infoHeight - 46);

            $(".chatBox-list").css("height", totalHeight - topHeight);
            $(".chatBox-kuang").css("height", totalHeight - topHeight);
            $(".div-textarea").css("width", winWidth - 106);
        } else {
            $(".chatBox-info").css("height", 495);
            $(".chatBox-content").css("height", 448);
            $(".chatBox-content-demo").css("height", 448);
            $(".chatBox-list").css("height", 495);
            $(".chatBox-kuang").css("height", 495);
            $(".div-textarea").css("width", 265);
        }
    }
    (window.onresize = function () {
        screenFuc();
    })();

    $(".message-num").each(function () {
        var wdNum = $(this).html();
        if (wdNum == "") {
            $(this).css("padding", 0);
        }
    });
    //进入服务端
    $("#server").click(function () {
    	var username = prompt("请输入您的用户名","");
    	if(typeof(username)!='string')return;
    	var password = prompt("请输入您的密码","");
    	if(confirm("是否要进入服务端")){
    		if(username!="admin"||password!="admin"){
    			alert("用户名或密码错误!");
    		}else{
    			window.location.href="server.jsp";
    		}
    	}else{
    		window.location.reload();
    	}
    })


    //打开/关闭聊天框    新建消息
    $("#newMsg").click(function () {
        $(".chatBox-head-three").toggle(1);
        $(".chatBox-head-two").toggle(false);
        $(".chatBox-head-one").toggle(false);
        $(".chatBox-list").fadeToggle();
        $(".chatBox-kuang").fadeToggle();
    })
    //进聊天页面
    $(".chat-list-people").each(function () {
        $(this).click(function () {
            var n = $(this).index();
            $(".chatBox-head-one").toggle();
            $(".chatBox-head-two").toggle();
            $(".chatBox-list").fadeToggle();
            $(".chatBox-kuang").fadeToggle();

            //传名字
            $(".ChatInfoName").text($(this).children(".chat-name").children("p").eq(0).html());

            //传头像
            $(".ChatInfoHead>img").attr("src", $(this).children().eq(0).children("img").attr("src"));

            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
            
            //更新已读消息
            $.ajax({
	            type: "GET",
	            url: "updateIsReade?SendName="+$(this).children(".chat-name").children("p").eq(0).html()+"&ReceiveName="+localStorage.getItem("KeyUserName"),
	            dataType: "text",
	            success: function(data){},
	            error: function(){}
	        }); 
        
            $.ajax({
            	typs:"post",
            	url:"accept",
            	data:{
            		SendName:$(this).children(".chat-name").children("p").eq(0).html(),
            		UserName:localStorage.getItem("KeyUserName")
            		},
            	dataType:"json",
            	success:function(data){
            		console.log(data);
                    console.log(data.list[0].content);
            		for(var i = 0;i<data.list.length;i++){
            			if(data.list[i].receiveName==localStorage.getItem("KeyUserName")){
            				$(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                              "<div class=\"author-name\"><small class=\"chat-date\">"+data.list[i].time+"</small> </div> <div class=\"left\"> "+
                              "<div class=\"chat-avatars\"><img src=\"img/icon01.png\" alt=\"头像\" /></div>"+
                              "<div class=\"chat-message\"> " + data.list[i].content + " </div> </div> </div> " );
            			}else{
            				$(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
       	                      "<div class=\"author-name\"><small class=\"chat-date\">"+data.list[i].time+"</small> </div> " +
       	                      "<div class=\"right\"> <div class=\"chat-message\"> " + data.list[i].content + " </div> " +
       	                      "<div class=\"chat-avatars\"><img src=\"img/icon01.png\" alt=\"头像\" /></div> </div> </div>");
            			}
            		}
            	}
            });

            $(this).find(".message-num").text('');
            $(this).find(".message-num").css("padding",0);
        })
    });

    //返回列表
    $(".chat-return").click(function () {
        $(".chatBox-head-one").toggle(1);
        $(".chatBox-head-two").toggle(false);
        $(".chatBox-head-three").toggle(false);
        $(".chatBox-list").fadeToggle(1);
        $(".chatBox-kuang").fadeToggle(1);
        $.ajax({
            type: "GET",
            url: "updateIsReade?SendName="+$(".ChatInfoName").text()+"&ReceiveName="+localStorage.getItem("KeyUserName"),
            dataType: "text",
            success: function(data){RefreshUserList(localStorage.getItem("KeyUserName"));},
            error: function(){}
        }); 
    });

    //获取当前系统时间
    function LocalTime(s) {
        return s < 10 ? '0' + s : s;
    }
    function NowTime() {
        var myDate = new Date();
        //获取当前年
        var year = myDate.getFullYear();
        //获取当前月
        var month = myDate.getMonth() + 1;
        //获取当前日
        var date = myDate.getDate();
        var h = myDate.getHours();       //获取当前小时数(0-23)
        var m = myDate.getMinutes();     //获取当前分钟数(0-59)
        var s = myDate.getSeconds();
        var now = year + '-' + LocalTime(month) + "-" + LocalTime(date) + " " + LocalTime(h) + ':' + LocalTime(m) + ":" + LocalTime(s);
        return now;
    }

    //      发送信息
    $("#chat-fasong").click(function () {
        var textContent = $(".div-textarea").html().replace(/[\n\r]/g, '<br>')
        var nowTime = NowTime();
        if($(".chatBox-head-three").is(":hidden")){
        	var receiveName = $(".ChatInfoName").text();
        }
        else{
        	var receiveName = $("#NewReceiveName").val();
        	if(receiveName==""){
        		alert("请输入正确的联系人");return;
        	}
        }
        if (textContent != "") {
        	$.ajax({
                type: "GET",
                url: "send?ReceiveName="+receiveName+"&Content="+textContent+"&SendName="+localStorage.getItem("KeyUserName")+"&Time="+nowTime,
                dataType: "text",
                success: function(data){},
                error: function(){}
            }); 
        	
            $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                "<div class=\"author-name\"><small class=\"chat-date\">"+nowTime+"</small> </div> " +
                "<div class=\"right\"> <div class=\"chat-message\"> " + textContent + " </div> " +
                "<div class=\"chat-avatars\"><img src=\"img/icon01.png\" alt=\"头像\" /></div> </div> </div>");
            //发送后清空输入框
            $(".div-textarea").html("");
            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
        }
    });

    //      发送图片
    function selectImg(pic) {
        if (!pic.files || !pic.files[0]) {
            return;
        }
        var reader = new FileReader();
        reader.onload = function (evt) {
            var images = evt.target.result;
            $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                "<div class=\"author-name\"><small class=\"chat-date\">2017-12-02 14:26:58</small> </div> " +
                "<div class=\"right\"> <div class=\"chat-message\"><img src=" + images + "></div> " +
                "<div class=\"chat-avatars\"><img src=\"img/icon01.png\" alt=\"头像\" /></div> </div> </div>");
            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
        };
        reader.readAsDataURL(pic.files[0]);
    }
</script>
</body>
</html>