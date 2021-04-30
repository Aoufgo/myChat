<%--
  Created by IntelliJ IDEA.
  User: aoufgo
  Date: 2021/4/28
  Time: 下午10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>

    <!-- Bundle Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugin/fontawesome/css/all.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bundle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/app.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/animate.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css"/>
    <script src="${pageContext.request.contextPath}/static/plugin/layui/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bundle.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/sendCode.js"></script>


    <!-- App scripts -->
    <script src="${pageContext.request.contextPath}/static/js/app.min.js"></script>

    <style>
        .input-group-append:hover {
            color: #c4c4c4;
        }

        body.form-membership {
            padding: 0;
        }

        .overlay-gradient-bottom:after {
            display: none;
        }

        .btn:hover {
            background-color: #3b99ab;
        }

        #sendCode:hover {
            background-color: #c4c4c4;
        }

        svg rect {
            fill: #3b99ab;
        }

        #Layer_1 {
            position: absolute;
            right: 48.7%;
            top: 60%;
            z-index: 999;
            display: none;
        }

    </style>
</head>
<body class="form-membership">
<div class="loader loader--style6" title="5">
    <svg version="1.1" id="Layer_1"  xmlns="http://www.w3.org/2000/svg"
         xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
         width="24px" height="30px" viewBox="0 0 24 30" style="enable-background:new 0 0 50 50;" xml:space="preserve">
    <rect x="0" y="13" width="4" height="5" fill="#333">
        <animate attributeName="height" attributeType="XML"
                 values="5;21;5"
                 begin="0s" dur="0.6s" repeatCount="indefinite"/>
        <animate attributeName="y" attributeType="XML"
                 values="13; 5; 13"
                 begin="0s" dur="0.6s" repeatCount="indefinite"/>
    </rect>
        <rect x="10" y="13" width="4" height="5" fill="#333">
            <animate attributeName="height" attributeType="XML"
                     values="5;21;5"
                     begin="0.15s" dur="0.6s" repeatCount="indefinite"/>
            <animate attributeName="y" attributeType="XML"
                     values="13; 5; 13"
                     begin="0.15s" dur="0.6s" repeatCount="indefinite"/>
        </rect>
        <rect x="20" y="13" width="4" height="5" fill="#333">
            <animate attributeName="height" attributeType="XML"
                     values="5;21;5"
                     begin="0.3s" dur="0.6s" repeatCount="indefinite"/>
            <animate attributeName="y" attributeType="XML"
                     values="13; 5; 13"
                     begin="0.3s" dur="0.6s" repeatCount="indefinite"/>
        </rect>
  </svg>
    <div class="bg col-12 order-lg-2 order-1 min-vh-100 background-walk-y position-relative overlay-gradient-bottom"
         style="position: absolute !important;">
        <div class="form-wrapper">

            <!-- logo -->
            <div class="logo">
                <img src="dist/media/img/small-logo.png" alt="logo">
            </div>
            <!-- ./ logo -->

            <h5>登录</h5>

            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#password" role="tab"
                       aria-controls="password" aria-selected="true">账号密码登录</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#codeTab" role="tab" aria-controls="code"
                       aria-selected="false">手机登录</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane show active" id="password" role="tabpanel">
                    <!-- form -->
                    <form method="post" action="${pageContext.request.contextPath}/user/login">
                        <div class="form-group">
                            <input type="text" name="id" class="form-control" placeholder="请输入账号" required autofocus>
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" class="form-control" placeholder="请输入密码" required>
                        </div>
                        <div class="form-group d-flex justify-content-between">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" checked="" id="customCheck1">
                                <label class="custom-control-label" for="customCheck1">记住我</label>
                            </div>

                            <a data-target="#faceLogin" data-toggle="modal" style="cursor: pointer"><i
                                    class="far fa-smile-wink"
                                    style="size:1px"></i>人脸登录
                            </a>
                            <a onclick="forgetPassword()" style="cursor: pointer">忘记密码? </a>
                        </div>
                        <button class="btn btn-primary btn-block" onclick="$('#Layer_1').show();" type="submit">登入</button>
                    </form>
                    <!-- ./ form -->
                </div>
                <div class="tab-pane show" id="codeTab" role="tabpanel">
                    <form method="post" action="${pageContext.request.contextPath}/user/codeLogin">
                        <div class=" form-group">
                            <input type="text" name="phone" id="userPhone" class="form-control" placeholder="请输入手机号"
                                   required
                                   autofocus>
                        </div>
                        <div class="form-group ">
                            <div class="input-group">
                                <input type="text" name="code" id="code" class="form-control code"
                                       placeholder="请输入验证码">
                                <button class="input-group-append" type="button"
                                        style="padding: 0; cursor: pointer;border: none;background-color: #ffffff;height: 42px;">
                                    <span class="input-group-text" id="sendCode">发送</span>
                                </button>
                            </div>
                        </div>
                        <button class="btn btn-primary btn-block" onclick="$('#Layer_1').show();" type="submit">登入</button>
                    </form>
                </div>
                <hr>
                <p class="text-muted">还没有账号?</p>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-light btn-sm">现在注册!</a>
            </div>
        </div>
        <!-- faceRegister -->
        <div class="modal fade" id="faceLogin" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            <i class="far fa-smile-wink"></i>人脸登录
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <i class="ti-close"></i>
                        </button>
                    </div>
                    <div class="tab-pane" id="about" role="tabpanel">
                        <center>
                            <form>
                                <div id="media">
                                    <video style="border: #c3cad1 5px!important ;border-radius: 100%;" id="video"
                                           width="280px" height="280px" autoplay></video>
                                    <canvas id="canvas" width="300" height="300"
                                            style="position: absolute;right: 100px;top: 83px"></canvas>
                                    <img src="${pageContext.request.contextPath}/image/portrait/check.svg" id="check"
                                         alt="image" hidden>
                                </div>
                                <div style="height: 20px"></div>
                                <button type="button" id="faceUpload" onclick="loginFace()" class="btn btn-primary">
                                    验证FaceID
                                </button>
                                <div style="height: 20px"></div>
                            </form>
                        </center>
                    </div>
                </div>
            </div>
        </div>

        <%--<div class=" col-12 order-lg-2 order-1 min-vh-100 background-walk-y position-relative overlay-gradient-bottom"--%>
        <%--&lt;%&ndash;     data-background="${pageContext.request.contextPath}/image/10-14.jpg"&ndash;%&gt;--%>
        <%--     style="background-image: url(${pageContext.request.contextPath}/image/10-14.jpg);">--%>
        <%--</div>--%>

    </div>
</div>

</body>
<script>
    var a =
    ${type}
    if (a === 3) {
        layer.msg("您还未登录，请登录", {icon: 2})
    }
    if (a === 2) {
        layer.msg("登录失败，不存在此手机号", {icon: 2})
        const element = document.querySelector('.form-wrapper');
        element.classList.add('animate__animated', 'animate__headShake');
    }
    if (a === 7) {
        layer.msg("登录失败，用户名或密码错误，请重新登录.", {icon: 2})
        const element = document.querySelector('.form-wrapper');
        element.classList.remove('animate__fadeInUp', 'animate__faster')
        element.classList.add('animate__animated', 'animate__headShake');
    }
    if (a === 5) {
        layer.msg("验证码错误", {icon: 2})
        const element = document.querySelector('.form-wrapper');
        element.classList.remove('animate__fadeInUp', 'animate__faster')
        element.classList.add('animate__animated', 'animate__headShake');
    }
    if (a === 1) {
        layer.msg("注册成功，请登录。", {icon: 1})
    }
    if (a === 4) {
        const element = document.querySelector('.form-wrapper');
        element.classList.add('animate__animated', 'animate__fadeOutUp', 'animate__faster');
        layer.msg("登录成功", {icon: 1});
        setTimeout("top.location = '${pageContext.request.contextPath}/index'", 500); //延迟
    }
    if (a === 6) {
        layer.msg("退出成功", {icon: 1})
    }

</script>
<script>
    $(function () {
        var d = new Date();
        var hour = d.getHours();
        console.log('现在时间:' + hour)
        if (hour < 4) {
            $(".bg").css("background-image", "url(${pageContext.request.contextPath}/image/20-4.jpg)");
        }
        if (hour >= 4 && hour < 6) {
            $(".bg").css("background-image", "url(${pageContext.request.contextPath}/image/4-6.jpg)");
        }
        if (hour >= 6 && hour < 8) {
            $(".bg").css("background-image", "url(${pageContext.request.contextPath}/image/6-8.jpg)");
        }
        if (hour >= 8 && hour < 10) {
            $(".bg").css("background-image", "url(${pageContext.request.contextPath}/image/8-10.jpg)");
        }
        if (hour >= 10 && hour < 14) {
            $(".bg").css("background-image", "url(${pageContext.request.contextPath}/image/10-14.jpg)");
        }
        if (hour >= 14 && hour < 16) {
            $(".bg").css("background-image", "url(${pageContext.request.contextPath}/image/14-16.jpg)");
        }
        if (hour >= 16 && hour < 18) {
            $(".bg").css("background-image", "url(${pageContext.request.contextPath}/image/16-18.jpg)");
        }
        if (hour >= 18 && hour < 20) {
            $(".bg").css("background-image", "url(${pageContext.request.contextPath}/image/18-20.jpg)");
        }
        if (20 <= hour) {
            $(".bg").css("background-image", "url(${pageContext.request.contextPath}/image/20-4.jpg)");
        }
    })
</script>
<script>
    if (${!empty error}) {
        layer.msg("${error}")
    }
</script>
<script>
    $(function () {
        $("#faceLogin").on("show.bs.modal", function () {
            //获取视频组件
            video = document.getElementById("video")
            //通过浏览器打打开摄像头
            window.stream = navigator.mediaDevices.getUserMedia({
                audio: false,
                video: true,
                video: {//设置分辨率
                    width: 500,
                    height: 500
                }
            }).then(function (mediaStream) {//mediaStream:流
                video.srcObject = mediaStream;
                video.autoloadmatadata = function () {
                    video.play();
                }
            })
        })
        $("#faceLogin").on("hide.bs.modal", function () {
            video.pause();
            video.srcObject = null;
        })
    })

    function loginFace() {
        //获取canvas对象
        var canvas = document.getElementById("canvas");
        var c = canvas.getContext("2d");
        //canvas获取图片
        c.drawImage(video, 0, 0, 300, 300)
        //从画布对象中获取图片信息
        var imgSrc = canvas.toDataURL();
        //对字符串拆分，获取图片内容
        var img = imgSrc.split("base64,")[1];
        //关闭人脸窗口
        $("#faceLogin").modal("hide");
        //打开加载动画
        $("#Layer_1").show();
        //发送ajax请求完成人脸登录

        $.ajax({
            url: "${pageContext.request.contextPath}/user/faceLogin",
            type: "post",
            data: {"img": img},
            success: function (resp) {
                var json = JSON.parse(resp);
                if (json.msg === "登录成功") {
                    //跳转到登录成功后的页面
                    $("#Layer_1").hide();
                    const element = document.querySelector('.form-wrapper');
                    element.classList.add('animate__animated', 'animate__fadeOutUp', 'animate__faster');
                    layer.msg("登录成功", {icon: 1});
                    setTimeout("top.location = '${pageContext.request.contextPath}/index'", 500); //延迟
                } else {
                    layer.msg(json.msg, {icon: 2})
                }
            }
        })
    }
</script>
</html>
