var webSocket;
$(function () {
    if ("WebSocket" in window) {
        //获取localhost路径,如果为https则将substring第一个参数7改为8
        var localhostPath = window.document.location.href.substring(7, window.document.location.href.indexOf(window.document.location.pathname));
        webSocket = new WebSocket("ws://" + localhostPath + "/aichat/websocket/" + document.getElementById('userId').value);

        //连通之后的回调事件
        webSocket.onopen = function () {
            console.log("已建立连接");
            parent.frames['topFrame'].online1();
            layer.msg('已经连通了websocket', {time: 1000});

        };
        //接收后台服务端的消息
        webSocket.onmessage = function (evt) {
            var received_msg = evt.data;
            console.log("数据已接收:" + received_msg);
            //消息转换成JSON对象
            var obj = JSON.parse(received_msg);
            //如果是发送信息的响应
            if (obj.action === "send") {
                //判断用户是否正在和对象聊天
                if ($("#chatFrame[src$='" + obj.fromId + "']").length > 0) {
                    getTimeToHTML(obj.textMessage, "in", null, 0);
                }
                //信息通知+1
                $(".id2").each(function () {
                    if ($(this).val() === obj.fromId) {
                        const element = $("#new-message-count-" + obj.fromId);
                        element.css('display', 'flex')
                        let m = element.html();
                        console.log(m)
                        if (m === '') {
                            element.html(1);
                        } else {
                            m++;
                            element.html(m);
                        }
                        //将未读消息排序前置
                        if ($(this).parent().prev()) {
                            $(this).parents("ul").children(":first").before($(this).parent());
                        }
                    }
                })
            }
            //判断是否是有用户发送好友响应
            else if (obj.action === "friendReq") {
                $("#mail_icon").css("color", "red")
                addReq(obj.fromId, obj.textMessage, obj.time)
            }
            //判断是否是有用户在线响应
            else if (obj.action === "online") {
                //查询好友列表是否有该id
                $(".id2").each(function () {
                    if ($(this).val() === obj.id) {
                        //修改在线状态
                        const element = $("#avatar-state-" + obj.id);
                        element.removeClass("avatar-state-warning");
                        element.addClass("avatar-state-success");
                        //将所有离线且没有消息的好友后置
                        $(".list-group-item").each(function () {
                            if ($(this).next() && $(this).find(".avatar-state-warning").length > 0 && $(this).find(".new-message-count").html() === "") {
                                $(this).parents("ul").children(":last").after($(this))
                            }
                        })
                    }
                })
            }
            //判断是否是有用户离线响应
            else if (obj.action === "offline") {
                //查询好友列表是否有该id
                $(".id2").each(function () {
                    if ($(this).val() === obj.id) {
                        //修改在线状态
                        const element = $("#avatar-state-" + obj.id);
                        element.removeClass("avatar-state-success");
                        element.addClass("avatar-state-warning");
                        //将好友后置
                        if ($(this).parent().next() && $("#new-message-count-" + obj.id).html() === "") {
                            $(this).parents("ul").children(":last").after($(this).parent());
                        }
                    }
                })
            }
            //判断是否有强制下线响应
            else if (obj.action === "forceOffline") {
                layer.msg("账号多端登录,您已被强制下线....");
                console.log("账号多端登录,您已被强制下线....")
                parent.frames['topFrame'].quit()
            }
        };
        //连接关闭的回调事件
        webSocket.onclose = function () {
            console.log("连接已关闭...");
            layer.msg("连接已经关闭....", {time: 1000});
            $('#disconnected').modal('show')
            parent.frames['topFrame'].offline1();
        };
        //连接错误,服务器关闭回调
        webSocket.onerror = function () {
            webSocket.close();
        }
    } else {
        // 浏览器不支持 WebSocket
        alert("您的浏览器不支持 WebSocket!");
    }
});

function addReq(fromId, message, time) {
    var Time = new Date();
    Time.setTime(time);
    $("#reqList").append(`<li class="list-group-item list-group-item-` + fromId + `">
                    <div class="users-list-body">
                        <div>
                            <h5>` + fromId + `</h5><span style="color: #828282;font-size: 8px">` + Time + `</div>
                            <p>` + message + `</p>
                        </div>
                        <button type="button" class="btn btn-primary" onclick="agree(` + fromId + `)">同意</button>
                        <button type="button" class="btn btn-primary" onclick="refuse(` + fromId + `)">拒绝</button>
                    </div>
                </li>`)

}

function closeWebSocket() {
    //直接关闭websocket的连接
    webSocket.close();
}

//提交聊天页面chat_page信息
function submitMsg() {
    $(window.frames["chatFrame"].document).on('submit', '.layout .content .chat .chat-footer form', function (e) {
        //先不提交
        e.preventDefault();
        //获取对象id
        var toId = $('#toId', window.frames["chatFrame"].document);
        var input = $(this).find('input[type=text]');
        var message = input.val();
        message = $.trim(message);
        if (message) {
            var time = getTimeToHTML(message, 'outgoing-message', null);
            send(message, $("#userId").val(), toId.val(), time, "message");
            input.val('');
        } else {
            input.focus();
        }
    });
}

//获取时间并显示到页面上
function getTimeToHTML(message, type, time, isRead) {
    //如果没有time则为页面请求,获取系统时间
    if (!time) {
        //获取系统时间
        var d = new Date();
        var minutes = d.getMinutes()
        if (minutes.toString().length === 1) {
            minutes = '0' + minutes;
        }
        var hour = d.getHours();
        if (hour > 12) {
            hour -= 12;
            minutes = minutes + " PM";
        } else {
            minutes = minutes + " AM";
        }
        time = hour + ":" + minutes;
        setMessageInnerHTML(message, type, time, isRead);
        return d.getTime();
        //如果有time则为获取历史记录调用,设定时间
    } else {
        var d1 = new Date();
        d1.setTime(time);
        var now = new Date();
        var month = now.getMonth() + 1;
        var month1 = d1.getMonth() + 1;
        var day = now.getFullYear() + "/" + month + "/" + now.getDate();
        var day1 = d1.getFullYear() + "/" + month1 + "/" + d1.getDate();

        var minutes1 = d1.getMinutes()
        if (minutes1.toString().length === 1) {
            minutes1 = '0' + minutes1;
        }
        var hour1 = d1.getHours();
        if (hour1 > 12) {
            hour1 -= 12;
            minutes = minutes1 + " PM";
        } else {
            minutes = minutes1 + " AM";
        }
        //如果不是同一天,则显示日期
        if (day !== day1) {
            time = day1 + " " + hour1 + ":" + minutes;
        } else {
            time = hour1 + ":" + minutes;
        }
        setMessageInnerHTML(message, type, time, isRead);
    }

}

//将消息显示在网页上
function setMessageInnerHTML(message, type, time, isRead) {
    var chat_body = $('.layout .content .chat .chat-body', window.frames["chatFrame"].document);
    if (chat_body.length > 0) {
        type = type ? type : '';
        $('.layout .content .chat .chat-body .messages', window.frames["chatFrame"].document).append(
            `<div class="message-item ` + type + `">
           <div class="message-avatar">
                <figure class="avatar" title="` + (type === 'outgoing-message' ? 'Mirabelle Tow' : 'Byrom Guittet') + `">
                    <img class="rounded-circle ` + (type === 'outgoing-message' ? 'fromAvatar' : 'toAvatar') + `">
                </figure>
                </div>
                    <div>
                    <div>
                        <div class="message-content" >
                            ` + message + `
                        </div>
                        ` + (isRead === 0 ? "<span class='new'>new</span>" : '') + `
                        </div>
                    <div class="time ` + (isRead === 0 && type !== 'outgoing-message' ? 'ott' : '') + `" style="display: block">` + time + `` + (type === 'outgoing-message' ? '<i class="ti-double-check"></i>' : '') + `</div>
                </div>
        </div>`);
        //设置头像
        window.frames["chatFrame"].setAvatar();
        setTimeout(function () {
            chat_body.scrollTop(chat_body.get(0).scrollHeight, -1).niceScroll({
                cursorcolor: 'rgba(66, 66, 66, 0.20)',
                cursorwidth: "4px",
                cursorborder: '0px'
            }).resize();
        }, 200);
    }
}

/**
 *发送信息到服务器的方法
 */
function send(message, id, toId, sendTime, type) {
    console.log(type);
    var msg = {
        "message": message,
        "userId": id,
        "to": toId,
        "sendTime": sendTime,
        "type": type
    };
    webSocket.send(JSON.stringify(msg));
}
