<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원리스트</title>
	<meta charset="utf-8" />
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
	<link href="css/styles.css" rel="stylesheet" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<style type="text/css">
		.form-control{
			width:180px !important;
		}
		.button {
			width : 70px !important;
		}
		label {
			width : 100px;
			text-align: center;
		}
	</style>
</head>
<body>
	<%@ include file = "include/header.jsp"%>
		<div class="container">
			<form class="form-inline" action="#" method="post">
				<div>
					<label><h2>직원리스트</h2></label>
				</div>
				<div class="form-group" style="height:58px;">
					<label>사번</label> <input type="text"class="form-control" id="sabun" name="sabun" required="required">
					<label>성명</label> <input type="text"class="form-control" id="name" name="name" required="required">
					<label>입사구분</label><select class="form-control" id="gubun" name="gubun" required="required"><option></option></select>
					<label>투입여부</label><select class="form-control" id="put_yn" name="put_yn" required="required"><option></option></select>
				</div>
				<div class="form-group" >
					<label>직위</label><select class="form-control" id="pos_gbn_code" name="pos_gbn_code" required="required"><option></option></select>
					<label>입사일자</label><input type = "text" class="form-control datepicker endDate" id="join_day" name="join_day" required="required" style="margin-left:8px;">
					<label>퇴사일자</label><input type ="text" class="form-control datepicker endDate" id="retire_day" name="retire_day" required="required">							
					<label>직종분류</label><select class="form-control" id="job_type" name="job_type" required="required"><option></option></select>				
				</div>
				<div class="form-group"  style="float:right; padding-top:20px;" >
						<input type="submit" value="검색" class="form-control button" onclick="confirm('검색 하시겠습니까?')">
						<input type="reset" value="초기화" class="form-control button">
						<input type="submit" value="이전" onclick="history.back()" class="form-control button"> 
				</div>
			</form>
		</div>
		<hr>
			<script type="text/javascript">
				$(()=>{
					setting();
					$('.endDate').change(function(){
						
						var join_day = $('#join_day').val();
						var retire_day = $('#retire_day').val();
						var join_dayArr = join_day.split('/');
						var retire_dayArr = retire_day.split('/');				
						
						var join_day_compare = new Date(join_dayArr[2], parseInt(join_dayArr[0])-1, join_dayArr[1] );
						var retire_day_compare = new Date(retire_dayArr[2], parseInt(retire_dayArr[0])-1, retire_dayArr[1] );
						
						
						if(join_day_compare > retire_day_compare){
							alert('입사날짜를 확인해주세요!');
							$('#retire_day').val('');
						}
					});
				
				});
			
				$(function(){
	   				$('.datepicker').datepicker({
	   				});
	   			});
				function setting(){
					<c:forEach var ="i" items="${list}">
						$('#${i.name}').append('<option>${i.note}</option>'');
					</c:forEach
				});
				
			</script>
	<%@ include file = "include/footer.jsp" %>

</body>
</html>