<%--
  Created by IntelliJ IDEA.
  User: aoufgo
  Date: 2021/4/4
  Time: 下午3:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title></title>
    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png">

    <!-- Bundle Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bundle.css">

    <!-- App styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/app.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/animate.min.css"/>

    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <style>
        figure.avatar.avatar-state-warning:before, figure.avatar.avatar-state-success:before {
            top: 22px;
            right: -4px;
            border: 2px solid #fff;
        }

        .new-message-count {
            width: 23px;
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            -webkit-box-align: center;
            -webkit-align-items: center;
            -moz-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            -moz-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            line-height: 0;
            font-size: 13px;
            height: 23px;
            background-color: #3b99ab;
            color: #fff;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            border-radius: 50%;
            margin-left: auto;
            display: none;
        }

        .refresh-icon {
            animation: spin 1s infinite linear;
            -moz-animation: spin 1s infinite linear;
            -webkit-animation: spin 1s infinite linear;
            -o-animation: refreshing 1s infinite linear;
        }

        @-moz-keyframes spin {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        @-webkit-keyframes spin {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        @-o-keyframes spin {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        .nicescroll-rails.nicescroll-rails-vr {
            display: none !important;
        }

        #mail_icon {
            margin: 0;
        }
    </style>
</head>
<body>
<input type="hidden" value="${user.id}" id="userId">
<!-- Page loading -->
<div class="page-loading"></div>
<!-- ./ Page loading -->

<!-- Body plate -->
<div class="body-plate"></div>
<!-- ./ Body plate -->

<!-- Disconnected modal -->
<div class="modal fade" id="disconnected" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row mb-5">
                    <div class="col-md-6 offset-md-3">
                        <img src="${pageContext.request.contextPath}/image/portrait/undraw_warning_cyit.svg" class="img-fluid" alt="image">
                    </div>
                </div>
                <p class="lead text-center">Application disconnected</p>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" onclick="top.location.reload()" class="btn btn-success btn-lg">Reconnect</button>
                <a onclick="parent.frames['topFrame'].quit()" class="btn btn-link">Logout</a>
            </div>
        </div>
    </div>
</div>
<!-- ./ Disconnected modal -->

<!-- Add friends modal -->
<div class="modal fade" id="addFriends" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i data-feather="user-plus" class="mr-2"></i> 添加好友
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="ti-close"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="alert alert-info">向朋友发送好友请求</div>
                <form id="addFriend">
                    <div class="form-group">
                        <label for="friendId" class="col-form-label">好友ID</label>
                        <input type="text" class="form-control" id="friendId">
                    </div>
                    <div class="form-group">
                        <label for="reqMessage" class="col-form-label">请求信息</label>
                        <textarea class="form-control" id="reqMessage"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" id="sendReq" class="btn btn-primary">发送</button>
            </div>
        </div>
    </div>
</div>
<!-- ./ Add friends modal -->
<!-- Add friends modal -->
<div class="modal fade" id="addFriendsReq" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i data-feather="mail" class="mr-2"></i> 好友请求
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="ti-close"></i>
                </button>
            </div>
            <div class="modal-body" id="reqList"></div>
        </div>
    </div>
</div>
<!-- ./ Add friends modal -->


<!-- Edit profile modal -->
<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i data-feather="edit-2" class="mr-2"></i> 个人中心
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="ti-close"></i>
                </button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#personal" role="tab"
                           aria-controls="personal" aria-selected="true">个人设置</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#about" role="tab" aria-controls="about"
                           aria-selected="false">人脸注册</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#social-links" role="tab"
                           aria-controls="social-links" aria-selected="false">Social Links</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane show active" id="personal" role="tabpanel">
                        <div class="form-group">
                            <label class="col-form-label">头像</label>
                            <div class="d-flex align-items-center">
                                <div>
                                    <figure class="avatar mr-3 item-rtl">
                                        <img src="${user.avatarUrl}" class="rounded-circle" id="userAvatar"
                                             alt="image">
                                    </figure>
                                </div>
                                <div class="custom-file">
                                    <form id="uploadForm">
                                        <input type="file" class="custom-file-input" name="avatar" id="customFile">
                                    </form>
                                    <label class="custom-file-label" for="customFile">选择文件</label>
                                </div>
                            </div>
                        </div>
                        <form id="updateInfo">
                            <input name="avatarUrl" type="hidden" id="avatarUrl">
                            <input name="id" value="${id}" type="hidden">
                            <div class="form-group">
                                <label for="userNickname" class="col-form-label">昵称</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="nickname" id="userNickname">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i data-feather="user"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="gender" class="col-form-label">性别</label>
                                <div class="input-group">
                                    <select class="form-control" name="sex" id="gender">
                                        <option value="f">男</option>
                                        <option value="m">女</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="age" class="col-form-label">年龄</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" name="age" id="age">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="phone" class="col-form-label">手机</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="phone">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i data-feather="phone"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane" id="about" role="tabpanel">
                        <form>
                            <div class="form-group">
                                <label for="about-text" class="col-form-label">Write a few words that describe
                                    you</label>
                                <textarea class="form-control" id="about-text"></textarea>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" checked id="customCheck1">
                                <label class="custom-control-label" for="customCheck1">View profile</label>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane" id="social-links" role="tabpanel">
                        <form>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Username">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-facebook">
                                            <i class="ti-facebook"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Username">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-twitter">
                                            <i class="ti-twitter"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Username">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-instagram">
                                            <i class="ti-instagram"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Username">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-linkedin">
                                            <i class="ti-linkedin"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Username">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-dribbble">
                                            <i class="ti-dribbble"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Username">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-youtube">
                                            <i class="ti-youtube"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Username">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-google">
                                            <i class="ti-google"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Username">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-whatsapp">
                                            <i class="fa fa-whatsapp"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="commit()" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- Layout -->
<div class="layout">
    <!-- Content -->
    <div class="content" style="height: 108.9%;">
        <!-- Friends sidebar -->
        <div id="friends" class="sidebar animate__animated animate__slideInLeft">
            <header>
                <span>Friends</span>
                <ul class="list-inline">
                    <li class="list-inline-item" data-toggle="tooltip" title="Friend Req">
                        <figure class="btn btn-outline-light" id="mail_icon" href="#" data-toggle="modal"
                                data-target="#addFriendsReq">
                            <i data-feather="mail"></i>
                        </figure>
                    </li>
                    <li class="list-inline-item" data-toggle="tooltip" title="Add friends">
                        <a class="btn btn-outline-light" href="#" data-toggle="modal" data-target="#addFriends">
                            <i data-feather="user-plus"></i>
                        </a>
                    </li>

                </ul>
            </header>
            <form>
                <label for="search">查询好友</label><input id="search" type="text" class="form-control"
                                                       placeholder="Search">
            </form>
            <div class="sidebar-body">
                <p>${friends.size()} 个好友</p>
                <%--刷新好友和提示信息方法--%>
                <div style="text-align: right;padding-right: 30px;cursor: pointer;" id="refreshFriends"
                     onclick="refreshFriends()">
                    刷新
                    <div id="d"
                         style="background-size: 100%; background-image: url('${pageContext.request.contextPath}/image/icon/refresh-64x64.png');display: inline-block; height: 15px;width: 15px; margin-bottom: 2px; vertical-align:middle;"
                         class=""></div>
                </div>
                <div id="friendBar">
                    <ul class="list-group list-group-flush">
                        <c:forEach items="${friends}" var="f">
                            <li class="list-group-item" onclick="linkTo(${f.id2})">
                                <input value="${f.id2}" type="hidden" id="id2" class="id2">
                                <input value="${f.user.nickname}" type="hidden" id="nickname">
                                <input value="${f.user.name}" type="hidden" id="name">
                                <div>
                                    <c:if test="${f.user.status == 200}">
                                    <figure class="avatar avatar-state-success" id="avatar-state-${f.id2}">
                                        </c:if>
                                        <c:if test="${f.user.status != 200}">
                                        <figure class="avatar avatar-state-warning" id="avatar-state-${f.id2}">
                                            </c:if>
                                            <c:if test="${!empty f.user.avatarUrl}">
                                                <img class="rounded-circle" src="${f.user.avatarUrl}">
                                            </c:if>
                                            <c:if test="${empty f.user.avatarUrl}">
                                                <span class="avatar-title bg-success rounded-circle">${fn:substring(f.user.name,0,1)}</span>
                                            </c:if>
                                        </figure>
                                </div>
                                <div class="users-list-body">
                                    <div>
                                        <h5>${f.user.nickname}</h5>
                                        <p>${f.user.name}</p>
                                    </div>
                                    <div class="new-message-count" id="new-message-count-${f.id2}"></div>
                                    <div class="users-list-action">
                                        <div class="action-toggle">
                                            <div class="dropdown">
                                                <a data-toggle="dropdown" href="#">
                                                    <i data-feather="more-horizontal"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a href="#" data-navigation-target="contact-information"
                                                       class="dropdown-item">Profile</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a href="#" class="dropdown-item text-danger">Block</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <!-- ./ Friends sidebar -->
        <!-- Chat -->
        <iframe width="100%" class="chat" id="chatFrame" name="chatFrame" height="100%"
                <c:if test="${!empty friends}">
                    src="${pageContext.request.contextPath}/user/link/${user.id}/${friends[0].id2}"
                </c:if>
                <c:if test="${empty friends}">
                    srcdoc="<p>添加一个好友吧!</p>"
                </c:if>
                frameborder="0" data-id="" seamless scrolling="no">
        </iframe>


    </div>
    <!-- ./ Content -->

</div>
<!-- ./ Layout -->

<!-- Bundle -->


<script src="${pageContext.request.contextPath}/static/js/bundle.js"></script>

<!-- App scripts -->
<script src="${pageContext.request.contextPath}/static/js/app.min.js"></script>

<!-- Examples -->
<script src="${pageContext.request.contextPath}/static/js/websocket.js"></script>
<script src="${pageContext.request.contextPath}/static/plugin/layui/layui.all.js"></script>
<script>
    if (${!empty error}) {
        layer.msg("${error}")
    }

    function linkTo(id) {
        document.getElementById("chatFrame").src = '${pageContext.request.contextPath}/user/link/${user.id}/' + id;

    }

    function refreshFriends() {
        document.querySelector('#d').classList.add('refresh-icon');
        setTimeout('document.querySelector(\'#d\').classList.remove(\'refresh-icon\')', 1000);
        document.querySelector('#friendBar');
        $(".id2").each(function () {
            console.log($(this));
        })
    }

    $(function () {
        const element = $("#search")
        element.keyup(function () {
            if (element.val() !== '') {
                $(".list-group-item").each(function () {
                    if ($(this).children("input#id2").val().indexOf(element.val()) === -1 &&
                        $(this).children("input#nickname").val().indexOf(element.val()) === -1 &&
                        $(this).children("input#name").val().indexOf(element.val()) === -1) {
                        $(this).hide();
                    }
                })
            } else {
                $(".list-group-item").show();
            }
        })
    })
    $(function () {
        $.get("${pageContext.request.contextPath}/user/getUnread/${user.id}", function (data) {
            var obj = JSON.parse(data);
            for (let o in obj) {
                $(".id2").each(function () {
                    if (obj[o].fromId === $(this).val()) {
                        const element = $("#new-message-count-" + obj[o].fromId);
                        element.css('display', 'flex');
                        element.html(obj[o].count);
                        return;
                    }
                })
                if (${!empty reqList}) {
                    $("#mail_icon").css("color", "red")
                    <c:forEach items="${reqList}" var="r">
                    addReq('${r.fromId}', '${r.msg.trim()}', '${r.sendTime}')
                    </c:forEach>
                }
            }


        })
    })
    $(function () {
        $("#sendReq").click(function (e) {
            e.preventDefault();
            var friendId = $("#addFriend").find('input[id=friendId]').val();
            var message = $("#addFriend").find('textarea[id=reqMessage]').val();
            if (friendId === '${id}') {
                layer.msg("您不能将自己加为好友!", {icon: 2});
            } else {
                $.get('${pageContext.request.contextPath}/user/getUser/' + friendId, function (resp) {
                    if (resp !== "yes") {
                        layer.msg("找不到用户", {icon: 2})
                        return;
                    }
                    if (resp === "yes") {
                        send('${user.name}' + ':' + message, '${user.id}', friendId, new Date().getTime(), "friendReq")
                        layer.msg("发送成功", {icon: 1})
                        $("#addFriends").modal('hide');
                    }
                })
            }
        })
    })

    function agree(id) {
        //隐藏邀请
        $(".list-group-item-" + id).hide();
        //设为已读
        $.get('${pageContext.request.contextPath}/user/isRead/' + id + '/${user.id}')
        $.get("${pageContext.request.contextPath}/user/addF/${user.id}/" + id, function (data) {
            if (data === "yes") {
                layer.msg("添加成功", {icon: 1})
            } else {
                layer.msg("添加失败", {icon: 2})
            }
        })
    }

    $(function () {
        $("#addFriendsReq").on("hide.bs.modal", function () {
            top.location.reload();
        })
    })

    function refuse(id) {
        //隐藏邀请
        $(".list-group-item-" + id).hide();
        //设为已读
        $.get('${pageContext.request.contextPath}/user/isRead/' + id + '/${user.id}')
    }

    function showProfile() {
        $.get("${pageContext.request.contextPath}/user/getInfo/${user.id}", function (resp) {
            var r = JSON.parse(resp);
            $("#userNickname").val(r.nickname);
            if (r.sex === 'f') {
                $("#gender").val("f");
            } else {
                $("#gender").val("m");
            }
            $("#age").val(r.age);
            $("#phone").val(r.phone);
            $("#userAvatar").attr("src", r.avatarUrl)
        })
        $('#editProfileModal').modal('show')

    }

    function commit() {
        $.post("${pageContext.request.contextPath}/user/update",
            $("#updateInfo").serializeArray(),
            function (resp) {
                if (resp === "yes") {
                    layer.msg("修改成功", {icon: 1});
                    //修改导航栏头像
                    if ($("#avatarUrl").val()!=='') {
                        $("#avatar", window.parent.frames["topFrame"].document).attr("src", $("#avatarUrl").val())
                    }
                } else {
                    layer.msg("修改失败", {icon: 2});
                }
            })
    }

    $(function () {
        $("#customFile").change(function () {
            var formData = new FormData($('#uploadForm')[0]);
            var localhostPath = window.document.location.href.substring(0, window.document.location.href.indexOf(window.document.location.pathname));
            $.ajax({
                type: 'post',
                url: localhostPath + "${pageContext.request.contextPath}/user/uploadAvatar", //上传文件的请求路径必须是绝对路径
                data: formData,
                cache: false,
                processData: false,
                contentType: false,
                success: function (data) {
                    var a = JSON.parse(data)
                    $("#uploadForm").next().html(a.result);
                    var avatarUrl = localhostPath + "${pageContext.request.contextPath}/avatar/" + a.name
                    $("#userAvatar").attr("src", avatarUrl);
                    $("#avatarUrl").val(avatarUrl);
                },
                error: function () {
                    $("#uploadForm").next().html("上传失败");
                }
            });
        });
    })

</script>


</body>
</html>
