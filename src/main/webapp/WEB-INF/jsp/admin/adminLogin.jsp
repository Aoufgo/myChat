<%--
  Created by IntelliJ IDEA.
  User: teng
  Date: 2021/4/26
  Time: 下午3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
    <title>管理员登录入口</title>




</head>
<body>
<div id="app">
    <div class="login_warp">
        <div class="loginbox fl">
            <div class="login_header">
                <span @click="cur=0" :class="{active:cur==0}">账号登录</span>
                <span @click="cur=1" :class="{active:cur==1}">手机登录</span>
                <span @click="cur=2" :class="{active:cur==2}">刷脸登录</span>
            </div>
            <div class="login_content">
                <form name="numberlogin" method="post" action="${pageContext.request.contextPath}/admin/login">
                <div v-show="cur==0" class="Cbody_item">
                    <div class="form_item"><input type="text" id="adminName" name="adminName"placeholder="用户名"></div>
                    <div class="form_item"><input type="password" id="adminPassword" name="adminPassword" placeholder="密码"></div>
                    <div class="form_item">
                        <div class="fl"><input type="checkbox">记住密码</div>
                        <div class="fr"><a href="javascript:;">找回密码</a></div>
                    </div>
                    <div class="clear"></div>
                    <div class="form_item">
                        <input type="submit" name="adminLogin" value="登录">
                    </div>
                </div>
                </form>
                <div v-show="cur==1" class="Cbody_item">
                    <div class="form_item"><input type="text" name="fname" placeholder="手机号"></div>
                    <div class="form_item"><input type="password" name="fpassword" placeholder="验证码"></div>
                    <div class="form_item">
                        <!-- <div class="fl"><input type="checkbox">记住密码</div>
                        <div class="fr"><a href="javascript:;">找回密码</a></div> -->
                    </div>
                    <div class="clear"></div>
                    <div class="form_item">
                        <input type="submit" name="" value="登录">
                    </div>

                </div>
                <div v-show="cur==2" class="Cbody_item">
                    <div class="qcode"><img src="${pageContext.request.contextPath}/image/qcode.png" width="160" height="160" alt="二维码" /></div>
                    <div class="beizhu">打开手机客户端扫码注册</div>
                </div>
            </div>
        </div>
        <div class="loginrslider fl"></div>
    </div>
</div>
</body>
</html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
<script src="${pageContext.request.contextPath}/static/js/jquery.min63b9.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/plugin/layui/layui.all.js"></script>
<link href="${pageContext.request.contextPath}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/vue.js"></script>
<script type="text/javascript">
    var app = new Vue({
        el: "#app",
        data: {
            cur:0 //默认选中第一个tab
        }
    });
</script>
<script>
    var a=${type};
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
    if (a==9){
        layer.msg("登录成功",{icon:1});
        top.location.href='${pageContext.request.contextPath}/admin_page/adminCenter';
    }
    if (a==8){
        layer.msg("登录失败",{icon:2})
    }
    if (${!empty error}){
        layer.msg("${error}")
    }
</script>
<%--<script>--%>
<%--    var a=${type}--%>
<%--    console.log(a)--%>
<%--    if (a===3){--%>
<%--        layer.msg("您还未登录，请登录",{icon:2})--%>
<%--    }--%>
<%--    if (a===2){--%>
<%--        layer.msg("登录失败，不存在此手机号",{icon:2})--%>
<%--        const element = document.querySelector('.login_div');--%>
<%--        element.classList.add('animate__animated', 'animate__headShake');--%>
<%--    }--%>
<%--    if (a===7){--%>
<%--        layer.msg("登录失败，用户名或密码错误，请重新登录.",{icon:2})--%>
<%--        // const element = document.querySelector('.login_div');--%>
<%--        // element.classList.remove('animate__fadeInUp','animate__faster')--%>
<%--        // element.classList.add('animate__animated', 'animate__headShake');--%>
<%--    }--%>
<%--    if (a===5){--%>
<%--        layer.msg("验证码错误",{icon:2})--%>
<%--        const element = document.querySelector('.login_div');--%>
<%--        element.classList.remove('animate__fadeInUp','animate__faster')--%>
<%--        element.classList.add('animate__animated', 'animate__headShake');--%>
<%--    }--%>
<%--    if (a===1){--%>
<%--        layer.msg("注册成功，请登录。",{icon:1})--%>
<%--    }--%>
<%--    if (a===4){--%>
<%--        // const element = document.querySelector('.login_div');--%>
<%--        // // element.classList.add('animate__animated', 'animate__fadeOutUp','animate__faster');--%>
<%--        // layer.msg("登录成功",{icon:1});--%>
<%--        // // window.parent.frames['topFrame'].location.reload();--%>
<%--        setTimeout("top.location = '${pageContext.request.contextPath}/index'",500); //延迟--%>
<%--    }--%>
<%--    if (a===6){--%>
<%--        layer.msg("退出成功",{icon:1})--%>
<%--    }--%>

<%--</script>--%>
