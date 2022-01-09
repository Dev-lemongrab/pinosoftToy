<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리시스템</title>
<meta charset="utf-8" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />-->
<title>Pinosoft - 직원관리</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style type="text/css">
	
	
	.navbar-nav {
		float: right !important;
		margin: 0;
	}
	

	.container{
		margin-left: 50px;
		margin-right: 50px;
		width:1320px;
		
	}
	#h2 {
		width: 300px;
		text-align: left;
	}
	.form-control {
		width : 160px !important;
	}
	.button {
		margin-bottom : 7px;
		width : 150px !important;
	}
	.rightBut {
		width : 60px !important;
		padding:2px;
	}
	.section{
		width:200px;
	}
	.section input{
		width:100px;   
	}
	.grid{
		width:25%;
		float:left;
		
	}
	.form-group{
		padding-bottom: 7px;
	}
	.form-group > label{
		width :90px;
		text-align: center;
	}

	
</style>



</head>
<body>
	<%@include file="include/header.jsp"%>
	<div class="container" style="height: 700px;">
		
		<form class="form-inline" action="/regist/input" method="post">
			<div>
				<label id="h2" style="padding-bottom: 30px"><h2>직원상세정보</h2></label>
				<div class="form-group"  style="float:right; padding-top:20px;" >
						<input type="submit" value="등록" class="form-control rightBut" onclick="confirm('등록하시겠습니까?')">
						<input type="submit" value="전화면" onclick="history.back()" class="form-control rightBut"> 
						<input type="reset" value="초기화" class="form-control rightBut">
				</div>
			</div>
			<!-- 첫번째 grid -->
			
				<!--사진올리기  -->
				<div class="grid" style="text-align: center;">
					<div class="form-group">
						<input type="image" class="" id="cmp_reg_image" name="cmp_reg_image" style ="width:165px; height:193px">
					</div>
					<div class="form-group">
						<input type="button" class="form-control" id="faceImg" name="faceImg" value="사진올리기">
					</div>
					<div class="form-group">
						<label>입사구분</label> <select class="form-control" id="join_gbn_code" name="join_gbn_code"><option></option></select>
					</div>
					<div class="form-group">
						<label>군별</label> <select class="form-control mil yn" id="mil_type" name="mil_type"><option></option></select>
					</div>
					<div class="form-group">
						<label>KOSA등록</label> <select class="form-control yn" id="kosa_reg_yn" name="kosa_reg_yn"><option></option></select>
					</div>
					<div class="form-group">
						<label>사업자번호</label> <input type="text" class="form-control hyphen" id="cmp_reg_no" name="cmp_reg_no">
					</div>	
				</div>
			
			<!-- 두번째 grid -->	
				<div class="grid" style="width:260px">
					<div class="form-group">
						<label>사번</label> <input type="text" class="form-control" disabled="disabled" id="sabun" name="sabun">
					</div>
					<div class="form-group">
						<label>*아이디</label> <input type="text" class="form-control duplicate" id="id" name="id" required="required">
					</div>
					<div class="form-group">
						<label>전화번호</label> <input type="text" class="form-control hyphen" id="phone" name="phone">
					</div>
					<div class="form-group">
						<label>연령</label> <input type="text" class="form-control" id="years" name="years">
					</div>
					<div class="form-group">
						<label>주소</label> <input type="text" class="form-control" id="zip" name="zip" placeholder="우편번호" style="width:80px !important;"> &nbsp;&nbsp;&nbsp;
					</div>
					<div class="form-group">
						<button class="form-control" id ="search" style="width:76px !important; margin:-15px; font-size:10px;">주소검색</button>
					</div>
					<div class="form-group">
						<label>직위</label> <select class="form-control" id="pos_gbn_code" name="position"><option></option></select>
					</div>
					<div class="form-group">
						<label>등급</label> <select class="form-control" id="gart_level" name="gart_level"><option></option></select>
					</div>
					<div class="form-group">
						<label>계급</label> <select class="form-control mil" id="mil_level" name="mil_level"><option></option></select>
					</div>
					<div class="form-group">
						<label>KOSA등급</label> <select class="form-control kosa" id="kosa_class_code" name="kosa_class_code"><option></option></select>
					</div>
					<div class="form-group">
						<label>업체명</label> <input type="text" class="form-control" id="crm_name" name="crm_name">
					</div>
				</div>
				
			<!-- 세번째 grid -->
				<div class ="grid" style="width: 316px;">
					<div class="form-group">
						<label>*한글성명</label> <input type="text" class="form-control validate" id="name" name="name" required="required" />
					</div>
					<div class="form-group">
						<label>*패스워드</label> <input type="password" class="form-control" id="pwd" name="pwd" required="required">
					</div>
					<div class="form-group">
						<label>*핸드폰 번호</label> <input type="text" class="form-control hyphen" id="hp" name="hp" required="required">
					</div>
					<div class="form-group" >
					<label style="width:48px">*이메일</label> <input type="text" class="form-control" id="email1" name="email1" required="required" style="width:120px !important">
						&nbsp;&nbsp; <select class="form-control" id="email" name="email" style="width: fit-content !important;"><option></option></select>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소" style="width:307px !important">
					</div>
					<div class="form-group">
						<label>부서</label> <select class="form-control" id="dept_code" name="dept_code"><option></option></select>
					</div>
					<div class="form-group">
						<label>투입여부</label> <select class="form-control" id="put_yn" name="put_yn"><option></option></select>
					</div>
					<div class="form-group">
						<label>입영일자</label> <input type="text" class="form-control mil datepicker" id="mil_startdate" name="mil_startdate">
					</div>
					<div class="form-group">
						<label>입사일자</label> <input type="text" class="form-control datepicker" id="join_day" name="join_day">
					</div>
					<!-- id, name수정필요 -->
					<div class="form-group">
						<label>사업자등록증</label> <input type="text" class="form-control" id="cmp_reg_image" name="cmp_reg_image">
					</div>
					
				</div>

			<!-- 네번째 grid -->
							
			<div class="grid" style="text-align:left;width:391px;">
				<div class="form-group">
					<label>영문성명</label> <input type="text" class="form-control validate" id="eng_name" name="eng_name" />
				</div>
				<div class="form-group">
					<label>*패스워드확인</label> <input type="password" class="form-control pwdChk" id="pwChk" name="pwChk" required="required">
				</div>
				<div class="form-group">
					<label>*주민번호</label> <input type="text" class="form-control hyphen" id="reg_no1" name="reg_no1" required="required" maxlength="14">
										  <input type="hidden" id="reg_no" name="reg_no">
				</div>
				<div class="form-group">
					<label>직종체크</label> <select class="form-control" id="job_type" name="job_type" style="width:90px !important"><option></option></select>
				</div>
				<div class="form-group">
					<label style="width:60px">성별</label> <select class="form-control" id="sex" name="sex" style="width:90px !important"><option></option></select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="addr2" name="addr2" placeholder="세부주소" style="width:344px !important">
				</div>
				<div class="form-group">
					<label>연봉(만원)</label> <input type="text" class="form-control" id="salary" name="salary" style="text-align:right">
				</div>
				<div class="form-group">
					<label>군필여부</label> <select class="form-control yn" id="mil_yn" name="mil_yn"><option></option></select>
				</div>
				<div class="form-group">
				<label>전역일자</label> <input type="text" class="form-control mil datepicker endDate" id="mil_enddate" name="mil_enddate">
				</div>
				<div class="form-group">
					<label>퇴사일자</label> <input type="text" class="form-control datepicker endDate" id="retire_day" name="retire_day">
				</div>
				<div class = "form-group">
					<button class="form-control button">미리보기</button>
					<button class="form-control button">등록</button>
					
				</div>
			</div>
			<div class="grid" style="float: none; text-align: center; width :1221px" >
				<div class="form-group">
					<label style="width:104px">자기소개</label>
					<textarea class="form-control" id="self_intro" name="self_intro" style="width:450px !important"></textarea>
				</div>
				<div class="form-group">
					<label>이력서</label> <input type="text" class="form-control" id="carrier" name="carrier" style="margin-right:57px">
				</div>
				<div class="form-group">
					<button class="form-control button">다운</button>
					<button class="form-control button">파일업로드</button>
				</div>
			</div>
		</form>

	</div>
	<script>
   			$(()=>{
   				setting();
   				//dis();
   				$('.validate').keyup(function(){ 
	   				var name = $(this).attr('id');
					var input = $(this).val();
					if(name=='name'){
						var regExp= new RegExp(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g);				
					}else if(name=='eng_name' ){
						var regExp= new RegExp(/[^a-zA-Z]/);
					}
					$(this).val(input.replace(regExp,''));
   				});
   				
   				$('.pwdChk').change(function(){
   					var input = $(this).val();
   					var pwd = $('#pwd').val();
   					if(pwd !=input){
   						alert('비밀번호가 맞지 않습니다.');
   						$('#pwd,#pwChk').css({'border':'red 2px solid'});
   					}
   					else {
   						$('#pwd,#pwChk').css({'border':'blue 2px solid'});
   					}
   				});
   				
   				$('.duplicate').change(function() {
   					
   					var input = $(this).val();
   					
   					$.ajax({
   			            async: true,
   			            type : 'POST',
   			            data : {"input" : input},
   			            url : "/regist/idCheck",
   			            dataType : "json", 
   			            success : function(data) {
   			                if (data == 1) {
   			                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");			                    
      			            }else {
   			                    alert("사용가능한 아이디입니다.");
   			                }
   			            }
   			        });
   				});
   				$('.hyphen').keyup(function (e) {
   					var input = $(this).val();
   					var name = $(this).attr('id');
   					
   					if( name == 'phone' || name == 'hp'){//010-0332-3232
   						$(this).val(input.replace(/[^0-9]/g,"").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
   					}else if(name == 'cmp_reg_no'){//사업자번호
   						$(this).val(input.replace(/[^0-9]/g,"").replace(/([0-9]{3})([0-9]{2})([0-9]+)?/,"$1-$2-$3").replace("--","-"));
   					}else if(name == 'reg_no1'){
	   					var str1 = input.substring(0,input.length);
	   					var str2 = input.substring(7,input.length);
   						if(input.length==6){
   							$(this).val(str1+'-');		
   						}else if($(this).length){
   							$(this).append(str2);
   						}
   					} //주민번호 */
   				});
   				$('#reg_no1').change(function(){
   					var str = $(this).val();
   					$('#reg_no').val(str);
   					var str2 = str.substring(0,8);
   					var sex = str.substring(7,8);
   					var birth = str.substring(0,2);
   					var now = new Date();	// 현재 날짜 및 시간
   					var year = now.getFullYear();	// 연도
   					var age = (year-birth+1)-1900;
   					$(this).val(str2+'******');
   					if(sex=='1'||sex=='3'){
   						$('#sex').val('남');
   					}else{
   						$('#sex').val('여');
   					}
   					if(birth<30){
   						$('#years').val(age-100);
   					}else{
   						$('#years').val(age);
   					}
   						
   				});
   				
   				$('.yn').change(function(){
   					var mil = $('#mil_yn').val();
   				 	var mil_type = $('#mil_type').val();
   					var kosa = $('#kosa_reg_yn').val();
   					if(mil=='N'||mil_type =="미필"){
   						$('.mil').prop('disabled', true);
   						$('.mil').val('');
   					}else{
   						$('.mil').prop('disabled', false);
   					}
   					if(kosa=='N'){
   						$('.kosa').prop('disabled', true);
   						$('.kosa').val('');
   					}else{
   						$('.kosa').prop('disabled', false);
   					}
   						
   					
   					
   				});
   				
   				$('.endDate').change(function(){
   					var mil_startdate = $('#mil_startdate').val();
   					var mil_enddate = $('#mil_enddate').val();
   					var mil_startdateArr = mil_startdate.split('/');
   					var mil_enddateArr = mil_enddate.split('/');
   					var join_day = $('#join_day').val();
   					var retire_day = $('#retire_day').val();
   					var join_dayArr = join_day.split('/');
   					var retire_dayArr = retire_day.split('/');
   					
   					var mil_end_compare = new Date(mil_enddateArr[2], parseInt(mil_enddateArr[0])-1, mil_enddateArr[1]);
					var mil_start_compare = new Date(mil_startdateArr[2], parseInt(mil_startdateArr[0])-1, mil_startdateArr[1]);   					
   					
					var join_day_compare = new Date(join_dayArr[2], parseInt(join_dayArr[0])-1, join_dayArr[1] );
					var retire_day_compare = new Date(retire_dayArr[2], parseInt(retire_dayArr[0])-1, retire_dayArr[1] );
   					
   					if(mil_start_compare > mil_end_compare){
   						alert('입영날짜를 확인해주세요!');
   						$('#mil_enddate').val('');
   					}
   					
   					if(join_day_compare > retire_day_compare){
   						alert('입사날짜를 확인해주세요!');
   						$('#retire_day').val('');
   					}
   				});
   				
   				$('#search').click(function(){
   					new daum.Postcode({
   			            oncomplete: function(data) { //선택시 입력값 세팅
   			            	$('#zip').val(data.zonecode);
   			            	$('#addr1').val(data.address); // 주소 넣기
   			                $('#addr2').focus(); //상세입력 포커싱
   			            }
   			        }).open();
   				});
   				
   				$('#salary').keyup(function(){
   					
   					var x = $('#salary').val();
   					x = x.replace(/,/gi, '');
   				    
   					var regexp = /^[0-9]*$/;

   					if(!regexp.test(x)){ 
   						$('#salary').val(""); 
   						alert("숫자만 입력 가능합니다.");
   					} else {
   						x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");			
   						$('#salary').val(x);
   					}
   				});
   			})
   			
   			function setting (){
   				<c:forEach var="i" items="${list}">
   			 		$('#${i.name}').append('<option>${i.note}</option>');
   				</c:forEach>
   			}
   			$(function(){
   				$('.datepicker').datepicker({
   				});
   			});
   			
   			
   			
		</script>

	<%@include file="include/footer.jsp"%>

</body>
</html>