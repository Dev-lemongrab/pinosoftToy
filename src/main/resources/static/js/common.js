/*!
* Start Bootstrap - Agency v7.0.10 (https://startbootstrap.com/theme/agency)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-agency/blob/master/LICENSE)
*/
//
// Scripts
// 
		 
				
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
   			            url : "/idCheck",
   			            dataType : "json", 
   			            success : function(data) {
   			                if (data == 1) {
   			                	$('#id').val("");
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
   					
   					if(mil=='N'){
						
							$('#mil_yn').val("N");
						
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
   			
   		
   			$(function(){
   				$('.datepicker').datepicker({
   				});
   			});
   		 
   			
   		 $(document).ready(function() {
             $("#modal_show").click(function() {
                 $("#cmpModal").modal("show");
             });
             $("#modal_show2").click(function() {
                 $("#carModal").modal("show");
             });
  
           
         });
   			
   			function loadFile(input) {
   				var profile = input.files[0].name;
   			   	document.getElementById("profile_image").value=profile;
   			    var file = input.files[0];
   			    document.getElementById("profile_image").src = URL.createObjectURL(file);
   			};
   			function cmpFile(input) {
   			    let cmpfile = input.files[0].name;
   			    document.getElementById("cmp_reg_image").value = cmpfile;
   			    let file = input.files[0];
   			    document.getElementById("cmp_img").src = URL.createObjectURL(file);
   			};
   			function carrierFile(input) {
   			    let carrierfile = input.files[0].name;
   			    document.getElementById("carrier").value = carrierfile;
   			    let file = input.files[0];
   			    document.getElementById("car_img").src = URL.createObjectURL(file);
   			};
   			
   		
   		   function captureReturnKey(e) { 
		   if(e.keyCode==13 && e.srcElement.type != 'textarea') 
		   return false; 
			}
			