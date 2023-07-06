class CheckValidate{
  String? validateEmail(String? str){
    if(str!.isEmpty){
      return '이메일을 입력하세요,';
    }else{
      String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]'
          r'{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);
      if(!regExp.hasMatch(str)) {
        return '잘못된 이메일 형식입니다.';
      }else{
        return null;
      }
    }
  }

  String? validatePassword(String? str){
    if(str!.isEmpty){
      return '비밀번호를 입력하세요.';
    }else {
      String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
      RegExp regExp = RegExp(pattern);
      if(!regExp.hasMatch(str)){
        return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.';
      }else{
        return null;
      }
    }
  }
}