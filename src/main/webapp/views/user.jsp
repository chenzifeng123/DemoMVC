<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 22775
  Date: 2020/1/3
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>
</head>
<body>

<!-- 首先这块大家要知道的是这里的items取值要取到刚刚modelAndView中添加的，不能写错 -->
<!-- 其次这里是重点，这个var后面的参数要写你刚刚添加的那个vo类的名字 -->
<!-- 就是上面servlceImpl中给zwfwLedVos这个list添加的vo类的名字。当时我就是在这里掉坑 -->
<table>
    <tr>
        <th>id</th>
        <th>用户名</th>
        <th>密码</th>
    </tr>
    <c:forEach items="${userList}" var="user" varStatus="sta">
        <tr>
            <td><c:out value="${user.id}"></c:out></td>
            <td><c:out value="${user.username}"></c:out></td>
            <td><c:out value="${user.password}"></c:out></td>
        </tr>
    </c:forEach>

</table>

</body>
</html>
