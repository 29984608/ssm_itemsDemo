<%--
  Created by IntelliJ IDEA.
  User: Y
  Date: 2018/4/6
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>查询商品列表</title>
    <script type="text/javascript">
        function deleteItems() {
            document.itemsForm.action = "${pageContext.request.contextPath}/items/deleteItems";
            document.itemsForm.submit();
        }
        function queryItems() {
            document.itemsForm.action = "${pageContext.request.contextPath}/items/queryItems";
            document.itemsForm.submit();
        }
    </script>
</head>
<body>
当前用户：${username}
<c:if test="${username!=null}">
    <a href="${pageContext.request.contextPath}/logout">退出</a>
</c:if>
<form name="itemsForm" action="${pageContext.request.contextPath}/items/queryItems" method="post">
    查询条件：
    <table width="100%" border=1>
        <tr>
            <td>商品名称：<input type="text" name="itemsCustom.name" />
            商品类型：<select name="itemtype">
                <c:forEach items="${itemstypes}" var="itemtype">
                    <option value="${itemtype.key}">${itemtype.value}</option>
                </c:forEach>
            </select>
            </td>
            <td><input type="button" value="查询" onclick="queryItems()"/>
                <input type="button" value="批量删除" onclick="deleteItems()"/>
            </td>
        </tr>
    </table>

    商品列表：
    <table width="100%" border=1>
        <tr>
            <td>选择</td>
            <td>商品名称</td>
            <td>商品价格</td>
            <td>生产日期</td>
            <td>商品描述</td>
            <td>操作</td>

        </tr>
        <c:forEach items="${items }" var="item">
            <tr>
                <td><input type="checkbox" value="${item.id}" name="items_id"/></td>
                <td>${item.name }</td>
                <td>${item.price }</td>
                <td><fmt:formatDate value="${item.createtime}" pattern="yyyy/MM/dd"/></td>
                <td>${item.detail }</td>
                <td><a href="${pageContext.request.contextPath}/items/editItems/?id=${item.id}">修改</a></td>
            </tr>
        </c:forEach></table>
</form>
</body>
</html>
