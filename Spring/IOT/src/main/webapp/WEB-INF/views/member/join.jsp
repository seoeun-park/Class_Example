<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table tr td { text-align: left; }
	table tr td input[name=tel], table tr td input[name=post] { 
		width: 50px; 
		text-align: center; 
	}
	
	input[name=addr] { width: calc(100% - 14px) }
	/* td를 기준으로 너비 100% 대신 양옆의 7px의 여백을 남겨두고  */
	
	.valid, .invalid {
		font-size:  13px; 
		font-weight: bold;
	}
	
	.valid { color: green; }
	.invalid { color: red; }

</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<h3>회원가입</h3>
	<p class="w-pct60 right" 
	   style=" margin: 0 auto; padding-bottom: 5px; font-size: 13px; ">* 은 필수입력항목입니다.</p>
	<form action="join" method="post" id='frmJoin'>
		<table class="w-pct60">
			<tr>
				<th class="w-px160">* 성명</th>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<th>* 아이디</th>
				<td>
					<input type="text" name="id" class="chk" /><a class="btn-fill-s" id="btn-id">아이디 중복확인</a><br/>
					<div class="valid">아이디를 입력하세요(영문 소문자, 숫자만 입력가능)</div>
				</td>
			</tr>
			<tr>
				<th>* 비밀번호</th>
				<td>
					<input type="password" name="pw" class="chk" />
					<div class="valid">비밀번호를 입력하세요(영문대.소문자, 숫자를 모두 포함)</div>
				</td>
			</tr>
			<tr>
				<th>* 비밀번호 확인</th>
				<td>
					<input type="password" name="pw_ck" class="chk" />
					<div class="valid">비밀번호를 다시 입력하세요</div>
				</td>
			</tr>
			<tr>
				<th>* 성별</th>
				<td>
					<label><input checked="checked" type="radio" name="gender" value="남" />남</label>
					<label><input type="radio" name="gender" value="여" />여</label>
					
				</td>
			</tr>
			<tr>
				<th>* 이메일</th>
				<td>
					<input type="text" name="email" class="chk" />
					<div class="valid">이메일을 입력하세요</div>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" name="birth" readonly />
					<span id="delete" style="color:red; position: relative; right: 25px; display: none" >
						<i class="fas fa-times font-img"></i>
					</span>
					<!-- 출처 : https://fontawesome.com/icons/times?style=solid -->
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="tel" maxlength="3" />
					 - <input type="text" name="tel" maxlength="4" />
					 - <input type="text" name="tel" maxlength="4" />
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<a class="btn-fill-s" onclick="daum_post()">우편번호 찾기</a>
					<input type="text" name="post" readonly /><br/>
					<input type="text" name="addr" readonly />
					<input type="text" name="addr" />
				</td>
			</tr>
		</table>
	</form>
	<div class="btnSet">
		<a class="btn-fill" onclick="go_join()">회원가입</a>
		<a class="btn-empty" onclick="history.go(-1)">취소</a>
	</div>
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	
	<!-- datepicker 사용하기 위해 : stylesheet도 설정해야 함(위에 link 태그 참조)  -->
	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	 
	<!-- 다음 우편번호 api -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script type="text/javascript">
		function go_join() {
			
			if( $("[name=name]").val() == "" ) {
				alert("성명을 입력하세요");
				$("[name=name]").focus();
				return;
			}

			//invalid인 경우 회원가입되지 않도록 한다.
			
			//아이디
			//중복확인을 한 경우
			if( $("[name=id]").hasClass("checked") ) {
				//이미 사용중인 아이디인 경우 회원가입 불가
				if( $("[name=id]").siblings("div").hasClass("invalid") ) {
					alert("회원가입 불가!\n" + join.userid.unUsable.desc );
					$("[name=id]").focus();
					return;
				}
			} else {
				//중복확인 하지 않은 경우
				if( !item_check( $("[name=id]") ) ) 	return;	
				else {
					alert("회원가입 불가!\n" + join.userid.valid.desc );
					$("[name=id]").focus();
					return;
				}
			}
			
			if( !item_check( $("[name=pw]") ) ) 		return;		//비밀번호
			if( !item_check( $("[name=pw_ck]") ) ) 		return;		//비밀번호 확인
			if( !item_check( $("[name=email]") ) ) 	return;		//이메일
			
			
			$("form").submit();
		}

		function item_check( item ) {
			var data = join.tag_status( item );
			if( data != undefined ){
				if( data.code == "invalid" ) {
					alert( "회원가입 불가\n" + data.desc );
					item.focus();
					return false;
				} 
				else return true;
			}
		}
	
		$("#btn-id").on("click", function() {
			userid_check();
		});

		function userid_check() {			
			//올바른 아이디인 경우만 중복확인 필요
			var $userid = $("[name=id]");
			if( $userid.hasClass("checked") ) return;	//이미 중복확인을 한 경우, 함수를 끝냄
			var data = join.tag_status( $userid );
			if( data.code != "valid" ) { 
				alert("아이디 중복확인 불필요\n" + data.desc);
				$userid.focus();
				return;
			}

			$.ajax({
				url: "id_check",
				data: { id: $userid.val() },
				success: function( data ) {
					data = join.userid_usable( data );
					display_status( $userid.siblings("div"), data);	
					$userid.addClass("checked");	//이미 중복확인을 한 경우
				},
				error: function(req, text) {
					alert(text + ":" + req.status);
				}			
			});	
		} //userid_check()
	
		$(".chk").on("keyup", function() {
			//아이디에 대해 입력 데이터를 변경시 다시 중복확인할 수 있도록 한다
			if( $(this).attr("name") == "id" ) {
				if( event.keyCode == 13 ) userid_check();
				else {
					$(this).removeClass("checked");
					validate( $(this) )
				}	
			} else	validate( $(this) );
		});

		function validate( tag ) {
			var data = join.tag_status( tag );
			display_status( tag.siblings("div"), data );
		}

		function display_status(div, data) {
			div.text( data.desc );
			div.removeClass();
			div.addClass( data.code );
		}
	
		var today = new Date();
		//만 13세 날짜까지만 선택하 수 있도록 제한
		
		var endDay = new Date( today.getFullYear()-13, today.getMonth(), today.getDate()-1 );

		$("[name=birth]").change(function() {
			$("#delete").css("display", "inline-block");
		});

		$("#delete").click(function() {
			$("[name=birth]").val("");
			$("#delete").css("display", "none");
		});
	
		$("[name=birth]").datepicker({
			showMonthAfterYear: true
			, dateFormat: "yy-mm-dd"
			, dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"]
			, monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", 
								"7월", "8월", "9월", "10월", "11월", "12월"]
			, changeMonth: true
			, changeYear: true
			, maxDate: endDay	
		});
		
		function daum_post() {
			new daum.Postcode({
				oncomplete: function(data) {
					$("[name=post]").val( data.zonecode );		//우편번호
					//사용자가 선택한 주소 타입에 따라 도로명 주소R / 지번 주소J
					var address 
						= data.userSelectedType == 'J' ? data.jibunAddress : data.roadAddress;

					if(data.buildingName != "") address += " (" + data.buildingName + ")";
					
					$("[name=addr]").eq(0).val( address );
				}
			}).open();
		} //daum_post()
	</script>
</body>
</html>