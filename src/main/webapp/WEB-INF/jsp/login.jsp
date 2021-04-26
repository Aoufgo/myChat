<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugin/fontawesome/css/all.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/animate.min.css"/>
    <script src="${pageContext.request.contextPath}/static/plugin/layui/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/sendCode.js"></script>
    <script>
        $(function () {
            var d = new Date();
            var hour = d.getHours();
            console.log('现在时间:'+hour)
            if(hour<4){
                $("body").attr("class","body8");
            }
            if(hour>=4&&hour<6){
                $("body").attr("class","body1");
            }
            if(hour>=6&&hour<8){
                $("body").attr("class","body2");
            }
            if(hour>=8&&hour<10){
                $("body").attr("class","body3");
            }
            if(hour>=10&&hour<14){
                $("body").attr("class","body4");
            }
            if(hour>=14&&hour<16){
                $("body").attr("class","body5");
            }
            if(hour>=16&&hour<18){
                $("body").attr("class","body6");
            }
            if(hour>=18&&hour<20){
                $("body").attr("class","body7");
            }
            if(20<=hour){
                $("body").attr("class","body8");
            }

        })

    </script>
    <title>登录界面</title>
    <style>
        .login_div{
            border-radius: 20px;
            background-color:white;
            width:380px;
            height:300px;
            z-index:2;
            display: block;
            margin: 200px auto;
            border-top:none;
            text-align: center;
        }

        .login_title_div{
            height: 30px;
        }

        .login_title_div a{
            float:right;
            text-decoration:none;
            color: #000000;
            margin-right: 8px;
            margin-top: 5px;
        }
        .navi{
            width:100%;
            height: 60px;
            margin-top: 0px;
            font-size:22px;
        }

        .navi ul{
            float: left;
            color: #000000;
            padding: 0px;
            margin-left: 70px;
        }

        .navi li{
            float: left;
            margin-left: 10px;
            list-style-type: none;
        }

        .btn{
            margin-top: 10px;
            width: 230px;
            height: 30px;
            border: 0px;
            background-color: #007DDB;
            color:white;
            font-family: 微软雅黑;
            font-size: 16px;
        }

        .textbox {
            width: 230px;
            height: 30px;
            text-align: center;
            /* border: 0; */
            border: 1px solid silver;
            margin-top: 10px;
        }
        #mailLogin{
            display: none;
        }
        .body1{
            background:url(${pageContext.request.contextPath}/image/4-6.jpg) no-repeat;
            background-size:100% 100%;
        }
        .body2{
            background:url(${pageContext.request.contextPath}/image/6-8.jpg) no-repeat;
            background-size:100% 100%;
        }
        .body3{
            background:url(${pageContext.request.contextPath}/image/8-10.jpg) no-repeat;
            background-size:100% 100%;
        }
        .body4{
            background:url(${pageContext.request.contextPath}/image/10-14.jpg) no-repeat;
            background-size:100% 100%;
        }
        .body5{
            background:url(${pageContext.request.contextPath}/image/14-16.jpg) no-repeat;
            background-size:100% 100%;
        }
        .body6{
            background:url(${pageContext.request.contextPath}/image/16-18.jpg) no-repeat;
            background-size:100% 100%;
        }
        .body7{
            background:url(${pageContext.request.contextPath}/image/18-20.jpg) no-repeat;
            background-size:100% 100%;
        }
        .body8{
            background:url(${pageContext.request.contextPath}/image/20-4.jpg) no-repeat;
            background-size:100% 100%;
        }
        .code{
            width: 180px;
        }

    </style>
    <script type="text/javascript">
        //
        function onMouseOver(){
            numberdenglu.style.cursor = 'pointer';
            maildenglu.style.cursor = 'pointer';//鼠标变小手
        }
        // 切换登录界面
        function changePage(val){
            var numberLogin_div = document.getElementById("numberLogin");//账号登录
            var mailLogin_div = document.getElementById("mailLogin");//验证码登录
            if(val == 'numberLogin'){

                numberLogin_div.style.display = 'block';
                mailLogin_div.style.display = 'none';

                numberdenglu.style.borderBottom = '3px solid #FFA00A';
                maildenglu.style.borderBottom = '';

            }else if(val == 'mailLogin'){

                numberLogin_div.style.display = 'none';     // 同上
                mailLogin_div.style.display = 'block';

                numberdenglu.style.borderBottom = '';
                maildenglu.style.borderBottom = '3px solid #FFA00A';
            }
        }
    </script>
</head>
<div style="position: absolute; bottom: 10px; right: 10px;">
    <font style="color: #ffffff;font-size: 13.33333333px">
        <a onclick="parent.top.location='${pageContext.request.contextPath}/admin_page/adminLogin'" style="cursor: pointer">
            管理员入口
        </a>
    </font>
</div>
<body id="body" class="body">
<div id="login_div" class="login_div animate__animated animate__fadeInUp animate__faster">
    <!-- 导航栏 -->
    <div id="login_title_div" class="login_title_div" onmousedown="titleMove(this)" onmousemove="cursorToMove(this)">
    </div>
    <!-- 切换登录 -->
    <div class='navi'>
        <ul>
            <li id='numberdenglu' style='border-bottom:3px solid #FFA00A;' onmouseover='onMouseOver()' onclick="changePage('numberLogin')" >用户名登录</li>
            <li id='maildenglu'  onmouseover='onMouseOver()' onclick="changePage('mailLogin')" >验证码登录</li>
        </ul>
    </div>
    <!-- 账号登录表单 -->
    <div class='div_numberLogin' id='numberLogin'>
        <form name='numberLogin_form' method="post" action="${pageContext.request.contextPath}/user/login">
            <input name="id"  class="textbox" type="text"  placeholder="请输入账号" value=""/><br/>
            <input name = "password"  class="textbox" type="password" placeholder="请输入密码" autocomplete="off" value=""/><br/>
            <div style="height:20px;"></div>
            <input id="input_numberLogin_submit" class='btn' type="submit" name='login' value='登录' />
            <p><i class="far fa-smile-wink" style="size:1px"></i>
                <a onclick="faceLogin()" style="cursor: pointer"><font style="font-size: 13.3333333px">人脸登录  </font></a>
                <a onclick="forgetPassword()" style="cursor: pointer"><font style="font-size: 13.3333333px">忘记密码?  </font></a>
                <font style="font-size:13.3333333px">没有账号?去<a href="register">注册</a></font>
            </p>
        </form>
    </div>
    <!-- 验证码登录表单 -->
    <div class='div_mailLogin' id='mailLogin'>
        <form name='mailLogin_form' method="post" action="user?method=login2">
            <input name="userPhone" id="userPhone" class="textbox" type="text" placeholder="请输入手机号" value=""/><br/>
            <div>
                <input name="code" id="code" class="textbox code" type="text" placeholder="请输入验证码" autocomplete="off" value=""/>
                <span><button class="btn" type="button" id="sendCode" style="width: 50px;margin-top: 0" >发送</button></span>
            </div>
            <div style="height:20px;"></div>
            <input id="input_login_submit" class='btn' type="submit" name='login' value='登录' />
        </form>
    </div>
</div>
</body>
<script>
    faceLogin = function() {
        layer.open({
            type:2,
            title:['人脸登录','text-align:center;font-size:20px'],
            area:['800px','650px'],
            shade:0.6,
            maxmin:true,
            content:'facelogin.jsp'
        })
    }
    forgetPassword = function() {
        layer.open({
            type:2,
            title:['忘记密码','text-align:center;font-size:20px'],
            area:['800px','500px'],
            shade:0.6,
            maxmin:true,
            content:'forgetPassword.jsp'
        })
    }
</script>
<script>
    var a=${type}
    if (a===3){
        layer.msg("您还未登录，请登录",{icon:2})
    }
    if (a===2){
        layer.msg("登录失败，不存在此手机号",{icon:2})
        const element = document.querySelector('.login_div');
        element.classList.add('animate__animated', 'animate__headShake');
    }
    if (a===7){
        layer.msg("登录失败，用户名或密码错误，请重新登录.",{icon:2})
        const element = document.querySelector('.login_div');
        element.classList.remove('animate__fadeInUp','animate__faster')
        element.classList.add('animate__animated', 'animate__headShake');
    }
    if (a===5){
        layer.msg("验证码错误",{icon:2})
        const element = document.querySelector('.login_div');
        element.classList.remove('animate__fadeInUp','animate__faster')
        element.classList.add('animate__animated', 'animate__headShake');
    }
    if (a===1){
        layer.msg("注册成功，请登录。",{icon:1})
    }
    if (a===4){
        const element = document.querySelector('.login_div');
        element.classList.add('animate__animated', 'animate__fadeOutUp','animate__faster');
        layer.msg("登录成功",{icon:1});
        //window.parent.frames['topFrame'].location.reload();
        setTimeout("top.location = '${pageContext.request.contextPath}/index'",500); //延迟
    }
    if (a===6){
        layer.msg("退出成功",{icon:1})
    }

</script>
<script>
    if (${!empty error}){
        layer.msg("${error}")
    }
</script>
</html>
