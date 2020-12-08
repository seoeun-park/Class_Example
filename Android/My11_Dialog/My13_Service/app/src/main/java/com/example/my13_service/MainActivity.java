package com.example.my13_service;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.security.Provider;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "MainActivity";

    EditText etMsg;
    Button btnStart, btnStop;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        etMsg = findViewById(R.id.etMsg);
        btnStart  = findViewById(R.id.btnStart);
        btnStop = findViewById(R.id.btnStop);

        btnStart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String name = etMsg.getText().toString();
                //→ etMsg의 텍스트를 가져와 name 변수에 대입
                Log.d(TAG, "onClick: " + name);

                Intent intent = new Intent(getApplicationContext(), MyService.class);
                // → 해당 context를 내용으로 삼아 MyService의 기능을 수행하는 새 창 띄우기

                intent.putExtra("command", "show");
                intent.putExtra("name", name);
                // → intent에 해당 이름을 가진 데이터를 대입

                startService(intent);      //intent를 통해 서비스 시작
            }
        });//btnStart.setOnClickListener

        btnStop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), MyService.class);
                stopService(intent);    // 서비스 종료
            }
        });//btnStop.setOnClickListener
    }//onCreate()
}//class