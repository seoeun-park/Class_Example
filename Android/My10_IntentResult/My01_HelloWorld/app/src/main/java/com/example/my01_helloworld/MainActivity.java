package com.example.my01_helloworld;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    EditText etPhone;
    Button btnCall, btnNewActivity;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        etPhone = findViewById(R.id.etPhone);
        btnCall = findViewById(R.id.btnCall);
        btnNewActivity = findViewById(R.id.btnNewActivity);

        btnCall.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String phoneNum = "tel:" + etPhone.getText().toString();
                // → etPhone.getText() : object 형식
                Intent intent = new Intent(Intent.ACTION_DIAL, Uri.parse(phoneNum));
                // Intent.ACTION_DIAL : 안드로이드의 암시적 Intent(전화걸기 기능 구현)
                //Uri.parse() : 전화번호, 페이지 url, 이메일주소 등등
                //              URL을 Uri Object로 변환해주기 위해 사용하는 메소드
                startActivity(intent);

            }//onClick
        });//btnCall.setOnClickListener

        btnNewActivity.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), Sub1Activity.class);
                startActivity(intent);
                // → 명시적 Intent
            }//onClick
        });//btnNewActivity.setOnClickListener

    }//onCreate

    // 이렇게 함수를 만들어 xml의 design탭의 onclicked 속성에 함수를 연결하여
    // 함수를 실행시키게 하는 방법도 있다.
    public void btn1Clicked(View view) {
        //팝업 메세지 띄우기 : Toast
        // context: this / getApplicationContext() / MainActivity.this
        // Context → 내가 가지고 있는 환경 설정 문서
        Toast.makeText(this, "버튼1이 클릭됨!", Toast.LENGTH_LONG).show();
    }//btn1Clicked()

    public void btn2Clicked(View view) {
        // url로 연결하여 새창 띄우기 : Intent
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://m.naver.com"));
        startActivity(intent);
    }//btn2Clicked()

}//class

/*
1. 명시적 인텐트 (Explicit Intent)
 - 명시적 인텐트 파라미터로 실행할 다음 엑티비티의 클래스이름을 넘겨주어
   새 엑티비티를 실행하는 인텐트를 말합니다.

Intent intent = new Intent(Context context, 실행할 새 엑티비티.class)
startActivity(intent);

2. 암시적 인텐트(Implicit Intent)
 - 암시적 인텐트는 다른 기능을하는 앱을 호출할수있는 기능입니다.

    1) 사이트의 url을 다른 브라우저 앱으로 실행시킬 때
    Intent intent =
    new Intent(Intent.ACTION_VIEW,Uri.parse(url주소));

    2) 전화를 걸지 않고 번호까지만 입력해줄 때
    Intent intent = new Intent(Intent.ACTION_DIAL,Uri.parse(“tel:”+“전화번호”));
    startActivity(intent);

    3) 전화번호를 입력하고 바로 걸어주게끔할 때
    Intent intent = new Intent(Intent.ACTION_CALL,Uri.parse(“tel:”+“전화번호”));
    startActivity(intent);
 */
