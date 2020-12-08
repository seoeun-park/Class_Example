/**
 * 회원가입시 유효성 체크
 */
 var space = /\s/g;
 
 var join = {

 	common: {
 		empty: { code: "invalid", desc: "입력하세요" },
 		space: { code: "invalid", desc: "공백없이 입력하세요"},
 		min: { code: "invalid", desc: "최소 5자 이상 입력하세요"},
 		max: { code: "invalid", desc: "최대 10자 이하 입력하세요"}
 	},
 	
 	userid: {
 		valid: { code: "valid", desc: "아이디 중복확인하세요" },
 		invalid: { code: "invalid", desc: "아이디는 영문 소문자, 숫자만 입력하세요" },
 		usable: { code: "valid", desc: "사용가능한 아이디입니다" },
 		unUsable: { code: "invalid", desc: "이미 사용중인 아이디입니다" }
 	},
 
 	userid_status: function( id ) {
 		var reg = /[^a-z0-9]/g;
 		
 		if( id == "" ) 				return this.common.empty;
 		else if ( id.match(space) ) return this.common.space;
 		else if ( reg.test(id) )	return this.userid.invalid;
 		else if ( id.length < 5 ) 	return this.common.min;
 		else if ( id.length > 10 ) 	return this.common.max;
 		else						return this.userid.valid;	
 	},
 	
 	userpw: {
 		valid: { code: "valid", desc: "사용가능한 비밀번호입니다." },
 		invalid: { code: "invalid", desc: "비밀번호는 영문 대/소문자, 숫자만 입력하세요" },
 		lack: {code: "invalid", desc: "영문 대/소문자, 숫자를 모두 포함해야 합니다."},
 		equal: {code: "valid", desc: "비밀번호가 일치합니다"},
 		notEqual: { code: "invalid", desc: "비밀번호가 일치하지 않습니다" }
 	},
 	
 	userpw_status: function(pw) {
 		var reg = /[^a-zA-Z0-9]/g;
 		var upper = /[A-Z]/g, 	lower = /[a-z]/g, 	digit = /[0-9]/g;
 	
 		if( pw == "" )				return this.common.empty;
 		else if ( pw.match(space) ) return this.common.space;
 		else if ( reg.test(pw) )	return this.userpw.invalid;
 		else if ( pw.length < 5 ) 	return this.common.min;
 		else if ( pw.length > 10 ) 	return this.common.max;
 		else if ( !upper.test(pw) || !lower.test(pw) || !digit.test(pw) )	
 									return this.userpw.lack;							
 		else						return this.userpw.valid;

 	},
 	
 	userpw_ck_status: function(pw_ck){
   		if(pw_ck == $("[name=pw]").val() )	return this.userpw.equal;
   		else                              	return this.userpw.notEqual;
	},
	
	email: {
		valid: { code: "valid", desc: "유효한 이메일입니다" },
		invalid: { code: "invalid", desc: "유효하지 않은 이메일입니다" },
	}, 
	
	email_status : function( email ) {
		var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if( email == "" )				return this.common.empty;
 		else if ( email.match(space) )	return this.common.space;
 		else if ( reg.test(email) )		return this.email.valid;
 		else							return this.email.invalid;
	},
	
	userid_usable: function( data ) {
		if( data )		return this.userid.usable;
		else			return this.userid.unUsable;
	
	},
 	
 	tag_status: function( tag ) {
 		var data = tag.val();
 		tag = tag.attr("name");
 	
 		if( tag == "id") data = this.userid_status( data );
 		else if( tag == "pw") data = this.userpw_status( data );
 		else if( tag == "pw_ck" ) data = this.userpw_ck_status( data );
 		else if( tag == "email" ) data = this.email_status( data );
 		return data;
 	}	
 }