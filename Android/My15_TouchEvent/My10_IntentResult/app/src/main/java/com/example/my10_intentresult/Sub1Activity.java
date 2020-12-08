package com.example.my10_intentresult;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class Sub1Activity extends AppCompatActivity {
    private static final String TAG = "mainSub1Activity";

    Button btnSub1;
    TextView tvSub1;
    Intent intent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sub1);

        btnSub1 = findViewById(R.id.btnSub1);
        tvSub1 = findViewById(R.id.tvSub1);

        //데이터 받는 부분
        if (getIntent() != null) {
        //intent가 null인 경우에 getIntent() 메소드를 호출할 경우 error 발생!

            intent = getIntent();

            String id = intent.getStringExtra("id");
            int pw = intent.getIntExtra("pw", 0);
            PersonDto personDto1 = (PersonDto) intent.getSerializableExtra("personDto1");

            Log.d(TAG, "onCreate: " + id + ", " + pw);

            tvSub1.setText("받은 값은 : id => " + id);
            tvSub1.append("\npw => " + pw);
            tvSub1.append("\nPersonDto => " + personDto1.getId() +
                          ", " + personDto1.getPw());
        }

        //데이터를 main으로 보내기
        btnSub1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent reIntent = new Intent();
                reIntent.putExtra("key", tvSub1.getText().toString() + "\nㅋㅋㅋ");
                setResult(RESULT_OK, reIntent);

                finish();   //화면 끝내기
            }
        });//btnSub1.setOnClickListener

    }//onCreate()
}//class