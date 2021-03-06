<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>公司信息管理</title>
<c:set var="rootPath" value="${pageContext.request.contextPath}/admin" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/menu.js"></script>
</head>

<body>
<!--
<div class="top"></div>
-->
<div id="header">
	<div class="logo">二维码追溯系统管理平台</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li>admin</li>
			<li><a href="${rootPath}/User_loginOut">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<c:import url="public/left_menu.jsp"></c:import>
		<div class="m-right">
			<div class="main" >
                <div style="width:100%; margin-top:10px; margin-left:10px" >
                    <h3><strong>留言管理</strong></h3>
                    <br/>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="width:10%">编号</th>
                            <th>内容</th>
                            <th>日期</th>
                            <th>对应产品</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <s:if test="#request.commentList != null">
                    		<s:iterator var="comment" value="%{#request.commentList}">
                        <tr>
                            <td><s:property value="#comment.id"/></td>
                            <td>
                            <s:if test="#comment.content.length()>15">
							    <s:property value='#comment.content.substring(0,15)'/>...
							 </s:if>   
							 <s:else>      
							     <s:property value='#comment.content'/>
							 </s:else>
                            </td>
                            <td><s:date name="#comment.date" format="yyyy-MM-dd HH:mm:ss"/> </td>
                            <td><s:property value='#comment.product.id'/></td>
                            <td>
                            <a href="${rootPath}/Comment_updateInput?id=<s:property value='%{#comment.id}'/>"><button class="btn btn-default" type="button">详细</button></a>
                            </td>
                        </tr>
                     </s:iterator>
                     </s:if>
                     <s:else>
                     	对不起,暂时没有数据
                     </s:else>
                        </tbody>
                    </table>
                </div>
                 <s:if test="#request.pageRow >= #request.totalRow"></s:if>
                 <s:elseif test="#request.pageNo <= 1 || #request.pageNo==null">
	                   <a href="${rootPath}/Comment_commentInfoShow?pageNo=<s:property value='#pageNo + 1'/>" style="margin-left:300px" ><button class="btn btn-default" type="button">下一页</button></a>
                       <a href="${rootPath}/Comment_commentInfoShow?pageNo=<s:property value='#totalPage'/>"><button class="btn btn-default" type="button">末页</button></a>
                       <span><s:property value="#request.totalRow"/></span>条产品信息
                       &nbsp;&nbsp;1/<s:property value="#request.totalPage"/>
                        <span>
	                        <s:form action="Comment_commentInfoShow" style="display:inline-block" theme="simple" onsubmit="return checkPage()">
	                    	跳到<input id="pageNo" name="pageNo" style="height:31px;width:40px;" type="text">页
	                   		<button class="btn btn-default">确定</button>
	                   		</s:form>
                   		</span>
                    </s:elseif>
                    <s:elseif test="#request.pageNo >= #request.totalPage">
                        <a href="${rootPath}/Comment_commentInfoShow?pageNo=<s:property value='1'/>" style="margin-left:300px"><button class="btn btn-default" type="button">首页</button></a>
	                    <a href="${rootPath}/Comment_commentInfoShow?pageNo=<s:property value='#totalPage-1'/>"><button class="btn btn-default" type="button">上一页</button></a>
	                    <span><s:property value="#request.totalRow"/></span>条产品信息
	                    &nbsp;&nbsp;<s:property value="#request.totalPage"/>/<s:property value="#request.totalPage"/>
                        <span>
	                        <s:form action="admin/Comment_commentInfoShow" style="display:inline-block" theme="simple" onsubmit="return checkPage()">
	                    	跳到<input id="pageNo" name="pageNo" style="height:31px;width:40px;" type="text">页
	                   		<button class="btn btn-default">确定</button>
	                   		</s:form>
                   		</span>
	                </s:elseif>
	                <s:else>
	                	<a href="${rootPath}/Comment_commentInfoShow?pageNo=<s:property value='1'/>" style="margin-left:300px"><button class="btn btn-default" type="button">首页</button></a>
	                    <a href="${rootPath}/Comment_commentInfoShow?pageNo=<s:property value='#pageNo - 1'/>"><button class="btn btn-default" type="button">上一页</button></a>
	                    <a href="${rootPath}/Comment_commentInfoShow?pageNo=<s:property value='#pageNo + 1'/>"><button class="btn btn-default" type="button">下一页</button></a>
                        <a href="${rootPath}/Comment_commentInfoShow?pageNo=<s:property value='#totalPage'/>"><button class="btn btn-default" type="button">末页</button></a>
                        <span><s:property value="#request.totalRow"/></span>条产品信息
                        &nbsp;&nbsp;<s:property value="#request.pageNo"/>/<s:property value="#request.totalPage"/>
                        <span>
	                        <s:form action="admin/Comment_commentInfoShow" style="display:inline-block" theme="simple" onsubmit="return checkPage()">
	                    	跳到<input id="pageNo" name="pageNo" style="height:31px;width:40px;" type="text">页
	                   			<button class="btn btn-default">确定</button>
	                   		</s:form>
                   		</span>
	                </s:else>
            </div>
		</div>
</div>
<!--
<div class="bottom" ></div>
-->
<div id="footer"><p>Copyright©  2016 来源:<a href="#" target="_blank">丁香苑C416</a></p></div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/check.js"></script>
<script>navList(12);</script>
</body>
</html>
