<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/21 0021
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
    <link href="${pageContext.request.contextPath}/static/css/top.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugin/fontawesome/css/all.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/animate.min.css"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <style>
        .top-nav li a {
            color: #FFFFFF;
        }
        .top-nav {
            background: #3f3f3f;
        }
        .fas{
            color: #FFFFFF;
        }
    </style>
</head>
<body style="background-color: #f2f2f2">
<div class="top-nav animate__animated animate__slideInDown">
    <ul class="top-nav-left">
        <li>
            <i class="fas fa-home"></i>
            <a href="index.jsp" target="_top">主页</a>
        </li>
        <c:if test="${empty user}">
            <li>
                <span class="welcome"><font style="color: #FFFFFF; font-size: 13.333333px">欢迎您AiChat通讯录管理系统</font></span><!--文字可以使用span标签放置-->
            </li>
            <li>
                <i class="fas fa-sign-in-alt"></i>
                <a href="login" target="bottom">请登录</a>
            </li>
            <li>
                <a href="register" target="bottom">免费注册</a>
            </li>
        </c:if>
        <c:if test="${!empty user}">
            <li>
                <span class="welcome">
                    <font style="color: #FFFFFF; font-size: 13.333333px">
                    欢迎用户
                        <font style="color: #ff2b2a">
                                ${user.name}
                        </font>登录AiChat系统!
                    </font>
                </span><!--文字可以使用span标签放置-->
            </li>
            <li>
                <i class="fas fa-user-edit"></i>
                <a href="center" target="bottom">个人中心</a>
            </li>
        </c:if>
    </ul>
    <ul class="top-nav-right">
        <li>
            <i class="fas fa-book"></i>
            <a href="borrow?method=queryByIdBorrow2&userId=${user.id}" target="bottom">xxx</a>
        </li>
        <li>
            <i class="fas fa-shopping-cart"></i>
            <a href="sold?method=queryByIdSold1&userId=${user.id}" target="bottom">xxx</a>
        </li>
        <li>
            <i class="fas fa-question-circle"></i>
            <a  onclick="parent.frames['bottom'].help()" style="cursor: pointer"> 帮助</a>
        </li>
        <c:if test="${!empty user}">
            <li>
                <i class="fas fa-sign-out-alt"></i>
                <a onclick="quit()" style="cursor: pointer">安全退出</a>
            </li>
        </c:if>
    </ul>
</div>
<script>
    function quit() {
        window.parent.frames['bottom'].location.href='user?method=quit';
        window.location.reload();
    }
</script>

</body>
</html>
