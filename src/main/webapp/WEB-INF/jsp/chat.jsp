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
            display: flex;
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
            background-color: #26a69a;
            color: #fff;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            border-radius: 50%;
            margin-left: auto;
        }
    </style>
</head>
<body>
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
                    <i data-feather="user-plus" class="mr-2"></i> Add Friends
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="ti-close"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="alert alert-info">Send invitations to friends.</div>
                <form>
                    <div class="form-group">
                        <label for="emails" class="col-form-label">Email addresses</label>
                        <input type="text" class="form-control" id="emails">
                    </div>
                    <div class="form-group">
                        <label for="message" class="col-form-label">Invitation message</label>
                        <textarea class="form-control" id="message"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </div>
</div>
<!-- ./ Add friends modal -->

<!-- New group modal -->
<div class="modal fade" id="newGroup" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i data-feather="users" class="mr-2"></i> New Group
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="ti-close"></i>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="group_name" class="col-form-label">Group name</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="group_name">
                            <div class="input-group-append">
                                <button class="btn btn-light" data-toggle="tooltip" title="Emoji" type="button">
                                    <i data-feather="smile"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <p class="mb-2">The group members</p>
                    <div class="form-group">
                        <div class="avatar-group">
                            <figure class="avatar" data-toggle="tooltip" title="Tobit Spraging">
                                <span class="avatar-title bg-success rounded-circle">T</span>
                            </figure>
                            <figure class="avatar" data-toggle="tooltip" title="Cloe Jeayes">
                                <img src="./dist/media/img/avatar6.png" class="rounded-circle" alt="image">
                            </figure>
                            <figure class="avatar" data-toggle="tooltip" title="Marlee Perazzo">
                                <span class="avatar-title bg-warning rounded-circle">M</span>
                            </figure>
                            <figure class="avatar" data-toggle="tooltip" title="Stafford Pioch">
                                <img src="./dist/media/img/avatar2.png" class="rounded-circle" alt="image">
                            </figure>
                            <figure class="avatar" data-toggle="tooltip" title="Bethena Langsdon">
                                <span class="avatar-title bg-info rounded-circle">B</span>
                            </figure>
                            <a href="#" title="Add friends">
                                <figure class="avatar">
                                    <span class="avatar-title bg-primary rounded-circle">
                                        <i data-feather="plus"></i>
                                    </span>
                                </figure>
                            </a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-form-label">Description</label>
                        <textarea class="form-control" id="description"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Create Group</button>
            </div>
        </div>
    </div>
</div>
<!-- ./ New group modal -->

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
<!-- ./ Edit profile modal -->

<!-- Header -->
<%--<header class="main-header">--%>
<%--    <div id="logo">--%>
<%--&lt;%&ndash;        <a href="#">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <img src="dist/media/img/logo.png" alt="logo">&ndash;%&gt;--%>
<%--&lt;%&ndash;        </a>&ndash;%&gt;--%>
<%--    </div>--%>
<%--    <div class="header-nav">--%>
<%--        <ul class="nav">--%>
<%--            <li><a href="#" data-navigation-target="contact-information">Profile</a></li>--%>
<%--            <li><a href="#" data-navigation-target="favorites">Favorites</a></li>--%>
<%--            <li><a href="#" data-navigation-target="archived">Archived</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--    <div class="header-right">--%>
<%--&lt;%&ndash;        <div class="navbar-toggler">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <a href="#">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <i data-feather="menu"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="dropdown">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <a href="#" data-toggle="dropdown">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <span class="mr-2 d-none d-sm-inline-block">Mirabelle Tow</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <figure class="avatar">&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                    <img src="./dist/media/img/avatar3.png" class="rounded-circle" alt="image">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                </figure>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="dropdown-menu dropdown-menu-right">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <a href="#" class="dropdown-item" data-navigation-target="contact-information">Profile</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <a href="#" class="dropdown-item" data-toggle="modal" data-target="#settingModal">Settings</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="dropdown-divider"></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <a href="login.html" class="dropdown-item text-danger">Logout</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</header>--%>
<!-- ./ Header -->

<!-- Layout -->
<div class="layout">

    <!-- Content -->
    <div class="content" style="height: 108.9%;">


        <!-- Friends sidebar -->
        <div id="friends" class="sidebar animate__animated animate__slideInLeft">
            <header>
                <span>Friends</span>
                <ul class="list-inline">
                    <li class="list-inline-item" data-toggle="tooltip" title="Add friends">
                        <a class="btn btn-outline-light" href="#" data-toggle="modal" data-target="#addFriends">
                            <i data-feather="user-plus"></i>
                        </a>
                    </li>

                </ul>
            </header>
            <form>
                <input type="text" class="form-control" placeholder="Search">
            </form>
            <div class="sidebar-body">
                <p>${friends.size()} Friends</p>
                <div>
                    <ul class="list-group list-group-flush">
                        <c:forEach items="${friends}" var="f">
                            <li class="list-group-item">
                                <div>
                                    <c:if test="${f.user.status == 1}">
                                    <figure class="avatar avatar-state-success">
                                        </c:if>
                                        <c:if test="${f.user.status != 1}">
                                        <figure class="avatar avatar-state-warning">
                                            </c:if>
                                            <span class="avatar-title bg-success rounded-circle">${fn:substring(f.user.name,0,1)}</span>
                                        </figure>
                                </div>
                                <div class="users-list-body">
                                    <div>
                                        <h5>${f.user.nickname}</h5>
                                        <p>${f.user.name}</p>
                                    </div>
                                    <div class="new-message-count">1</div>
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

        <!-- New chat sidebar -->
        <div id="new-chat" class="sidebar">
            <header>
                <span>New Chat</span>
                <ul class="list-inline">
                    <li class="list-inline-item" data-toggle="tooltip" title="Create Group">
                        <a class="btn btn-outline-light" href="#" data-toggle="modal" data-target="#newGroup">
                            <i data-feather="users"></i>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a href="#" class="btn btn-danger sidebar-close">
                            <i data-feather="x"></i>
                        </a>
                    </li>
                </ul>
            </header>
            <form>
                <input type="text" class="form-control" placeholder="Search">
            </form>
            <div class="sidebar-body">
                <ul class="list-group list-group-flush">

                    <li class="list-group-item">
                        <div>
                            <figure class="avatar">
                                <img src="./dist/media/img/avatar1.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div class="users-list-body">
                            <div>
                                <h5>Harrietta Souten</h5>
                                <p>Dental Hygienist</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item">New chat</a>
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
                    <li class="list-group-item">
                        <div>
                            <figure class="avatar avatar-state-warning">
                                <span class="avatar-title bg-success rounded-circle">A</span>
                            </figure>
                        </div>
                        <div class="users-list-body">
                            <div>
                                <h5>Aline McShee</h5>
                                <p>Marketing Assistant</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item">New chat</a>
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
                    <li class="list-group-item">
                        <div>
                            <figure class="avatar avatar-state-success">
                                <img src="./dist/media/img/avatar10.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div class="users-list-body">
                            <div>
                                <h5>Brietta Blogg</h5>
                                <p>Actuary</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item">New chat</a>
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
                    <li class="list-group-item">
                        <div>
                            <figure class="avatar avatar-state-success">
                                <img src="./dist/media/img/avatar5.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div class="users-list-body">
                            <div>
                                <h5>Karl Hubane</h5>
                                <p>Chemical Engineer</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item">New chat</a>
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
                    <li class="list-group-item">
                        <div>
                            <figure class="avatar">
                                <img src="./dist/media/img/avatar8.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div class="users-list-body">
                            <div>
                                <h5>Jillana Tows</h5>
                                <p>Project Manager</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item">New chat</a>
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
                    <li class="list-group-item">
                        <div>
                            <figure class="avatar avatar-state-success">
                                <span class="avatar-title bg-info rounded-circle">AD</span>
                            </figure>
                        </div>
                        <div class="users-list-body">
                            <div>
                                <h5>Alina Derington</h5>
                                <p>Nurse</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item">New chat</a>
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
                    <li class="list-group-item">
                        <div>
                            <figure class="avatar avatar-state-secondary">
                                <span class="avatar-title bg-warning rounded-circle">S</span>
                            </figure>
                        </div>
                        <div class="users-list-body">
                            <div>
                                <h5>Stevy Kermeen</h5>
                                <p>Associate Professor</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item">New chat</a>
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
                    <li class="list-group-item">
                        <div>
                            <figure class="avatar">
                                <img src="./dist/media/img/avatar7.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div class="users-list-body">
                            <div>
                                <h5>Stevy Kermeen</h5>
                                <p>Senior Quality Engineer</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item">New chat</a>
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
                    <li class="list-group-item">
                        <div>
                            <figure class="avatar">
                                <img src="./dist/media/img/avatar3.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div class="users-list-body">
                            <div>
                                <h5>Gloriane Shimmans</h5>
                                <p>Web Designer</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item">New chat</a>
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
                    <li class="list-group-item">
                        <div>
                            <figure class="avatar avatar-state-warning">
                                <span class="avatar-title bg-secondary rounded-circle">B</span>
                            </figure>
                        </div>
                        <div class="users-list-body">
                            <div>
                                <h5>Bernhard Perrett</h5>
                                <p>Software Engineer</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item">New chat</a>
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
                </ul>
            </div>
        </div>
        <!-- ./ New chat sidebar -->

        <!-- Favorites sidebar -->
        <div id="favorites" class="sidebar">
            <header>
                <span>Favorites</span>
                <ul class="list-inline">
                    <li class="list-inline-item">
                        <a href="#" class="btn btn-danger sidebar-close">
                            <i data-feather="x"></i>
                        </a>
                    </li>
                </ul>
            </header>
            <form>
                <input type="text" class="form-control" placeholder="Search">
            </form>
            <div class="sidebar-body">
                <ul class="list-group list-group-flush users-list">
                    <li class="list-group-item">
                        <div class="users-list-body">
                            <div>
                                <h5>Jennica Kindred</h5>
                                <p>I know how important this file is to you. You can trust me ;)</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item btn-open-chat">Open</a>
                                            <a href="#" class="dropdown-item">Remove favorites</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="users-list-body">
                            <div>
                                <h5>Marvin Rohan</h5>
                                <p>Lorem ipsum dolor sitsdc sdcsdc sdcsdcs</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item btn-open-chat">Open</a>
                                            <a href="#" class="dropdown-item">Remove favorites</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="users-list-body">
                            <div>
                                <h5>Frans Hanscombe</h5>
                                <p>Lorem ipsum dolor sitsdc sdcsdc sdcsdcs</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item btn-open-chat">Open</a>
                                            <a href="#" class="dropdown-item">Remove favorites</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="users-list-body">
                            <div>
                                <h5>Karl Hubane</h5>
                                <p>Lorem ipsum dolor sitsdc sdcsdc sdcsdcs</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item btn-open-chat">Open</a>
                                            <a href="#" class="dropdown-item">Remove favorites</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- ./ Stars sidebar -->

        <!-- Archived sidebar -->
        <div id="archived" class="sidebar">
            <header>
                <span>Archived</span>
                <ul class="list-inline">
                    <li class="list-inline-item">
                        <a href="#" class="btn btn-danger sidebar-close">
                            <i data-feather="x"></i>
                        </a>
                    </li>
                </ul>
            </header>
            <form>
                <input type="text" class="form-control" placeholder="Search">
            </form>
            <div class="sidebar-body">
                <ul class="list-group list-group-flush users-list">
                    <li class="list-group-item">
                        <figure class="avatar">
                            <span class="avatar-title bg-danger rounded-circle">M</span>
                        </figure>
                        <div class="users-list-body">
                            <div>
                                <h5>Mercedes Pllu</h5>
                                <p>I know how important this file is to you. You can trust me ;)</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item btn-open-chat">Open</a>
                                            <a href="#" class="dropdown-item">Restore</a>
                                            <div class="dropdown-divider"></div>
                                            <a href="#" class="dropdown-item text-danger">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <figure class="avatar">
                            <span class="avatar-title bg-secondary rounded-circle">R</span>
                        </figure>
                        <div class="users-list-body">
                            <div>
                                <h5>Rochelle Golley</h5>
                                <p>Lorem ipsum dolor sitsdc sdcsdc sdcsdcs</p>
                            </div>
                            <div class="users-list-action">
                                <div class="action-toggle">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" href="#">
                                            <i data-feather="more-horizontal"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="#" class="dropdown-item btn-open-chat">Open</a>
                                            <a href="#" class="dropdown-item">Restore</a>
                                            <div class="dropdown-divider"></div>
                                            <a href="#" class="dropdown-item text-danger">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- ./ Archived sidebar -->

        <!-- Profile sidebar -->
        <div id="contact-information" class="sidebar">
            <header>
                <span>Profile</span>
                <ul class="list-inline">
                    <li class="list-inline-item">
                        <a href="#" class="btn btn-outline-light" data-toggle="modal" data-target="#editProfileModal"
                           title="Edit profile">
                            <i data-feather="edit-2"></i>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a href="#" class="btn btn-danger sidebar-close">
                            <i data-feather="x"></i>
                        </a>
                    </li>
                </ul>
            </header>
            <div class="sidebar-body">
                <div class="text-center">
                    <figure class="avatar avatar-xl mb-4">
                        <img src="./dist/media/img/avatar3.png" class="rounded-circle" alt="image">
                    </figure>
                    <h5 class="mb-1">Mirabelle Tow</h5>
                    <small class="text-muted font-italic">Last seen: Today</small>
                    <ul class="nav nav-tabs justify-content-center mt-5" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                               aria-controls="home" aria-selected="true">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                               aria-controls="profile" aria-selected="false">Media</a>
                        </li>
                    </ul>
                </div>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <p class="text-muted">Lorem ipsum is a pseudo-Latin text used in web design, typography,
                            layout, and printing in place of English to emphasise design elements over content.
                            It's also called placeholder (or filler) text. It's a convenient tool for
                            mock-ups.</p>
                        <div class="mt-4 mb-4">
                            <h6>Phone</h6>
                            <p class="text-muted">(555) 555 55 55</p>
                        </div>
                        <div class="mt-4 mb-4">
                            <h6>City</h6>
                            <p class="text-muted">Germany / Berlin</p>
                        </div>
                        <div class="mt-4 mb-4">
                            <h6>Website</h6>
                            <p>
                                <a href="#">www.franshanscombe.com</a>
                            </p>
                        </div>
                        <div class="mt-4 mb-4">
                            <h6 class="mb-3">Social media accounts</h6>
                            <ul class="list-inline social-links">
                                <li class="list-inline-item">
                                    <a href="#" class="btn btn-sm btn-floating btn-facebook"
                                       data-toggle="tooltip" title="Facebook">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#" class="btn btn-sm btn-floating btn-twitter"
                                       data-toggle="tooltip" title="Twitter">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#" class="btn btn-sm btn-floating btn-whatsapp"
                                       data-toggle="tooltip" title="Whatsapp">
                                        <i class="fa fa-whatsapp"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#" class="btn btn-sm btn-floating btn-linkedin"
                                       data-toggle="tooltip" title="Linkedin">
                                        <i class="fa fa-linkedin"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#" class="btn btn-sm btn-floating btn-google" data-toggle="tooltip"
                                       title="Google">
                                        <i class="fa fa-google"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#" class="btn btn-sm btn-floating btn-instagram"
                                       data-toggle="tooltip" title="Instagram">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="mt-4 mb-4">
                            <h6 class="mb-3">Settings</h6>
                            <div class="form-group">
                                <div class="form-item custom-control custom-switch">
                                    <input type="checkbox" class="custom-control-input" id="customSwitch11">
                                    <label class="custom-control-label" for="customSwitch11">Block</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-item custom-control custom-switch">
                                    <input type="checkbox" class="custom-control-input" checked=""
                                           id="customSwitch12">
                                    <label class="custom-control-label" for="customSwitch12">Mute</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-item custom-control custom-switch">
                                    <input type="checkbox" class="custom-control-input" id="customSwitch13">
                                    <label class="custom-control-label" for="customSwitch13">Get
                                        notification</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <h6 class="mb-3 d-flex align-items-center justify-content-between">
                            <span>Recent Files</span>
                            <a href="#" class="btn btn-link small">
                                <i data-feather="upload" class="mr-2"></i> Upload
                            </a>
                        </h6>
                        <div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item pl-0 pr-0 d-flex align-items-center">
                                    <a href="#">
                                        <i class="fa fa-file-pdf-o text-danger mr-2"></i> report4221.pdf
                                    </a>
                                </li>
                                <li class="list-group-item pl-0 pr-0 d-flex align-items-center">
                                    <a href="#">
                                        <i class="fa fa-image text-muted mr-2"></i> avatar_image.png
                                    </a>
                                </li>
                                <li class="list-group-item pl-0 pr-0 d-flex align-items-center">
                                    <a href="#">
                                        <i class="fa fa-file-excel-o text-success mr-2"></i>
                                        excel_report_file2020.xlsx
                                    </a>
                                </li>
                                <li class="list-group-item pl-0 pr-0 d-flex align-items-center">
                                    <a href="#">
                                        <i class="fa fa-file-text-o text-warning mr-2"></i> articles342133.txt
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Profile sidebar -->

        <!-- Chat -->
        <iframe width="100%" class="chat" id="frame" height="100%" src="${pageContext.request.contextPath}/chat_page"
                frameborder="0" data-id="" seamless></iframe>


    </div>
    <!-- ./ Content -->

</div>
<!-- ./ Layout -->

<!-- Bundle -->
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script>
    // $(function () {
    //     var width = $("#friends").width();
    //     console.log(width)
    //     if (width<336.172){
    //         $("#frame").hide();
    //     }
    // })
</script>
<script src="${pageContext.request.contextPath}/static/js/bundle.js"></script>

<!-- App scripts -->
<script src="${pageContext.request.contextPath}/static/js/app.min.js"></script>

<!-- Examples -->
<script src="${pageContext.request.contextPath}/static/js/examples.js"></script>
<script>
    if (${!empty error}) {
        layer.msg("${error}")
    }
</script>

</body>
</html>
