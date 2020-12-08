package com.example.my12_lifecycle;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "MainActivity";    //logt 쓰고 자동완성
    Button btnMain;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Log.d(TAG, "onCreate: 호출됨");

        btnMain = findViewById(R.id.btnMain);

        btnMain.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), Sub1Activity.class);
                startActivity(intent);
            }
        });//btnMain.setOnClickListener
    }//onCreate


    @Override
    protected void onStart() {
        super.onStart();
        Log.d(TAG, "onStart: 호출됨");
    }

    @Override
    protected void onStop() {
        super.onStop();
        Log.d(TAG, "onStop: 호출됨");
        savePersonal();
        // → 서브 페이지를 띄울 때(메인 페이지를 비활성화) 실행
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Log.d(TAG, "onDestroy: 호출됨");
    }

    @Override
    protected void onPause() {
        super.onPause();
        Log.d(TAG, "onPause: 호출됨");
    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.d(TAG, "onResume: 호출됨");
        loadPersonal();
        // → 처음 메인화면을 생성할 때 (id : default, pw : 0)
        //   & 서브 페이지를 닫고(finish()) 메인 페이지로 돌아갈때 실행(id : tjdms5322, pw : 1234)
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        Log.d(TAG, "onRestart: 호출됨");
    }

    //---------------------------------------------------------------------------
    //onCreate → onStart → onResume : 화면 생성 시
    // → onPause → onStop : 새 창 띄우기 버튼 클릭 시 메인 페이지 정지 후 대기
    // → onRestart → onStart → onResume : 돌아가기 버튼 클릭 시 메인 페이지 구동
    // → onPause → onStop → onDestroy : 뒤로가기 클릭 시 메모리 삭제

    //onCreate : 화면을 시작하게끔 메모리 구동
    //onStart : 화면 시작
    //onResume : 화면을 조작하게끔 해줌
    //          ex) 환경 설정, 데이터베이스 조작 기능을 첨부할 수 있음
    //---------------------------------------------------------------------------

    // 메인 페이지 비활성화될 때 개인정보를 저장하는 기능 → onStop() 메소드에서 호출
    private void savePersonal() {
        SharedPreferences pref = getSharedPreferences("personal",
                                Activity.MODE_PRIVATE);
        SharedPreferences.Editor editor = pref.edit();
        editor.putString("id", "tjdms5322");
        editor.putInt("pw", 1234);
        editor.commit();
    }//savePersonal()

    // 메인 페이지가 활성화될 대 개인정보를 불러오는 기능 → onResume() 메소드에서 호출
    private void loadPersonal() {
        SharedPreferences pref = getSharedPreferences("personal",
                                Activity.MODE_PRIVATE);
        if (pref != null) {
            // 두번째 매개변수(s1, i)는 id와 pw의 값이 null인 경우 나타낼 디폴트 값이다
            String id =  pref.getString("id", "default");
            int pw = pref.getInt("pw", 0);

            Log.d(TAG, "loadPersonal: " + id + ", " + pw);
        }
    }//loadPersonal()

}//class