<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 22775
  Date: 2020/1/8
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bootstrap 实例 - 默认的分页</title>
    <!--先引入需要的jQuery 和 Bootstrap 文件以及相关插件 这里我直接引用网上的核心库 记得联网-->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery.js"></script>
</head>
<body>
    <script>
        //禁用功能
        $(function () {
            $("ul.pagination li.disabled a").click(function () {
                return false;
            })
        });
    </script>

    <%-- 用来放用户信息的table 暂时只显示用户信息 编辑和删除功能我就先注掉了 --%>
    <div class="listDIV">
        <table class="table table-striped table-bordered table-hover table-condensed">
            <caption>用户列表 - 共${page.total}人</caption>  <%-- 这个page就是之前通过addObject存储的page 通过el表达式直接获取 --%>
            <thead>
            <tr class="success">
                <th>id</th>
                <th>username</th>
                <th>password</th>
                <%--<th>编辑</th>
                <th>删除</th>--%>
            </tr>
            </thead>

            <tbody>
            <%-- items:要被循环的信息 var:代表当前条目的变量名称  varStatus:代表循环状态的变量名称 --%>
            <%-- 如果像我这种菜鸟一样对 varStatus 不了解 参考：https://blog.csdn.net/hu_xuefeng/article/details/51494250  --%>
            <c:forEach items="${userList}" var="s" varStatus="status">
                <tr>
                    <td>${s.id}</td>
                    <td>${s.username}</td>
                    <td>${s.password}</td>
                   <%-- <td><a href="/editStudent?id=${s.id}"><span class="glyphicon glyphicon-edit"></span> </a></td>
                    <td><a href="/deleteStudent?id=${s.id}"><span class="glyphicon glyphicon-trash"></span> </a></td>--%>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

    <!-- 分页标签 -->
    <nav class="pageDIV">
        <ul class="pagination">
            <%--跳到首页 这里做了判断 如果没有前一页 那么 跳到到首页的这个标签是不可点击的 class="disabled" --%>
            <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if> >
                <a href="?page.start=0">   <%-- 首页的开始数据的索引为0 点击后会发现地址栏变为 http://localhost:8080/DemoMVC/getlist?page.start=0  是作为参数显式传递的 --%>
                    <span> << </span>
                </a>
            </li>
            <%--跳到前一页 同样做了判断 如果没有前一页 则不可点击前跳 class="disabled" --%>
            <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if> >
                <a href="?page.start=${page.start-page.count}"> <%--当前页面数据索引 - 每页显示条数 = 上一页的第一条数据索引 --%>
                    <span> < </span>
                </a>
            </li>
            <%--中间的分页  显示各页号--%>
            <%-- begin:开始的元素 end:最后一个元素 varStatus:代表循环状态的变量名称 --%>
            <%-- 比如我一共39条元素 共4页 第一页记为0 最后一页 4-1 =3  --%>
            <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">
                <%-- 这部分解释下
                     status.count：从1开始计数  1 2 3 4 ....39
                     status.index：从0开始计数  0 1 2 3 ....38
                     page.count:   每页数量
                      -10 <= status.count*page.count-page.start<= 30
                     显示当前页码的前两个和后两个就可，例如当前页码为3的时候，就显示 1 2 3(当前页) 4 5 的页码
                     这里不理解没关系 一会儿会有图解
                 --%>
                <c:if test="${status.count*page.count-page.start<=30 && status.count*page.count-page.start>=-10}">
                    <%-- status.index*page.count==page.start 判断是否是目前的这一页
                         举例：status.index = 2  page.count = 10
                               第一页 0  第二页 10  第三页 20   （数字指每页第一行的索引）
                               如果现在在第三页 那么 2 * 10 = 20  条件成立
                               class="disabled"  此页数的标签不可点击
                               class="current"   此页数的标签颜色显示为灰色表示目前位置停留在此页 --%>
                      <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                          <a href="?page.start=${status.index*page.count}"
                           <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                          >${status.count}</a>
                      </li>
                  </c:if>
              </c:forEach>
              <%--跳到下一页 同样做了判断 如果没有下一页 则不可点击后跳 class="disabled" --%>
              <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
                  <a href="?page.start=${page.start+page.count}">
                      <span> > </span>
                  </a>
              </li>
              <%--跳到尾页 如果没有后一页 那么 跳到尾页的这个标签是不可点击的 class="disabled" --%>
              <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
                  <a href="?page.start=${page.last}">
                      <span> >> </span>
                  </a>
              </li>
          </ul>
      </nav>
  </body>
  </html>
