<%@page import="com.stone.goguma.product.common.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
   <%
    	request.setCharacterEncoding("utf-8");
            Product product = (Product) request.getAttribute("product");
            	Boolean isWriter = (Boolean) request.getAttribute("isWriter");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
.maincontainer{
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}
.img-sec, .writer-sec, .title-sec, .contents-sec{
	width:450px;
}
.product-btn{
	background: #D3D3D3;
	width: 30%;
	padding: 10px 10px;
	box-sizing: border-box;
	border-radius:5px;
	border-style: hidden
}
</style>
</head>

<body>
<div class="maincontainer">
<div class="img-sec">
	<img src="/picture/<%=product.getPno() %>" width="450" height="450"/><br>
</div>
<div class="writer-sec">
	<h2><strong>작성자: ${product.mno}</strong></h2><hr align="center" style="border: solid 1px #D3D3D3;">
</div>
<div class="title-sec">
	<h2><strong>${product.title}</strong></h2><hr align="center" style="border: solid 0.25px #D3D3D3;">
	<h2><strong>${product.price}</strong></h2><hr align="center" style="border: solid 0.25px #D3D3D3;">
</div>
<div class="contents-sec">
	<p>${product.contents} 11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</p>
</div>
<div class="etc-sec">           	
    <h6>  조회수 : ${product.views}	    작성일 : ${product.date} </h6><hr align="center" style="border: solid 0.25px #D3D3D3;">
</div>
<div class="heart-sec">        
    <a class="text-dark heart" style="text-decoration-line: none;">
        <img id="heart" src="/img/icon/heart.svg">
        좋아요  ${product.likecnt}
    </a><br><hr align="center" style="border: solid 0.25px #D3D3D3;">
</div>
			  
	<!-- 글쓴이와 로그인한 회원이 동일 인 일때 -->
	<%if( isWriter!=null && isWriter==true ){ %>
	<button class="product-btn" onclick="location.href='/prepare_update?pno=<%=product.getPno()%>'">변경</button>
	<button class="product-btn" onclick="location.href='/delete?pno=<%=product.getPno()%>'">삭제</button>
	<%} %>
	<button class="product-btn" onclick="location.href='구매창.jsp'">구매하기</button>
	<button class="product-btn" onclick="location.href='/products'">목록</button>		    

</div>
</body>

<script>
    $(document).ready(function () {

        var heartval = ${heart.likecheck}

        console.log(heartval)

        if(heartval>0) {
            console.log(heartval);
            $("#heart").prop("src", "/img/icon/heart-fill.svg");
            $(".heart").prop('name',heartval)
        }
        else {
            console.log(heartval);
            $("#heart").prop("src", "/img/icon/heart.svg");
            $(".heart").prop('name',heartval)
        }

        $(".heart").on("click", function () {

            var that = $(".heart");
            
	            $.ajax({
	                url :'/heartM',
	                type :'POST',
	                data : {'pno':${product.pno}, 'mno':${product.mno},
	                success : function(data){
	                    that.prop('name',data);
	                    if(data==1) {
	                        $('#heart').prop("src","/img/icon/heart-fill.svg");
	                    } else {
	                        $('#heart').prop("src","/img/icon/heart.svg");
	                    }
	                    location.reload();
	
	                }

	            });

        });
        
    });
</script>
</html>






<%-- <%@page import="com.stone.goguma.product.common.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    <%
    	request.setCharacterEncoding("utf-8");
            Product product = (Product) request.getAttribute("product");
            	Boolean isWriter = (Boolean) request.getAttribute("isWriter");
    %>
<!DOCTYPE html>
<html>
<head>
<style>
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>물품 상세창</h1>
물품명:<%= product.getTitle() %><br>
물품소개<br><textarea rows="5" cols="25" readonly><%= product.getContents() %></textarea><br> 

<img src="/picture/<%=product.getPno() %>" width="200" height="300"/><br>
<%= product.getContents() %>
가격:<%= product.getPrice() %>원<br>
조회수:<%=product.getViews() %>




<!-- 글쓴이와 로그인한 회원이 동일 인 일때 -->
<%if( isWriter!=null && isWriter==true ){ %>
<button onclick="location.href='/prepare_update?pno=<%=product.getPno()%>'">변경</button>
<button onclick="location.href='/delete?pno=<%=product.getPno()%>'">삭제</button>
<%} %>
<button onclick="location.href='구매창.jsp'">구매하기</button>
<button onclick="location.href='/products'">목록</button>
<button onclick="location.href='/prepare_update?pno=<%=product.getPno()%>'">변경</button>
<button onclick="location.href='/delete?pno=<%=product.getPno()%>'">삭제</button>
</body>
</html> --%>