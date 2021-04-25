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
                        <img src="./dist/media/svg/undraw_warning_cyit.svg" class="img-fluid" alt="image">
                    </div>
                </div>
                <p class="lead text-center">Application disconnected</p>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-success btn-lg">Reconnect</button>
                <a href="login.html" class="btn btn-link">Logout</a>
            </div>
        </div>
    </div>
</div>
<!-- ./ Disconnected modal -->

<!-- Voice call modal -->
<div class="modal call fade" id="call" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="call">
                    <div>
                        <figure class="mb-4 avatar avatar-xl">
                            <img src="./dist/media/img/avatar7.png" class="rounded-circle" alt="image">
                        </figure>
                        <h4>Brietta Blogg <span class="text-success">calling...</span></h4>
                        <div class="action-button">
                            <button type="button" class="btn btn-danger btn-floating btn-lg" data-dismiss="modal">
                                <i data-feather="x"></i>
                            </button>
                            <button type="button" class="btn btn-success btn-pulse btn-floating btn-lg">
                                <i data-feather="phone"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ./ Voice call modal -->

<!-- voice call modal -->
<div class="modal call fade" id="videoCall" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="call">
                    <div>
                        <figure class="mb-4 avatar avatar-xl">
                            <img src="./dist/media/img/avatar4.png" class="rounded-circle" alt="image">
                        </figure>
                        <h4>Brietta Blogg <span class="text-success">video calling...</span></h4>
                        <div class="action-button">
                            <button type="button" class="btn btn-danger btn-floating btn-lg" data-dismiss="modal">
                                <i data-feather="x"></i>
                            </button>
                            <button type="button" class="btn btn-success btn-pulse btn-floating btn-lg">
                                <i data-feather="video"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ./ voice call modal -->

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
                        <label for="respMessage" class="col-form-label">请求信息</label>
                        <textarea class="form-control" id="respMessage"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">发送</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- ./ Add friends modal -->
<!-- Add friends modal -->
<div class="modal fade" id="addFriendsResp" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i data-feather="mail" class="mr-2"></i> 好友请求
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="top.location.reload()">
                    <i class="ti-close"></i>
                </button>
            </div>
            <div class="modal-body" id="resplist"></div>
        </div>
    </div>
</div>
<!-- ./ Add friends modal -->

<!-- Setting modal -->
<div class="modal fade" id="settingModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i data-feather="settings" class="mr-2"></i> Settings
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="ti-close"></i>
                </button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#account" role="tab" aria-controls="account"
                           aria-selected="true">Account</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#notification" role="tab"
                           aria-controls="notification" aria-selected="false">Notification</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
                           aria-selected="false">Security</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane show active" id="account" role="tabpanel">
                        <div class="form-item custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" checked id="customSwitch1">
                            <label class="custom-control-label" for="customSwitch1">Allow connected contacts</label>
                        </div>
                        <div class="form-item custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" checked id="customSwitch2">
                            <label class="custom-control-label" for="customSwitch2">Confirm message requests</label>
                        </div>
                        <div class="form-item custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" checked id="customSwitch3">
                            <label class="custom-control-label" for="customSwitch3">Profile privacy</label>
                        </div>
                        <div class="form-item custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="customSwitch4">
                            <label class="custom-control-label" for="customSwitch4">Developer mode options</label>
                        </div>
                        <div class="form-item custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" checked id="customSwitch5">
                            <label class="custom-control-label" for="customSwitch5">Two-step security
                                verification</label>
                        </div>
                    </div>
                    <div class="tab-pane" id="notification" role="tabpanel">
                        <div class="form-item custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" checked id="customSwitch6">
                            <label class="custom-control-label" for="customSwitch6">Allow mobile notifications</label>
                        </div>
                        <div class="form-item custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="customSwitch7">
                            <label class="custom-control-label" for="customSwitch7">Notifications from your
                                friends</label>
                        </div>
                        <div class="form-item custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="customSwitch8">
                            <label class="custom-control-label" for="customSwitch8">Send notifications by email</label>
                        </div>
                    </div>
                    <div class="tab-pane" id="contact" role="tabpanel">
                        <div class="form-item custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="customSwitch9">
                            <label class="custom-control-label" for="customSwitch9">Suggest changing passwords every
                                month.</label>
                        </div>
                        <div class="form-item custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" checked id="customSwitch10">
                            <label class="custom-control-label" for="customSwitch10">Let me know about suspicious
                                entries to your account</label>
                        </div>
                        <div class="form-item">
                            <p>
                                <a class="btn btn-light" data-toggle="collapse" href="#collapseExample" role="button"
                                   aria-expanded="false"
                                   aria-controls="collapseExample">
                                    <i data-feather="plus" class="mr-2"></i> Security Questions
                                </a>
                            </p>
                            <div class="collapse" id="collapseExample">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Question 1">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Answer 1">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Question 2">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Answer 2">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>
<!-- ./ Setting modal -->

<!-- Edit profile modal -->
<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i data-feather="edit-2" class="mr-2"></i> Edit Profile
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="ti-close"></i>
                </button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#personal" role="tab"
                           aria-controls="personal" aria-selected="true">Personal</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#about" role="tab" aria-controls="about"
                           aria-selected="false">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#social-links" role="tab"
                           aria-controls="social-links" aria-selected="false">Social Links</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane show active" id="personal" role="tabpanel">
                        <form>
                            <div class="form-group">
                                <label for="fullname" class="col-form-label">Fullname</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="fullname">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i data-feather="user"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Avatar</label>
                                <div class="d-flex align-items-center">
                                    <div>
                                        <figure class="avatar mr-3 item-rtl">
                                            <img src="./dist/media/img/avatar8.png" class="rounded-circle"
                                                 alt="image">
                                        </figure>
                                    </div>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="customFile">
                                        <label class="custom-file-label" for="customFile">Choose file</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="city" class="col-form-label">City</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="city" placeholder="Ex: Columbia">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i data-feather="target"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="phone" class="col-form-label">Phone</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="phone" placeholder="(555) 555 55 55">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i data-feather="phone"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="website" class="col-form-label">Website</label>
                                <input type="text" class="form-control" id="website" placeholder="https://">
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
                <button type="button" class="btn btn-primary">Save</button>
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
                    <li class="list-inline-item" data-toggle="tooltip" title="Friend Resp">
                        <figure class="btn btn-outline-light" id="mail_icon" href="#" data-toggle="modal"
                                data-target="#addFriendsResp">
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
                                            <span class="avatar-title bg-success rounded-circle">${fn:substring(f.user.name,0,1)}</span>
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
                frameborder="0" data-id="" seamless scrolling="no" srcdoc="<p>请添加好友!</p>">
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
</script>
<script>
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
            console.log(data)
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
                if (${!empty respList}) {
                    $("#mail_icon").css("color", "red")
                    <c:forEach items="${respList}" var="r">
                    addResp('${r.fromId}', '${r.msg.trim()}', '${r.sendTime}')
                    </c:forEach>
                }
            }


        })
    })
    $(function () {
        const element = $("#addFriend")
        element.submit(function (e) {
            e.preventDefault();
            var friendId = $(this).find('input[id=friendId]').val();
            var message = $(this).find('textarea[id=respMessage]').val();
            send('${user.name}' + ':' + message, '${user.id}', friendId, new Date().getTime(), "friendResp")
        })
    })

    function agree(id) {
        //隐藏邀请
        $(".list-group-item-" + id).hide();
        //设为已读
        $.get('${pageContext.request.contextPath}/user/isRead/'+id+'/${user.id}')
        $.get("${pageContext.request.contextPath}/user/addF/${user.id}/" + id, function (data) {
            console.log(data)
            if (data === "yes") {
                layer.msg("添加成功", {icon: 1})
            } else {
                layer.msg("添加失败", {icon: 2})
            }
        })
    }

    function refuse(id) {
        //隐藏邀请
        $(".list-group-item-" + id).hide();
        //设为已读
        $.get('${pageContext.request.contextPath}/user/isRead/'+id+'/${user.id}')
    }
</script>


</body>
</html>
