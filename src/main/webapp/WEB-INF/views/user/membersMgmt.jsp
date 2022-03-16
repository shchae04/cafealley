<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>memMgmt</title>

<link rel="stylesheet" href="<c:url value='/css/reset.css'/>">


<style>
.body {
	width: 100%;
}

.section {
	display: block;
	width: 90%;
	margin: 50px auto;
}

.container {
	min-width: 1200px;
	margin-top: 180px;
	margin-bottom: 50px;
}

.ord-mgmt-title {
	font-size: 29px;
	font-weight: bold;
}

.ord-mgmt-table {
	margin: 30px 0;
}
</style>

</head>

<body>

	<%@ include file="../include/header.jsp"%>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<p class="ord-mgmt-title">멤버십 회원 관리</p>
					<table class="table ord-mgmt-table w-auto text-center align-middle">
						<thead>
							<tr>
								<td>아이디</td>
								<td>입금자명</td>
								<td>입금은행</td>
								<td>총금액(몇개월)</td>
								<td>결제상태</td>
								<td>결제요청일</td>
								<td>구독시작일</td>
								<td>멤버십번호</td>
								<td>승인버튼</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>abc1234</td>
								<td>홍길동</td>
								<td>ㅇㅇ은행</td>
								<td>48,000원(12개월)</td>
								<td><select>
										<option value="wait-dep">입금대기중</option>
										<option value="dep-cmp">입금완료</option>
								</select></td>
								<td>0000.00.00</td>
								<td>0000.00.00</td>
								<td>00000000</td>
								<td><button type="button" class="btn-xs">구독승인</button></td>
							</tr>
							<tr>
								<td>abc1234</td>
								<td>김철수</td>
								<td>ㅇㅇ은행</td>
								<td>12,000원(3개월)</td>
								<td><select>
										<option value="wait-dep">입금대기중</option>
										<option value="dep-cmp">입금완료</option>
								</select></td>
								<td>0000.00.00</td>
								<td>0000.00.00</td>
								<td>00000000</td>
								<td><button type="button" class="btn-xs">구독승인</button></td>
							</tr>
							<tr>
								<td>abc1234</td>
								<td>김아무개</td>
								<td>ㅇㅇ은행</td>
								<td>24,000원(6개월)</td>
								<td><select>
										<option value="wait-dep">입금대기중</option>
										<option value="dep-cmp">입금완료</option>
								</select></td>
								<td>0000.00.00</td>
								<td>0000.00.00</td>
								<td>00000000</td>
								<td><button type="button" class="btn-xs">구독승인</button></td>
							</tr>
							<tr>
								<td>abc1234</td>
								<td>이영희</td>
								<td>ㅇㅇ은행</td>
								<td>4,000원(1개월)</td>
								<td><select>
										<option value="wait-dep">입금대기중</option>
										<option value="dep-cmp">입금완료</option>
								</select></td>
								<td>0000.00.00</td>
								<td>0000.00.00</td>
								<td>00000000</td>
								<td><button type="button" class="btn-xs">구독승인</button></td>
							</tr>

						</tbody>
					</table>

				</div>
			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>