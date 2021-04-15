$(function () {
    var webSocket;
    var commWebSocket;
    if ("WebSocket" in window) {
        webSocket = new WebSocket("ws://localhost:8080/aichat/websocket/" + document.getElementById('userId').value);

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
            setMessageInnerHTML(obj.fromUser + "对" + obj.toUser + "说：" + obj.textMessage,"in");

        };

        //连接关闭的回调事件
        webSocket.onclose = function () {
            console.log("连接已关闭...");
            setMessageInnerHTML("连接已经关闭....");
        };
    } else {
        // 浏览器不支持 WebSocket
        alert("您的浏览器不支持 WebSocket!");
    }

    //将消息显示在网页上
    function setMessageInnerHTML(message, type) {
        var chat_body = $('.layout .content .chat .chat-body');
        if (chat_body.length > 0) {
            var d = new Date();
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
            $('.layout .content .chat .chat-body .messages').append(`<div class="message-item ` + type + `">
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
        }
    }

    function closeWebSocket() {
        //直接关闭websocket的连接
        webSocket.close();
    }


    /**
     *发送信息到服务器的方法
     */
    function send(message,id,to) {
        //var selectText = $("#onLineUser").find("option:selected").text();
        //if (selectText == "--所有--") {
            var selectText = "All";
        //} else {
            //setMessageInnerHTML(document.getElementById('username').value + "对" + selectText + "说：" + $("#text").val());
        //}
        var msg = {
            "message": message,
            "userId": id,
            "to": selectText
        };
        webSocket.send(JSON.stringify(msg));
    }
    //点击发送,将信息显示到页面
    $(document).on('submit', '.layout .content .chat .chat-footer form', function (e) {
        e.preventDefault();

        var input = $(this).find('input[type=text]');
        var message = input.val();
        message = $.trim(message);

        if (message) {
            setMessageInnerHTML(message, 'outgoing-message');
            send(message,$("userId").val(),'All')
            input.val('');
        } else {
            input.focus();
        }
    });
});