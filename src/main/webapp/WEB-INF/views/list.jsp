<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원리스트</title>
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
	
	<!-- 새로추가 -->
  	
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
		th{
			text-align:center;
		}
		td{
			text-align: center;
		}
	</style>
</head>
<body>
	<%@ include file = "include/header.jsp"%>
		<div class="container">
			<form class="form-inline" action="/listView"method="post" >
				<div>
					<h2 style="margin-bottom:40px;">직원리스트</h2>
				</div>
				<div class="form-group" style="height:58px;">
					<label>사번</label> <input type="text"class="form-control" id="sabun" name="sabun" value="${bDto.sabun}">
					<label>성명</label> <input type="text"class="form-control" id="name" name="name" value="${bDto.name}">
					<label>입사구분</label><select class="form-control" id="join_gbn_code" name="join_gbn_code" ><option>${bDto.join_gbn_code}</option></select>
					<label>투입여부</label><select class="form-control" id="put_yn" name="put_yn" ><option>${bDto.put_yn }</option></select>
				</div>1
				<div class="form-group">
					<label>직위</label><select class="form-control" id="pos_gbn_code" name="pos_gbn_code"><option>${bDto.pos_gbn_code }</option></select>
					<label>입사일자</label><input type = "text" class="form-control datepicker endDate" id="join_day" name="join_day" style="margin-left:8px;" value="${bDto.join_day}">
					<label>퇴사일자</label><input type ="text" class="form-control datepicker endDate" id="retire_day" name="retire_day" value="${bDto.retire_day}">							
					<label>직종분류</label><select class="form-control" id="job_type" name="job_type"><option>${bDto.job_type}</option></select>				
				</div>
				<div class="form-group"  style="float:right; padding-top:20px;" >
						<input type="submit" value="검색" class="form-control button" onclick="confirm('검색 하시겠습니까?')" style="color:blue; font-weight: bold;">
						<input type="reset" value="초기화" class="form-control button">
						<input type="submit" value="이전" onclick="history.back()" class="form-control button">
						<input type ="button" value="삭제" onclick="deleteUser()" class="form-control button" style="color:red; font-weight: bold;">
				</div>
			</form>
		</div>
		<hr>
		
		<!-- 새로추가 -->
      	<div class="container" style="padding-bottom: 340px;">
			<table class="table" id="reload">
			    <thead>
			    	<tr>
			    		<th>선택</th>
				        <th>사번</th>
				        <th>성명</th>
				        <th>주민번호</th>
				        <th>핸드폰번호</th>
				        <th>직위</th>
				        <th>입사일자</th>
				        <th>퇴사일자</th>
				        <th>투입여부</th>
			        	<th>연봉</th>
			    	</tr>
			    </thead>
			    <tbody>
			   		<c:forEach var ="i" items="${contents}">
				    	<tr>
				    		<td><input type="checkbox" id="delChk" name="delChk"></td>
				    		<td>${i.sabun }</td>
				    		<td>${i.name }</td>
				    		<td>${i.reg_no }</td>
				    		<td>${i.hp }</td>
				      		<td>${i.pos_gbn_code }</td>
				    		<td>${i.join_day }</td>
				    		<td>${i.retire_day }</td>
				    		<td>${i.put_yn }</td>
				    		<td>${i.salary }</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		<!-- 페이징 -->
		<nav aria-label="Page navigation example" style ="text-align:center">
			<ul class="pagination justify-content-center">
				<c:if test="${paging.startPage != 1 }">
					<li><a href="/listViewPaging?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">	
				 	<c:choose>
				 		<c:when test="${p==paging.nowPage }">
				 			<li><a href="#" class="page">${i }</a></li>
						</c:when>
				 		<c:when test="${p!=paging.nowPage }">
				 			<li><a href="/listViewPaging?nowPage=${i }&cntPerPage=${paging.cntPerPage}">${i }</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<li><a href="/listViewPaging?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
				</c:if>
			</ul>
		</nav>
		</div>
		
		
		
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
						$('#${i.name}').append('<option>${i.note}</option>');
					</c:forEach>
					
				}
				function deleteUser() {
	   					
						var deleteArr =[];
						
						$('input[name="delChk"]:checked').each(function(){
						
							deleteArr.push($(this).val());
						});
	   					if(deleteArr>0){
							confirm('삭제할 사번은'+deleteArr+' 입니다');
	   					}else {
	   						alert('삭제할 사원을 선택해주세요');
	   					}
	   					jQuery.ajaxSettings.traditional = true;
	   					$.ajax({
	   			            async: true,
	   			            type : 'POST',
	   			            data : {"delArr" : deleteArr},
	   			            url : "/delete",
	   			            dataType : "json", 
	   			            success : function(data) {
	   			                if (data >= 1) {
	   			                    alert("삭제완료");
	   			                    location.reload();
	      			            }else {
	   			                    alert("삭제실패");
	   			                }
	   			            }
	   			        });
				}	
	   			
				
			
			</script>
			
	<%@ include file = "include/footer.jsp" %>

</body>
</html>