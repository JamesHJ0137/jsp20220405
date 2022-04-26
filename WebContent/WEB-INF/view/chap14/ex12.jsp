<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>

<script>
	$(document).ready(function() {
		$(".delete-button").click(function(e) {
			e.preventDefault(); // 이벤트 진행이 멈추는 기능
			
			let check = confirm("정말로 삭제하시겠습니까?"); // 확인 누르면 true 취소 누르면 false
			
			if (check) {
				$(this).closest("form").submit();
			}
		});
	});
</script>

<title>Our Customers</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col">

				<c:if test="${not empty param.success }">
					<c:if test="${param.success }">
						<div class="alert alert-success">삭제가 완료되었습니다.</div>
					</c:if>

					<c:if test="${not param.success }">
						<div class="alert alert-danger">삭제하는 도중 오류가 발생되었습니다.</div>
					</c:if>
				</c:if>


				<h1>고객 명단</h1>
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>CUSTOMER NAME</th>
							<th>CITY</th>
							<th>COUNTRY</th>
							<th>POSTCODE</th>
							<th>DELETE</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${customerList }" var="cus">
							<tr>
								<td>${cus.id }</td>
								<td>${cus.name }</td>
								<td>${cus.city }</td>
								<td>${cus.country }</td>
								<td>${cus.postCode }</td>
								<td>
									<form action="" method="post">
										<input type="hidden" name="id" value="${cus.id }" />
										<button class="delete-button btn-danger">
											<i class="fa-solid fa-trash-can"></i>
										</button>
									</form>

								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
</body>
</html>


