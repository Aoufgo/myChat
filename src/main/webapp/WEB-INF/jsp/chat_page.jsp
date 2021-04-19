<%--
  Created by IntelliJ IDEA.
  User: aoufgo
  Date: 2021/4/13
  Time: 下午5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bundle.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/app.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/animate.min.css"/>
    <style>


    </style>
</head>
<body>
<input type="hidden" value="${id}" id="toId">
<div class="layout" >
    <div class="content"  >
        <div class="chat" >
            <div class="chat-body" > <!-- .no-message -->
                <div class="messages">
                </div>
            </div>
            <div class="chat-footer">
                <form>
                    <div>
                        <button class="btn btn-light mr-3 d-none d-sm-inline-block" data-toggle="tooltip" title="Emoji"
                                type="button">
                            <i data-feather="smile"></i>
                        </button>
                        <button class="btn btn-danger mr-3 d-inline d-sm-none btn-close-chat" data-toggle="tooltip"
                                title="Emoji" type="button">
                            <i data-feather="arrow-left"></i>
                        </button>
                    </div>
                    <input type="text" class="form-control" placeholder="Write a message.">
                    <div class="form-buttons">
                        <button class="btn btn-light d-none d-sm-inline-block" data-toggle="tooltip" title="Add files"
                                type="button">
                            <i data-feather="paperclip"></i>
                        </button>
                        <button class="btn btn-light d-none d-sm-inline-block" data-toggle="tooltip"
                                title="Send a voice record" type="button">
                            <i data-feather="mic"></i>
                        </button>
                        <button class="btn btn-primary" type="submit" onclick="parent.submitMsg()">
                            <i data-feather="send"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bundle -->
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/static/js/bundle.js"></script>

<!-- App scripts -->
<script src="${pageContext.request.contextPath}/static/js/app.min.js"></script>

<!-- Examples -->
<%--<script src="${pageContext.request.contextPath}/static/js/examples.js"></script>--%>
</body>
</html>
