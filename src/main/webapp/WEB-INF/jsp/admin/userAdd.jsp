<%--
  Created by IntelliJ IDEA.
  User: guoao
  Date: 2021/4/11
  Time: 下午3:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>添加用户</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min63b9.js?v=2.1.4"></script>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min14ed.js?v=3.3.6"></script>
    <link href="${pageContext.request.contextPath}/static/plugin/fontawesome/css/all.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/css/custom.css"></script>
    <link href="${pageContext.request.contextPath}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/animate.min.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/static/plugin/layui/layui.all.js"></script>
    <style>
        .form-control1{
            display: inline;
            width: 215px;
        }
        .send{
            display: inline;
            height: 32px;
        }
        .register_div{
            border-radius: 20px;
            background-color:white;
            width:500px;
            height:818px;
            z-index:2;
            display: block;
            margin: 20px auto;
            border-top:none;
            text-align: center;
        }
        .btn-primary:hover{
            background-color: #c10606;
            border-color: #c10606;
        }
    </style>
</head>

<body>
<div id="register_div" class="register_div">
    <div class="middle-box text-center loginscreen animate__animated animate__fadeInUp animate__faster">
        <div>
            <h2>添加会员信息 </h2>
            <form class="m-t" role="form" action="${pageContext.request.contextPath}/admin/addUser"  method="post">
                <div class="form-group">
                    用户名:<input type="text" name="name" id="userName" class="form-control" placeholder="请输入用户名" required=""><br>
                    <span id="msg">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                </div>
                <div class="form-group">
                    <input type="radio" name="sex" value="m"  required=""> 男
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <input type="radio" name="sex" value="f"   required=""> 女
                    <br>
                </div>
                <div class="form-group">
                    年龄:<input type="text" name="age" id="age" class="form-control" placeholder="请输入年龄" required=""><br>
                </div>
                <div class="form-group">
                    密码:<input type="password" name="password" id="userPassword" class="form-control" placeholder="请输入密码" required=""><br>
                    <span id="msg1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                </div>
                <div class="form-group">
                    再次输入密码:<input type="password" class="form-control" placeholder="请再次输入密码" name = "userPassword2" id="userPassword2" required=""><br>
                    <span id="msg3">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                </div>
                <div class="form-group">
                    手机号码:<input type="tel" name="phone" id="userPhone" class="form-control" placeholder="请输入手机号" required=""><br>
                    <span id="msg2"> </span>
                </div>

                <button type="submit" class="btn btn-primary block full-width m-b">添  加</button>


            </form>
        </div>
    </div>
</div>
<script>
    var a = ${type};
    if(a===1){
        layer.msg("添加成功",{icon:1})
    }else if (a===0){
        layer.msg("添加失败",{icon:2})
    }
    if (${!empty error}){
        layer.msg("${error}")
    }

</script>
</body>
</html>


