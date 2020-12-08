package com.example.my16_progress;

import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.SeekBar;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    ProgressBar progressBar;
    EditText etValue;
    Button button1, btnShow, btnClose;
    ProgressDialog dialog;
    SeekBar seekBar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        progressBar = findViewById(R.id.progressBar);
        etValue = findViewById(R.id.etValue);
        button1 = findViewById(R.id.button1);
        btnShow = findViewById(R.id.btnShow);
        btnClose = findViewById(R.id.btnClose);
        seekBar = findViewById(R.id.seekBar);

        progressBar.setIndeterminate(false);
        // → progressBar의 디폴트 값을 자동으로 주지 않는다는 의미
        progressBar.setMax(100);        // progressBar의 최댓값 설정
        progressBar.setProgress(20);    // 20% 진행된 상태로 나온다는 의미

        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (etValue.getText().toString().length() != 0) {
                    int value = Integer.parseInt(etValue.getText().toString());
                    progressBar.setProgress(value);
                } else {
                    Toast.makeText(MainActivity.this,
                                    "숫자를 입력하세요",
                                    Toast.LENGTH_SHORT).show();
                }
            }//onClick()
        });//button1.setOnClickListener()

        btnShow.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dialog = new ProgressDialog(MainActivity.this);
                dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
                dialog.setMessage("데이터를 확인하는 중입니다...");

                dialog.setCanceledOnTouchOutside(false);
                // → dialog 메세지 밖의 영역을 클릭해도
                //   dialog 메세지가 사라지지 않게 하기 위해서

                dialog.show();
            }
        });//btnShow.setOnClickListener()

        btnClose.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (dialog != null) {     // dialog가 실행중일 때
                    dialog.dismiss();     // dialog를 끈다.
                }
            }
        });//btnClose.setOnClickListener()

        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean b) {
            // 매개변수 : seekBar → 해당 seekBar / progress → 움직인 값
            //            b → user가 움직였을 경우 false, 컴퓨터가 움직였을 경우 true 반환
                //etValue.setText(String.valueOf(progress));  //int → String
                etValue.setText("" + progress); //int → String
            }//onProgressChanged

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {

            }
        });//seekBar.setOnSeekBarChangeListener()

    }//onCreate()
}//class