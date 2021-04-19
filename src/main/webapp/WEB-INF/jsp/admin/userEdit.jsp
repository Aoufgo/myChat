<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--管理员为会员修改信息的页面--%>
<html>
<head>
    <meta charset="utf-8">
    <title>修改会员信息</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min63b9.js?v=2.1.4"></script>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min14ed.js?v=3.3.6"></script>
    <link href="${pageContext.request.contextPath}/static/plugin/fontawesome/css/all.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/css/custom.css"></script>
    <link href="${pageContext.request.contextPath}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/animate.min.css" rel="stylesheet">

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
<div id="register_div" class="register_div">
    <div class="middle-box text-center loginscreen animate__animated animate__fadeIn animate__faster">
        <div>
<form class="m-t" role="form" action="${pageContext.request.contextPath}/admin/updateUser" method="post" target="_parent">
    <input type="hidden" value="${user.id}" name="id">
    <div class="form-group">
    昵称:<input type="text" name="nickname" value="${user.nickname}" class="form-control"><br>
    </div>
    <div class="form-group">
        性别:<br>
    <c:if test="${user.sex == 'm'}">
        <input type="radio" name="sex" value="m" checked>男
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <input type="radio" name="sex" value="f">女</c:if>
    <c:if test="${user.sex == 'f'}">
        <input type="radio" name="sex" value="m" >男
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <input type="radio" name="sex" value="f" checked>女
    </c:if><br>
    </div>
    <div class="form-group">
    年龄:<input type="text" name="age" value="${user.age}" class="form-control"><br>
    </div>
    <div class="form-group">
    手机号码:<input type="text" name="phone" value="${user.phone}" class="form-control"><br>
    </div>
<%--    <div class="form-group">--%>
<%--    密码:<input type="text" name="password" value="${user.password}" class="form-control"><br>--%>
<%--    </div>--%>
    <div class="form-group">
        账号状态:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <c:if test="${user.accStatus == 0}">
            <select name="accStatus">
                <option value="0" >异常</option>
                <option value="1" >正常</option>
            </select>
        </c:if>
        <c:if test="${user.accStatus == 1}">
            <select name="accStatus">
                <option value="1" >正常</option>
                <option value="0" >异常</option>
            </select>
        </c:if><br>
    </div>
    <input type="submit" value="修改">
</form>
        </div>
    </div>
</div>

</body>
</html>
