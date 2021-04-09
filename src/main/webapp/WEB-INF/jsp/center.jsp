<%--
  Created by IntelliJ IDEA.
  User: 兰擎
  Date: 2020/12/27
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>个人中心</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/global_v1_min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/global_v10.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/animate.min.css"/>
    <script src="${pageContext.request.contextPath}/static/js/login.js"></script>
    <style>
    .l{
        float: left;
        width: 221px;
        position:absolute;
        left: 0;
        height: 100%;
        background: #f5f5f5;
    }
    .r{
        width: 100%;
    }
    .left{
        width: 80%;
        position:relative;
        padding-left: 221px;
        padding-right: 0;
    }
    .userMod .pt .pic img {
        height: 90px;
    }
    body{
        background: #ffffff;
    }
    </style>
</head>

<body>

<div class="left">
    <div class="l animate__animated animate__slideInLeft">
        <!--用户模块-->
        <div class="userMod " >
            <div class="pt">
                <div class="pic" id="userImg">
                    <img src="${user.faceUrl}">
                </div>
                <div class="txt" id="userNick">${user.name}</div>
                <div style="height: 20px"></div>
                <div class="txt" id="userBalance" style="text-align: center"><font style="font-size: 15px;color: #ff2b2a">余额:<font style="font-family:'Comic Sans MS'">&nbsp&nbsp&nbsp¥</font></font>
                    <span> </span>
<%--                    <input type="text" name="userBalance" readonly = readonly value="${user.userBalance}" style="width: 80px; height: 30px;">--%>
                </div>

            </div>
        </div><!--[if !IE]>|xGv00|4c5b1d5992454edca52120066dbe6c66<![endif]-->

        <!--页面导航-->
        <div class="navMod" id="navMod">
            <div class="list">
                <ul>

                    <li data-type="Comment" class="now" data-now="now">
                        <a href="#"  class="nav02"><span class="icon"></span>查看购买的书</a>
                    </li>
                    <li data-type="News" class="" data-now="">
                        <a href="javascript:" class="nav03"><span class="icon"></span>查看借阅的书<span class="dot" style="display:none;"></span></a>
                    </li>
                    <li data-type="Setup" class="" data-now="">
                        <a href="javascript:" class="nav04"><span class="icon"></span>个人设置</a>
                    </li>
                    <li data-type="Fileupload" class="" data-now="">
                        <a href="javascript:" class="nav01"><span class="icon"></span>文档中心</a>
                    </li>
                </ul>
            </div>
        </div><!--[if !IE]>|xGv00|32d0a70afb9587b2a85260b5e41c2946<![endif]-->
    </div>
    <div class="r" id="conBox">
        <!--我的收藏-->
        <!-- #include virtual="/2017/iLike.htm"-->

        <!--购买的书-->
        <div id="iComment" style="display: block;">

            <iframe data_height="auto" width="100%" frameborder="no" allowtransparency="true" scrolling="no" name="commentIframe" id="commentIframe" data-adid="" src="sold?method=queryByIdSold1&userId=${user.id}" style="height: 100%;"></iframe>
        </div><!--[if !IE]>|xGv00|a9cd4b3e574cc21a98c11de111406dc6<![endif]-->

        <!--借阅的书-->
        <div id="iNews" style="display: none;">
            <iframe data_height="auto" width="100%" frameborder="no" allowtransparency="true" scrolling="no" name="commentIframe" id="commentIframe" data-adid="" src="borrow?method=queryByIdBorrow2&userId=${user.id}" style="height: 100%;"></iframe>
        </div><!--[if !IE]>|xGv00|304ae54643a7a7d8ad75c67a9966c214<![endif]-->

        <!--个人设置-->
        <div id="iSetup" style="display: none;">
            <iframe data_height="auto" width="100%" frameborder="no" allowtransparency="true" scrolling="no" name="commentIframe" id="commentIframe" data-adid="" src="userUpdate2.jsp" style="height: 100%;"></iframe>
        </div><!--[if !IE]>|xGv00|b54ccc1edd81d42ad2264b0c7cfb512c<![endif]-->

        <!--文档中心-->
        <div id="iFileupload" style="display: none;">
            <iframe data_height="auto" width="100%" frameborder="no" allowtransparency="true" scrolling="no" name="commentIframe" id="commentIframe" data-adid="" src="document?method=documentQueryAll" style="height: 100%;"></iframe>
        </div><!--[if !IE]>|xGv00|b54ccc1edd81d42ad2264b0c7cfb512c<![endif]-->
    </div>

</div>
<script>var bossData={pageType:"",vertical:""};</script>
<script>
    //点击触发点击上报
    if(document.addEventListener){
        document.addEventListener("click", registerZone2, false);
    }else if(document.attachEvent){
        document.attachEvent("onclick", registerZone2);
    }else{
        document.onclick = registerZone2;
    };
    var gImage;
    //点击上报
    function registerZone2(param,clickType){
        var loopTryNum = 10;//向上查询级数
        var loop=4;//标签向上查询的级数
        var bossID = 1408; //上报ID，通常固定
        var pageType=bossData && bossData.pageType || '';
        var vertical=bossData && bossData.vertical || '';
        var purl='';
        var zoneId='';
        try{
            var num=document.cookie.match(new RegExp('(^|)o_cookie=([^;]*)(;|$)'));
            var iQQ=(num==null?"":unescape(num[2]));
            if(typeof clickType == 'undefined'){//页面结构上加bosszone触发上报
                var ev = window.event || param;
                var et = ev.srcElement || ev.target;
                //向上查找A标签
                while(loop-- > 0){
                    if("A"==et.tagName || "BODY"==et.tagName){
                        break;
                    }else{
                        et = et.parentNode;
                    }
                };
                var type=et.tagName;
                if (type != "A") {return;}
                //获取点击链接
                purl = et.href;
                for(var i=loopTryNum-1,tagNode=et;i>=0;i--,tagNode=tagNode.parentNode){
                    if(tagNode.attributes['bossZone']){
                        zoneId = tagNode.attributes['bossZone'].nodeValue;
                    }else if(tagNode.attributes['bosszone']){
                        zoneId = tagNode.attributes['bosszone'].nodeValue;
                    }else if(tagNode.attributes['BossZone']){
                        zoneId = tagNode.attributes['BossZone'].nodeValue;
                    }else if(tagNode.attributes['Bosszone']){
                        zoneId = tagNode.attributes['Bosszone'].nodeValue;
                    }
                    if(zoneId) break;
                }
                if(!zoneId){return;}

            }else{//js手动触发上报
                zoneId = param.bossZone;
                purl = param.url || '';
            }
            var localUrl = location.href;//当前页面url
            var iurl = 'https://btrace.qq.com/kvcollect?BossId='+bossID+'&sOp='+zoneId+'&iQQ='+iQQ+'&sUrl='+escape(location.href)+'&ran='+Math.random();
            gImage = new Image(1,1);
            gImage.src = iurl;
        }catch(e){}
    };
    //曝光上报
    function ExposureBoss(id,name){
        var bossID = 1604;
        try{
            var num = document.cookie.match(new RegExp('(^|)o_cookie=([^;]*)(;|$)'));
            var iQQ = (num==null?"":unescape(num[2]));
            var iurl = 'https://btrace.qq.com/kvcollect?BossId='+bossID+'&sOp='+name+'&iQQ='+iQQ+'&sUrl='+escape(location.href)+'&ran='+Math.random();
            gImage = new Image(1,1);
            gImage.src = iurl;
        }catch(e){}
    };
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/global_v10.js"></script>
</body>
</html>
