<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://flybear.hziee/tags" prefix="z"%>

<link rel="stylesheet" href="${__static__}/public/css/progress_header.css" media="screen" title="no title">
<z:block name="css">
</z:block>
<div class="jq-layout rel" data-options="fit:true">
<z:block name="header">
  <!-- <div data-options="region:'north',border:false,minHeight:34,maxHeight:34" class="header">
    <z:block name="select"></z:block>
    <z:block name="search"></z:block>
    <z:block name="btn"></z:block>
  </div> -->
</z:block>  
  <!-- 主体内容 -->
  <div class="content" data-options="region:'center',border:false">
      <z:block name="content">
          <!-- 可以有默认内容，重写后默认内容将被替换 -->
      </z:block>
  </div>
  
  <z:block name="footer">
      <!-- 可以有默认内容，重写后默认内容将被替换 -->
  </z:block>
</div>

<!-- 自定义JS添加到尾部 -->
<z:block name="js">
</z:block>
