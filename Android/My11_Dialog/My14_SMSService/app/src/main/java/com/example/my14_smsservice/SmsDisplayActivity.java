package com.example.my14_smsservice;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
/*수신할 SMS 내용을 보여주는 Activity*/
public class SmsDisplayActivity extends AppCompatActivity {
    TextView textView;
    Button button1, button2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sms_display);

        textView = findViewById(R.id.textView);
        button1 = findViewById(R.id.button1);
        button2 = findViewById(R.id.button2);

        Intent disIntent = getIntent();
        processIntent(disIntent);
        // → onCreate 메소드는 메인 엑티비티를 처음에 실행할때만 실행되므로
        //   onCreate 메소드에서 processIntent 메소드를 실행하면
        //   다음에 보낸 메세지는 메인 엑티비티에 갱신되지 못한다.
        //   그러므로 onNewIntent() 메소드를 오버라이드 시켜야 한다.

        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                // → button2(종료하기)를 클릭하면 SMS 내용을 보여주는
                //   Activity를 사라지게 한다
            }
        });//button2.setOnClickListener
    }//onCreate()

    private void processIntent(Intent disIntent) {
        String sender = disIntent.getStringExtra("sender");
        String receivedDate = disIntent.getStringExtra("receivedDate");
        String contents = disIntent.getStringExtra("contents");

        if (sender != null) {
            button1.setText(sender + "에서 문자 수신");
            textView.setText("[" + receivedDate + "]\n" + contents);
        }
    }//processIntent()

    // 문자 메세지를 갱신하기 위해 메인 엑티비티 refresh 기능을 해주는
    // onNewIntent를 오버라이드 해야한다.
    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);

        processIntent(intent);
    }//onNewIntent()
}//class