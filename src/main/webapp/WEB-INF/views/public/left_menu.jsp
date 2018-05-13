<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<div class="jq-accordion" fit="true" data-options="animate:false,border:false,multiple:true">
	<c:forEach var="node" items="${leftMenuList}" varStatus="statusMain">
		<div class='${statusMain.first?"first":""} main-menu' title="${node.name }">
			<ul class="sub-menu" data-group="${node.name }">
				<c:forEach var="subNode" items="${node.children}" varStatus="statusSub">
					<li class='${statusSub.first?"first":""}' data-hash="/${subNode.url}"><a href='${z:u(subNode.url) }'>${subNode.name }</a></li>
				</c:forEach>
			</ul>
		</div>
	</c:forEach>
</div>