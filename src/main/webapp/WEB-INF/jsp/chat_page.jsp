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
<input type="hidden" value="${user.id}" id="userId">
<div class="layout" >
    <div class="content"  >
        <div class="chat" >
            <div class="chat-body" > <!-- .no-message -->
                <!--
                <div class="no-message-container">
                    <div class="row mb-5">
                        <div class="col-md-4 offset-md-4">
                            <img src="./dist/media/svg/undraw_empty_xct9.svg" class="img-fluid" alt="image">
                        </div>
                    </div>
                    <p class="lead">Select a chat to read messages</p>
                </div>
                -->
                <div class="messages">
                    <div class="message-item outgoing-message">
                        <div class="message-avatar">
                            <figure class="avatar" title="Mirabelle Tow">
                                <img src="./dist/media/img/avatar3.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div>
                            <div class="message-content">
                                Hello how are you?
                            </div>
                            <div class="time">01:20 PM <i class="ti-double-check text-info"></i></div>
                        </div>
                    </div>
                    <div class="message-item">
                        <div class="message-avatar">
                            <figure class="avatar" title="Byrom Guittet">
                                <img src="./dist/media/img/avatar4.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div>
                            <div class="message-content">
                                I'm fine, how are you 😃
                            </div>
                            <div class="time">01:35 PM</div>
                        </div>
                    </div>
                    <div class="message-item outgoing-message">
                        <div class="message-avatar">
                            <figure class="avatar" title="Mirabelle Tow">
                                <img src="./dist/media/img/avatar3.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div>
                            <div class="message-content">
                                I'm fine thank you. I expect you to send me some files.
                            </div>
                            <div class="time">05:31 PM <i class="ti-double-check text-info"></i></div>
                        </div>
                    </div>
                    <div class="message-item">
                        <div class="message-avatar">
                            <figure class="avatar" title="Byrom Guittet">
                                <img src="./dist/media/img/avatar4.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div>
                            <div class="message-content">
                                What files are you talking about? I'm sorry I can't remember right now.
                            </div>
                            <div class="time">10:12 PM</div>
                        </div>
                    </div>
                    <div class="message-item outgoing-message">
                        <div class="message-avatar">
                            <figure class="avatar" title="Mirabelle Tow">
                                <img src="./dist/media/img/avatar3.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div>
                            <div class="message-content">
                                I want those files for you. I want you to send 1 PDF and 1 image file.
                            </div>
                            <div class="time">11:56 PM <i class="ti-double-check text-info"></i></div>
                        </div>
                    </div>
                    <div class="message-item">
                        <div class="message-avatar">
                            <figure class="avatar" title="Byrom Guittet">
                                <img src="./dist/media/img/avatar4.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div>
                            <div class="message-content message-file">
                                <div class="file-icon">
                                    <i class="fa fa-file-pdf-o"></i>
                                </div>
                                <div>
                                    <div>important_documents.pdf <i class="text-muted small">(50KB)</i></div>
                                    <ul class="list-inline">
                                        <li class="list-inline-item mb-0"><a href="#">Download</a></li>
                                        <li class="list-inline-item mb-0"><a href="#">View</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="time">11:59 PM</div>
                        </div>
                    </div>
                    <div class="message-item">
                        <div class="message-avatar">
                            <figure class="avatar" title="Byrom Guittet">
                                <img src="./dist/media/img/avatar4.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div>
                            <div class="message-content">
                                I'm about to send the other file now.
                            </div>
                            <div class="time">07:15 AM</div>
                        </div>
                    </div>
                    <div class="message-item outgoing-message">
                        <div class="message-avatar">
                            <figure class="avatar" title="Mirabelle Tow">
                                <img src="./dist/media/img/avatar3.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div>
                            <div class="message-content">
                                Thank you so much. These files are very important to me. I guess you didn't make any
                                changes
                                to these files. So I need the original versions of these files. Thank you very much
                                again.
                            </div>
                            <div class="time">07:45 AM <i class="ti-double-check text-info"></i></div>
                        </div>
                    </div>
                    <div class="message-item">
                        <div class="message-avatar">
                            <figure class="avatar" title="Byrom Guittet">
                                <img src="./dist/media/img/avatar4.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div>
                            <div class="message-content">
                                I thank you. We are glad to help you. 😃
                            </div>
                            <div class="time">08:00 AM</div>
                        </div>
                    </div>
                    <div class="message-item outgoing-message">
                        <div class="message-avatar">
                            <figure class="avatar" title="Mirabelle Tow">
                                <img src="./dist/media/img/avatar3.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div>
                            <div class="message-content">
                                😃 😃 ❤ ❤
                            </div>
                            <div class="time">09:23 AM <i class="ti-double-check text-info"></i></div>
                        </div>
                    </div>
                    <div class="message-item">
                        <div class="message-avatar">
                            <figure class="avatar" title="Byrom Guittet">
                                <img src="./dist/media/img/avatar4.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div>
                            <div class="message-content message-image">
                                <img src="dist/media/img/image1.png" class="rounded" alt="image">
                            </div>
                            <div class="time">10:43 AM</div>
                        </div>
                    </div>
                    <div class="message-item outgoing-message">
                        <div class="message-avatar">
                            <figure class="avatar" title="Mirabelle Tow">
                                <img src="./dist/media/img/avatar3.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div>
                            <div class="message-content">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet at dolores dolorum
                                expedita, odio quas quod. Assumenda doloribus eaque eveniet excepturi exercitationem
                                fuga fugit incidunt laboriosam necessitatibus obcaecati, optio ratione tempora tempore
                                voluptate voluptatem. Aut doloribus eveniet exercitationem id! Atque commodi, ea
                                exercitationem minima necessitatibus repellendus sit totam unde veniam.
                            </div>
                            <div class="message-content">
                                😃 😃 ❤ ❤
                            </div>
                            <div class="time">10:50 AM <i class="ti-double-check text-info"></i></div>
                        </div>
                    </div>
                    <div class="message-item messages-divider" data-label="1 message unread"></div>
                    <div class="message-item">
                        <div class="message-avatar">
                            <figure class="avatar" title="Byrom Guittet">
                                <img src="./dist/media/img/avatar4.png" class="rounded-circle" alt="image">
                            </figure>
                        </div>
                        <div>
                            <div class="message-content">
                                I sent you all the files. Good luck with 😃
                            </div>
                            <div class="time">11:05 AM</div>
                        </div>
                    </div>
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
                        <button class="btn btn-primary" type="submit">
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
<script src="${pageContext.request.contextPath}/static/js/examples.js"></script>
</body>
</html>
