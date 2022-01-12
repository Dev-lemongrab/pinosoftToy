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
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script type="text/javascript" src="/js/common.js"></script>
<style type="text/css">
	
	
	.navbar-nav {
		float: right !important;
		margin: 0;
	}
	

	.container{
		margin-left: 280px;
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
		
		<form class="form-inline" action="/modify" method="post" onkeydown="return captureReturnKey(event)" enctype="multipart/form-data" style="width:1310px;">
			<div>
				<label id="h2" style="padding-bottom: 30px"><h2>직원상세정보</h2></label>
				<div class="form-group"  style="float:right; padding-top:20px;" >
						<input type="submit" value="수정" class="form-control rightBut" onclick="confirm('수정 하시겠습니까?')">
						<input type="button" value="전화면" onclick="location.href='/list'" class="form-control rightBut"> 
						
				</div>
			</div>
			<!-- 첫번째 grid -->
			
				<!--사진올리기  -->
				<div class="grid" style="text-align: center;">
					<div class="form-group">
						<img class="" id="profile_image" name="pro_img"   style ="width:165px; height:193px " src="upload/${One.profile_image}">
					</div>
						<input type="hidden" class="form-control" name="profile_image" id="profile_image" placeholder="" value="${One.profile_image}">
					<div class="form-group">
						<input type="file" id="profile_image_file" name="profile_image_file" class="form-control" accept="image/*" onchange="loadFile(this)">
					</div>
					<div class="form-group">
						<label>입사구분</label> <select class="form-control" id="join_gbn_code" name="join_gbn_code"><option></option><option selected="selected">${One.join_gbn_code} </option></select>
					</div>
					<div class="form-group">
						<label>군별</label> <select class="form-control yn mil" id="mil_type" name="mil_type"><option></option><option selected="selected">${One.mil_type }</option></select>
					</div>
					<div class="form-group">
						<label>KOSA등록</label> <select class="form-control yn" id="kosa_reg_yn" name="kosa_reg_yn"><option></option><option selected="selected">${One.kosa_reg_yn }</option></select>
					</div>
					<div class="form-group">
						<label>사업자번호</label> <input type="text" class="form-control hyphen" id="cmp_reg_no" name="cmp_reg_no" value="${One.cmp_reg_no}" >
					</div>	
				</div>
			
			<!-- 두번째 grid -->	
				<div class="grid" style="width:260px">
					<div class="form-group">
						<label>사번</label> <input type="text" class="form-control" disabled="disabled" id="sabun" name="sabunDis" value="${One.sabun}">
						<input type="hidden" name="sabun" value="${One.sabun}">
					</div>
					<div class="form-group">
						<label>*아이디</label> <input type="text" class="form-control duplicate" id="id" name="id" required="required" value="${One.id}">
					</div>
					<div class="form-group">
						<label>전화번호</label> <input type="text" class="form-control hyphen" id="phone" name="phone" value="${One.phone}">
					</div>
					<div class="form-group">
						<label>연령</label> <input type="text" class="form-control" id="years" name="years" value="${One. years}">
					</div>
					<div class="form-group">
						<label>주소</label> <input type="text" class="form-control" id="zip" name="zip" placeholder="우편번호" value="${One.zip}"style="width:80px !important;" > &nbsp;&nbsp;&nbsp;
					</div>
					<div class="form-group">
						<input type ="button" class="form-control" id ="search" style="width:76px !important; margin:-15px; font-size:10px;" value="주소검색">
					</div>
					<div class="form-group">
						<label>직위</label> <select class="form-control" id="pos_gbn_code" name="pos_gbn_code"><option></option><option selected="selected">${One.pos_gbn_code}</option></select>
					</div>
					<div class="form-group">
						<label>등급</label> <select class="form-control" id="gart_level" name="gart_level"><option></option><option selected="selected">${One.gart_level}</option></select>
					</div>
					<div class="form-group">
						<label>계급</label> <select class="form-control mil" id="mil_level" name="mil_level"><option></option><option selected="selected">${One.mil_level}</option></select>
					</div>
					<div class="form-group">
						<label>KOSA등급</label> <select class="form-control kosa" id="kosa_class_code" name="kosa_class_code"><option></option><option selected="selected">${One.kosa_class_code}</option></select>
					</div>
					<div class="form-group">
						<label>업체명</label> <input type="text" class="form-control" id="crm_name" name="crm_name" value="${One.crm_name}">
					</div>
				</div>
				
			<!-- 세번째 grid -->
				<div class ="grid" style="width: 331px;">
					<div class="form-group">
						<label>*한글성명</label> <input type="text" class="form-control validate" id="name" name="name" required="required" value="${One.name}" />
					</div>
					<div class="form-group">
						<label>*패스워드</label> <input type="password" class="form-control" id="pwd" name="pwd" required="required" value="${One.pwd}">
					</div>
					<div class="form-group">
						<label>*핸드폰 번호</label> <input type="text" class="form-control hyphen" id="hp" name="hp" required="required" value="${One.hp}">
					</div>
					<div class="form-group" >
					<label style="width:48px">*이메일</label> <input type="text" class="form-control" id="email1" name="email1" value="${email1 }"required="required" style="width:120px !important">
						&nbsp;&nbsp; <select class="form-control" id="email" name="email" style="width: 141px !important;"><option></option><option selected="selected">${One.email}</option></select>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소" value="${one.addr1}" style="width:328px !important">
					</div>
					<div class="form-group">
						<label>부서</label> <select class="form-control" id="dept_code" name="dept_code"><option></option><option selected="selected">${One.dept_code}</option></select>
					</div>
					<div class="form-group">
						<label>투입여부</label> <select class="form-control" id="put_yn" name="put_yn"><option></option><option selected="selected">${One.put_yn}</option></select>
					</div>
					<div class="form-group">
						<label>입영일자</label> <input type="text" class="form-control mil datepicker" id="mil_startdate" name="mil_startdate" value="${One.mil_startdate} ">
					</div>
					<div class="form-group">
						<label>입사일자</label> <input type="text" class="form-control datepicker" id="join_day" name="join_day" value="${One.join_day}">
					</div>
					<!-- id, name수정필요 -->
					<div class="form-group">
						<label>사업자등록증</label><input type="text" class="form-control" id="cmp_reg_image" name="cmp_reg_image" value="${One.cmp_reg_image}">
					</div>
					
				</div>

			<!-- 네번째 grid -->
							
			<div class="grid" style="text-align:left;width:391px;">
				<div class="form-group">
					<label>영문성명</label> <input type="text" class="form-control validate" id="eng_name" name="eng_name" value="${One.eng_name }"/>
				</div>
				<div class="form-group">
					<label>*패스워드확인</label> <input type="password" class="form-control pwdChk" id="pwChk" name="pwChk" required="required" value="${One.pwd }">
				</div>
				<div class="form-group">
					<label>*주민번호</label> <input type="text" class="form-control hyphen" id="reg_no1" name="reg_no1" required="required" maxlength="14" value="${One.reg_no }">
										  <input type="hidden" id="reg_no" name="reg_no"  value="${One.reg_no }">
				</div>
				<div class="form-group">
					<label>직종체크</label> <select class="form-control" id="job_type" name="job_type" style="width:90px !important"><option></option><option selected="selected">${One.job_type }</option></select>
				</div>
				<div class="form-group">
					<label style="width:60px">성별</label> <select class="form-control" id="sex" name="sex" style="width:90px !important"><option></option><option selected="selected">${One.sex }</option></select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="addr2" name="addr2" placeholder="세부주소" value="${One.addr2 }" style="width:344px !important">
				</div>
				<div class="form-group">
					<label>연봉(만원)</label> <input type="text" class="form-control" id="salary" name="salary" value="${One.salary }" style="text-align:right">
				</div>
				<div class="form-group">
					<label>군필여부</label> <select class="form-control yn" id="mil_yn" name="mil_yn"><option></option><option selected="selected">${One.mil_yn}</option></select>
				</div>
				<div class="form-group">
				<label>전역일자</label> <input type="text" class="form-control mil datepicker endDate" id="mil_enddate" name="mil_enddate" value="${One.mil_enddate }">
				</div>
				<div class="form-group">
					<label>퇴사일자</label> <input type="text" class="form-control datepicker endDate" id="retire_day" name="retire_day"value="${One.retire_day}">
				</div>
				<div class = "form-group">
					<button type="button" class="form-control button" id="modal_show">미리보기</button>
					<input type="file" class="form-control button" name="cmp_image_file" id="cmp_image_file" value="등록" onchange="cmpFile(this)">
				</div>
			</div>
			<div class="grid" style="float: none; text-align: center; width :1221px" >
				<div class="form-group">
					<label style="width:104px">자기소개</label>
					<textarea class="form-control" id="self_intro" name="self_intro"  style="width:450px !important">${One.self_intro}</textarea>
				</div>
				<div class="form-group">
					<label>이력서</label> <input type="text" class="form-control" id="carrier" name="carrier" value="${One.carrier}"style="margin-right:57px">
				</div>
				<div class="form-group" style="float:right">
					<button type="button" class="form-control button" id="modal_show2">미리보기</button>
					<input type ="file" name="carrier_image_file" id ="carrier_image_file" class="form-control button" value="등록" onchange="carrierFile(this)">	
				</div>
			</div>
		</form>
	</div>
	<!-- 이력서모달 -->
	<div class="modal fade" id="carModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="text-align: center;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">이력서</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" style="margin-left:370px;">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <img src="upload/${One.carrier}" class="img" id="car_img" > 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 사업자등록증 모달 -->
    <div class="modal fade" id="cmpModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="text-align: center;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">사업자등록증</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"style="margin-left:370px;">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <img src="upload/${One.cmp_reg_image}" class="img" id="cmp_img" > 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
		<script>
   	//한번 쭉돌려서 넣고 그담에 같은거 있으면 공백으로 바꿔주기
   			function setting (){
   				<c:forEach var="i" items="${list}">
   			 		$('#${i.name}').append('<option>${i.note}</option>');
   				</c:forEach>
   			}
   			
		</script>

	<%@include file="include/footer.jsp"%>

</body>
</html>