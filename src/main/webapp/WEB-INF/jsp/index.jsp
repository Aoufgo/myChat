<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AiChat</title>
    <link rel="icon" href="${pageContext.request.contextPath}/image/icon/favicon.png" type="image/png">
</head>
<frameset rows="32px,*" border="0" bordercolor="#c4c4c4">
    <frame  src="top" name="topFrame" noresize="noresize" scrolling="no" >
    <frame src="${pageContext.request.contextPath}/user/jumpToChat/${user.id}" name="bottom" noresize="noresize" scrolling="">
</frameset>

</html>
