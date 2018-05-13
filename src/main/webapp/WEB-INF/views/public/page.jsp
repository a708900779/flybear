<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--
分页 页码页面
若当前页为8，  1 2... 5 6 7 8 9 10... 20
若当前页为2，  1 2 3 4 5...20
若当前页为17  1 2... 15 16 17 18 19 20
 --%>
<c:choose>
	<c:when test="${page.total>0 }">
		<div class="m-page">
			<c:if test="${page.hasPrev }">
				<a class="prev" href="${param.url}<c:if test="${param.paramlist!=\"\" }">?${param.paramlist }&</c:if><c:if test="${param.paramlist==\"\" }">?</c:if>page=${page.page-1 } ">前一页</a>
			</c:if>
			
			<c:forEach begin="1" end="2" var="num">
				<c:if test="${num < page.pageRange[0]  }">
					<a href="${param.url}<c:if test="${param.paramlist!=\"\" }">?${param.paramlist }&</c:if><c:if test="${param.paramlist==\"\" }">?</c:if>page=${num } ">${num }</a>
				</c:if>
			</c:forEach>
			<c:if test="${page.pageRange[0] > 3 }">
				...
			</c:if>
			<c:forEach items="${page.pageRange }" var="num">
				<c:choose>
					<c:when test="${num == page.page }">
						<a class="active" href="javascript:;">${page.page }</a>
					</c:when>
					<c:otherwise>
						<a href="${param.url}<c:if test="${param.paramlist!=\"\" }">?${param.paramlist }&</c:if><c:if test="${param.paramlist==\"\" }">?</c:if>page=${num } ">${num }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.pageRange[fn:length(page.pageRange)-1] < page.maxPage-1 }">
				...
			</c:if>
			<c:if test="${page.pageRange[fn:length(page.pageRange)-1] < page.maxPage }">
				<a href="${param.url}<c:if test="${param.paramlist!=\"\" }">?${param.paramlist }&</c:if><c:if test="${param.paramlist==\"\" }">?</c:if>page=${page.maxPage } ">${page.maxPage }</a>
			</c:if>
			<c:if test="${page.hasNext }">
				<a class="next" href="${param.url}<c:if test="${param.paramlist!=\"\" }">?${param.paramlist }&</c:if><c:if test="${param.paramlist==\"\" }">?</c:if>page=${page.page+1 } ">后一页</a>
			</c:if>
			&nbsp;&nbsp;&nbsp;&nbsp;共&nbsp;${page.maxPage }&nbsp;页
			<c:if test="${page.maxPage>0 && param.inputpage==true }">
				<form action="${param.url}<c:if test="${param.paramlist!=\"\" }">?${param.paramlist }</c:if>" method="get">
					&nbsp;&nbsp;<input type="text" name="page" value="${page.page }" style="width:30px;" />
				</form>
			</c:if>
		</div>	
	</c:when>
	<c:otherwise>
		<%--无内容，界面可优化 --%>
		<div class="muted f14 tc">
			${!(empty param.tip) ? param.tip:'对不起暂无消息'}
		</div>
	</c:otherwise>
</c:choose>