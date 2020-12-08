package com.example.my10_intentresult;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    Button btnMain;
    TextView tvMain;
    int REQUESTCODE = 1004;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnMain = findViewById(R.id.btnMain);
        tvMain = findViewById(R.id.tvMain);

        btnMain.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                // 데이터 보내는 부분
                PersonDto personDto1 = new PersonDto("hanul", 5678);
                Intent intent = new Intent(MainActivity.this,
                        Sub1Activity.class);
                intent.putExtra("id", "CSS");
                intent.putExtra("pw", 1234);
                intent.putExtra("personDto1", personDto1);
                startActivityForResult(intent, REQUESTCODE);
            }
        });//btnMain.setOnClickListener
    }//onCreate()

    // 오버라이드 (데이터를 받는 부분은 onActivityResult() 메소드에서 구현)
    // 마오 > Generate > Override Methods... > onActivityResult 검색
    // onActivityResult를 쳐도 자동완성 시켜준다.
    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == REQUESTCODE) {
            if (data != null) {     //여기서 data는 intent를 의미함
                String key =  data.getStringExtra("key");
                tvMain.setText(key);
            }
        }
    }//onActivityResult()
}//class