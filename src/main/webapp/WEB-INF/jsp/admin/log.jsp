<%--
  Created by IntelliJ IDEA.
  User: teng
  Date: 2021/5/7
  Time: 下午4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>编辑日志</title>
</head>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<%--<link rel="shortcut icon" href="tablecssjs/favicon.ico">--%>
<link href="${pageContext.request.contextPath}/static/js/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/custom.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/jquery.min63b9.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.peity.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min14ed.js"></script>
<script src="${pageContext.request.contextPath}/static/js/content.mine209.js"></script>
<script src="${pageContext.request.contextPath}/static/js/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/peity-demo.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/animate.min.css"/>
<script src="${pageContext.request.contextPath}/static/js/layui.all.js"></script>
<body style="text-align: center">
<div class="row" style="width: 80%;margin: 0 auto">
    <div class="col-sm-12">
        <div class="ibox float-e-margins animate__animated animate__fadeInUp animate__faster">
            <div class="ibox-title">
                <h5>登录日志</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
                        <i class="fa fa-wrench"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="table_basic.html#">选项1</a>
                        </li>
                        <li><a href="table_basic.html#">选项2</a>
                        </li>
                    </ul>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>日志编号</th>
                            <th>管理员编号</th>
                            <th>操作</th>
                            <th>状态</th>
                            <th>创建时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${logs}" var="log" varStatus="count">
                            <tr>
                                <td>${log.logId}</td>
                                <td>${log.adminId}</td>
                                <td>${log.operation}</td>
                                <td>${log.status}</td>
                                <td>${log.createTime}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
        </div >
    </div>
</div>
</body>
</html>

