<%--
  Created by IntelliJ IDEA.
  User: teng
  Date: 2021/4/27
  Time: 上午10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.min63b9.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min14ed.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/hplus.min862f.js?v=4.1.0"></script>
<script src="${pageContext.request.contextPath}/static/js/contabs.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/pace.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/static/js/fkjava_timer.js"></script>
<link href="${pageContext.request.contextPath}/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/all.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
    <title>管理员中心</title>
    <meta charset="utf-8">

    <style>
        #wrapper {
            height: 100%;
        }
        #content-main{
            height: 100%;
        }
        .nav>li.active {
            border-left: 4px solid #ff2a2b;
            background: #4e4e4e;
        }
        .nav>li>a:focus, .navbar-default .nav>li>a:hover {
            background-color: #8e8e8e;
        }
        .nav>li>a {
            color: #a3a3a3;
            font-size: 16px;
        }
        body{
            background-color: #FFFFFF
        }
        .page-tabs a.active:hover {
            background: #4e4e4e;
        }
        .nav-second-level li:first-child {
            margin-top: 10px;
        }
    </style>
</head>
<body class="fixed-sidebar full-height-layout " style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side animated slideInLeft" role="navigation" style="overflow: hidden">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse" style="overflow: hidden">
            <ul class="nav" id="side-menu" style="overflow: hidden">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span style="height: 97px;width: 170px"><img alt="image" class="img-circle" style="margin-left: 47.5px" src="${pageContext.request.contextPath}/image/1.jpg" width=75 height=75></span>
                        <div style="height: 20px"></div>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <%--                            <c:if test="${admins.roleId==2}">--%>
                            <span class="clear">
                                    <span class="text-muted text-xs block" style="text-align: center"><font style="color:#ff2a2b;font-size: 16px;">管理员${admin.adminName}++${admin.roleId}</font></span>
                                </span>
                            <%--                            </c:if>--%>
                            <c:if test="${admin.roleId==1}">
                                <span class="clear">
                                    <span class="text-muted text-xs block" style="text-align: center"><font style="color:#f8ac59;font-size: 16px;">超级管理员${admins.adminName}</font></span>
                                </span>
                            </c:if>
                        </a>
                    </div>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa-user"></i>
                        <span class="nav-label">用户管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/admin/queryUser" data-index="0">用户查询</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/admin_page/userAdd">用户添加</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa-book-open" style="margin-right:4px;margin-left:-2px"></i>
                        <span class="nav-label">书籍管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="book?method=queryAll1" data-index="0">书籍管理</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="book?method=addBook" data-index="0">书籍添加</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="bookshelf?method=queryAllBookshelf" data-index="0">书架管理</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="borrow?method=queryAllBorrow" data-index="0">借阅查询</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="sold?method=queryAllSold" data-index="0">售书情况</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa-clipboard-list" style="margin-right: 7px;margin-left: 1px"></i>
                        <span class="nav-label">日志管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="log?method=queryAllLog" data-index="0">查看日志</a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="dashbard-1">
        <div class="row content-tabs animated slideInDown">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id=""></a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </li>
                </ul>
            </div>
            <a href="login?method=quit" onclick="quitAdmin()" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            <script>
                function  quitAdmin(){
                    layer.msg('退出成功', {icon: 1});
                    setTimeout("window.location = 'book?method=queryAll&type=6'", 800);
                }
            </script>

        </div>

        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="book?method=queryAll1" frameborder="0"
                    data-id=""  seamless></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
    <!--右侧边栏开始-->
</div>
<!--右侧边栏结束-->

</body>
<%--<script>--%>
<%--    var a=${param.type};--%>
<%--    if (a==1){--%>
<%--        layer.msg("登录成功",{icon:1})--%>
<%--    }--%>
<%--</script>--%>
<script>
    var a=${param.type};
    if (a==0){
        layer.msg("添加失败",{icon:2})
    }
    if (a==1){
        layer.msg("添加成功",{icon:1})
    }
    if (a==2){
        layer.msg("充值失败",{icon:2})
    }
    if (a==3){
        layer.msg("充值成功",{icon:1})
    }
    if (a==4){
        layer.msg("删除失败",{icon:2})
    }
    if (a==5){
        layer.msg("删除成功",{icon:1})
    }
    if (a==6){
        layer.msg("修改失败",{icon:2})
    }
    if (a==7){
        layer.msg("修改成功",{icon:1})
    }
    if (a==8){
        layer.msg("登录成功",{icon:1})
    }
    if (${!empty error}){
        layer.msg("${error}")
    }
</script>
</html>

