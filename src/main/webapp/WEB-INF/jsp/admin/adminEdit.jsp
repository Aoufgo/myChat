<%--
  Created by IntelliJ IDEA.
  User: teng
  Date: 2021/4/28
  Time: 下午10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--管理员为会员修改信息的页面--%>
<html>
<head>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min63b9.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min14ed.js?v=3.3.6"></script>
    <link href="${pageContext.request.contextPath}/static/plugin/fontawesome/css/all.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/plugin/layui/layui.all.js"></script>


    <meta charset="utf-8">
    <title>修改管理员信息</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
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
            height:550px;
            z-index:2;
            display: block;
            margin: 0 auto;
            border-top:none;
            text-align: center;
        }
    </style>
</head>
<body>
<input type="hidden" id="result" value="${result}">
<div id="register_div" class="register_div">
    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>

            <form class="m-t" role="form" action="${pageContext.request.contextPath}/admin/updateAdmin" method="post" target="_parent">
                <input type="hidden" value="${admin.adminId}" name="adminId">
                <div class="form-group">
                    管理员用户名:<input type="text" name="adminName" value="${admin.adminName}" class="form-control"><br>
                </div>
                <div class="form-group">
                    密码:<input type="text" name="adminPassword" value="${admin.adminPassword}" class="form-control"><br>
                </div>
                <div class="form-group">
                    状态: <input type="text" name="status" value="${admin.status}" class="form-control"><br>
                </div>
                <input type="submit" value="修改">
            </form>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min14ed.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/static/js/icheck.min.js"></script>
</body>
</html>
