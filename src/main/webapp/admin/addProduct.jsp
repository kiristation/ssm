<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>addProduct</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/addBook.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/ajaxfileupload.js"></script>
		<script type="text/javascript">
			function fileChange(){
				$.ajaxFileUpload({
					url:"${pageContext.request.contextPath}/product/ajaxImg",
					secureuri: false,
					fileElementId: "pImage",
					dataType:"json",
					success:function (obj) {
						//清空div
						$("#imgDiv").empty();
						//创建一个图片的标签
						var imgObj = $("<img>");
						alert(obj.imgUrl);
						imgObj.attr("src","/image_big/"+obj.imgUrl);
						imgObj.attr("width","100px");
						imgObj.attr("height","100px");
						//将图片追加到imgDiv
						$("#imgDiv").append(imgObj);
					}
				});
			}
		</script>
	</head>
	<body>
	<!--取出上一个页面上带来的page的值-->
		<div id="addAll">
			<div id="nav">
				<p>商品管理>新增商品</p>
			</div>
			<div id="table">
				<form  id="myform" action="${pageContext.request.contextPath}/product/createProduct" method="post"
					   enctype="multipart/form-data">
					<table>
						<tr>
							<td class="one">商品名称</td>
							<td><input type="text" name="pName" class="two"></td>
						</tr>
						<!--错误提示-->
						<tr class="three">
							<td class="four"></td>
							<td><span id="pnameerr"></span></td>
						</tr>
						<tr>
							<td class="one">商品介绍</td>
							<td><input type="text" name="pContent" class="two"></td>
						</tr>
						<!--错误提示-->
						<tr class="three">
							<td class="four"></td>
							<td><span id="pcontenterr"></span></td>
						</tr>
						<tr>
							<td class="one">定价</td>
							<td><input type="number" name="pPrice" class="two"></td>
						</tr>
						<!--错误提示-->
						<tr class="three">
							<td class="four"></td>
							<td><span id="priceerr"></span></td>
						</tr>
						<tr>
							<td class="three">图片介绍<br><br><br><br><br><br><br><br></td>
                            <td><div id="imgDiv" style="display:block; width: 40px; height: 50px;"/>
								<span id="imgName"/><br>
								<input type="file" id="pImage" name="pImage" onchange="fileChange()"><br><br><br>
                            </td>
						</tr>
						<tr class="three">
							<td class="four"></td>
							<td><span></span></td>
						</tr>
						<tr>
							<td class="one">总数量</td>
							<td><input type="number" name="pNumber" class="two"></td>
						</tr>
						<!--错误提示-->
						<tr class="three">
							<td class="four"></td>
							<td><span id="numerr"></span></td>
						</tr>
						<tr>
							<td class="one">类别</td>
							<td>
								<select name="typeId" >
									<c:forEach items="${typeList}" var="type">
										<option value="${type.typeId}">${type.typeName}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<!--错误提示-->
						<tr class="three">
							<td class="four"></td>
							<td><span></span></td>
						</tr>
						<tr>
							<td>
								<input type="submit" value="提交" class="btn btn-success">
							</td>
							<td>
								<input type="reset" value="取消" class="btn btn-default" onclick="closeAdd()">
								<script type="text/javascript">
									function closeAdd() {
										location.href="${pageContext.request.contextPath}/product/split?pNameVo=${productInfoVo.pNameVo}&typeIdVo=${productInfoVo.typeIdVo}&lPriceVo=${productInfoVo.lPriceVo}&hPriceVo=${productInfoVo.hPriceVo}&pageNum=${productInfoVo.pageNum}";
									}
								</script>
							</td>
						</tr>
					</table>
					<input type="hidden" name="pNameVo" value="${productInfoVo.pNameVo}">
					<input type="hidden" name="typeIdVo" value="${productInfoVo.typeIdVo}">
					<input type="hidden" name="lPriceVo" value="${productInfoVo.lPriceVo}">
					<input type="hidden" name="hPriceVo" value="${productInfoVo.hPriceVo}">
					<input type="hidden" name="pageNum" value="${productInfoVo.pageNum}">
				</form>
			</div>
		</div>
	</body>
</html>