<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>shallweshare</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<link href="../resources/css/font.css" rel="stylesheet" />


<!-- header-->
</head>
<!--     <body class="d-flex flex-column h-100"> -->
<body>
	<header>
		<%@ include file="../header.jsp"%>
	</header>
	<main class="flex-shrink-0">



		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-light bg-dark">
			<div class="container px-10 p-0">
				<a class="navbar-brand m-0 ms-5" href="listNetflix"> <span
					class="fw-bolder text-primary m"> <img
						src="../resources/img/NETFLIX.png" width="170" height="60">
				</span>
				</a> <a class="navbar-brand m-0" href="listWavve"> <span
					class="fw-bolder text-primary"> <img
						src="../resources/img/wavve.png" width="170" height="60">
				</span>
				</a> <a class="navbar-brand m-0" href="listTving"> <span
					class="fw-bolder text-primary"> <img
						src="../resources/img/TVING.jpg" width="170" height="60">
				</span>
				</a> <a class="navbar-brand m-0" href="listDisney"> <span
					class="fw-bolder text-primary"> <img
						src="../resources/img/DISNEY.jpg" width="170" height="60">
				</span>
				</a> <a class="navbar-brand me-5" href="listWatcha"> <span
					class="fw-bolder text-primary"> <img
						src="../resources/img/WATCHA.jpg" width="170" height="60">
				</span>
				</a> <a class="navbar-brand ms-5" href="party_create"> <span
					class="fw-bolder text-primary">
						<div class="btn btn-warning">파티만들기</div>
				</span>
				</a>
			</div>
		</nav>
		<hr>

		<!--             파티방 -->
		<div class="container d-flex justify-content-center"
			id="hanging-icons">
			<!--             <h2 class="pb-2 text-center"> <img alt="" src="../resources/img/베너1.png" width="1200px"> </h2> -->
			<!--                        <img src="../resources/img/베너1.png" class="slideshow-image"> -->
			<img src="../resources/img/베너2.png" class="slideshow-image"
				style="width: 1400px">
		</div>
		<div class="row row-cols-4 ms-5 me-5 d-flex justify-content-center">

			<c:forEach var="getParty_list" items="${getParty_list }">
				<div class=" border border-3 border-warning m-3 p-0 rounded ">
					<div class="col-xs d-flex justify-content-center ">
						<a
							href="party_page?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount} &p_id=${getParty_list.p_id}"
							class="btn btn-lg btn-light" style="width: 100%">
							<h2>
								<img src="../resources/img/${getParty_list.p_platform}Icon.png"
									width="50px" height="50px"> ${getParty_list.p_platform}
							</h2>
							<p>${getParty_list.p_title}</p>
							<p>1/4</p>
							<p>
								<fmt:formatDate pattern="yyyy.MM.dd"
									value="${getParty_list.p_finish_date }" />
								까지 &laquo;<b> ${getParty_list.p_price}원</b> &raquo;
							</p>

						</a>
					</div>
				</div>
			</c:forEach>

		</div>


		<!--    페이징  -->
		<div>
			<nav aria-label="Page navigation example">
				<ul
					class="pagination pagination-lg justify-content-center bg-dark mt-5">
					<c:if test="${pageMaker.prev}">
						<li class="page-item"><a class="page-link"
							href="${pageMaker.startPage - 1}" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="page-item " ${pageMaker.cri.pageNum == num }><a
							class="page-link" href="${num}"> ${num} </a></li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li class="page-item"><a class="page-link "
							href="${pageMaker.endPage + 1}" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
				</ul>
			</nav>
		</div>

		<form method="get" action="#" id="actionForm">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
		<form method="post" action="#" id="actionForm">
			<input type="hidden" name="u_id" value="${user.getU_id()}">
			${user.getU_id()}
		</form>

		<!-- Footer-->
		<%@include file="../footer.jsp"%>
	</main>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>


</body>
</html>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

//파티만들기 이동시 로그인 확인
var u_id = '<%=session.getAttribute("u_id")%>
	';
	function loginCheck() {
		console.log("@# u_id==>" + u_id);
		if (u_id === 'null') {
			alert("로그인 해라")
			window.location = 'login';
		} else {
			window.location = 'party_create?u_id=${user.getU_id()}';
		}
	}

	//    페이지번호 처리
	var actionForm = $("#actionForm");
	$(".page-link").on("click", function(e) {
		e.preventDefault();
		//       console.log("@# href==>"+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
</script>

