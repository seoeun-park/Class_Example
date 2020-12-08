// Dialog를 가장 많이 쓸 때는?
// → 삭제 버튼 눌렀을 때


package com.example.my11_dialog;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    TextView tvMessage;
    Button btnDialog;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        tvMessage = findViewById(R.id.tvMessage);
        btnDialog = findViewById(R.id.btnDialog);

        btnDialog.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                showMessage();
            }//onClick()
        });//btnDialog.setOnClickListener
    }//onCreate

    private void showMessage() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("안내");
        builder.setMessage("종료하시겠습니까?");
        builder.setIcon(android.R.drawable.ic_dialog_alert);

        //setPositiveButton : '예' 버튼
        builder.setPositiveButton("예", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                String message = "예 버튼이 눌렸습니다 : i => " + i;
                // 예 버튼이 눌렸습니다 : i => -1
                tvMessage.setText(message);
            }
        });//builder.setPositiveButton

        //setNegativeButton : '아니오' 버튼
        builder.setNegativeButton("아니오", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                String message = "아니오 버튼이 눌렸습니다 : i => " + i;
                // 아니오 버튼이 눌렸습니다 : i => -2
                tvMessage.setText(message);
            }
        });//builder.setNegativeButton

        //setNeutralButton : '취소' 버튼
        builder.setNeutralButton("취소", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                String message = "취소 버튼이 눌렸습니다 : i => " + i;
                // 취소 버튼이 눌렸습니다 : i => -3
                tvMessage.setText(message);
            }
        });//builder.setNeutralButton

        //버튼 보여주기 단계
        AlertDialog dialog = builder.create();
        dialog.show();

    }//showMessage()
}//class

//함수 만들기 자동완성 키
// alt + enter
