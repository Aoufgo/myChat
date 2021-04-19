var webSocket;
$(function () {
    if ("WebSocket" in window) {
        //获取localhost路径,如果为https则将substring第一个参数7改为8
        var localhostPath = window.document.location.href.substring(7,window.document.location.href.indexOf(window.document.location.pathname));
        webSocket = new WebSocket("ws://"+localhostPath+"/aichat/websocket/" + document.getElementById('userId').value);

        //连通之后的回调事件
        webSocket.onopen = function () {
            console.log("已建立连接");
            setMessageInnerHTML("已经连通了websocket","in");
        };
        //接收后台服务端的消息
        webSocket.onmessage = function (evt) {
            var received_msg = evt.data;
            console.log("数据已接收:" + received_msg);
            var obj = JSON.parse(received_msg);
            setMessageInnerHTML(obj.textMessage,"in");

        };

        //连接关闭的回调事件
        webSocket.onclose = function () {
            console.log("连接已关闭...");
            setMessageInnerHTML("连接已经关闭....","in");
        };
    } else {
        // 浏览器不支持 WebSocket
        alert("您的浏览器不支持 WebSocket!");
    }
});

function closeWebSocket() {
    //直接关闭websocket的连接
    webSocket.close();
}

//提交信息
function submitMsg() {
    $(window.frames["chatFrame"].document).on('submit', '.layout .content .chat .chat-footer form', function (e) {
        e.preventDefault();
        var toId = $('#toId', window.frames["chatFrame"].document);
        var input = $(this).find('input[type=text]');
        var message = input.val();
        message = $.trim(message);
        if (message) {
            setMessageInnerHTML(message, 'outgoing-message',toId.val());
            input.val('');
        } else {
            input.focus();
        }
    });
}

//将消息显示在网页上
function setMessageInnerHTML(message, type,toId) {
    //var chat_body = $("#chatFrame").find('.layout .content .chat .chat-body');
    var chat_body =$('.layout .content .chat .chat-body',window.frames["chatFrame"].document);
    if (chat_body.length > 0) {
        var d = new Date();
        console.log(d.getTime())
        var minutes = d.getMinutes()
        var hour = d.getHours();
        if (hour>12){
            hour -= 12;
            minutes = minutes+" PM";
        }else {
            minutes = minutes+" AM";
        }
        var time = hour+":"+minutes;
        type = type ? type : '';
        $('.layout .content .chat .chat-body .messages',window.frames["chatFrame"].document).append(`<div class="message-item ` + type + `">
                        <div class="message-avatar">
                            <figure class="avatar" title="` + (type == 'outgoing-message' ? 'Mirabelle Tow' : 'Byrom Guittet') + `">
                                <img src="./dist/media/img/` + (type == 'outgoing-message' ? 'women_avatar5.jpg' : 'man_avatar3.jpg') + `" class="rounded-circle">
                            </figure>
                        </div>
                        <div>
                            <div class="message-content">
                                ` + message + `
                            </div>
                            <div class="time">` + time + `` + (type == 'outgoing-message' ? '<i class="ti-double-check"></i>' : '') + `</div>
                        </div>
                    </div>`);
        setTimeout(function () {
            chat_body.scrollTop(chat_body.get(0).scrollHeight, -1).niceScroll({
                cursorcolor: 'rgba(66, 66, 66, 0.20)',
                cursorwidth: "4px",
                cursorborder: '0px'
            }).resize();
        }, 200);
        send(message, $("#userId").val(), toId,d.getTime())
    }
}
/**
 *发送信息到服务器的方法
 */
function send(message,id,toId,sendTime) {
    var msg = {
        "message": message,
        "userId": id,
        "to": toId,
        "sendTime": sendTime
    };
    webSocket.send(JSON.stringify(msg));
}