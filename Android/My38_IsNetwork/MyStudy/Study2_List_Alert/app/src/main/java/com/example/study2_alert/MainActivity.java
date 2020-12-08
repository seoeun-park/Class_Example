package com.example.study2_alert;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    private String[] items = {"망고 주스", "토마토 주스", "포도 주스"};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button listButton = findViewById(R.id.listButton);
        // 리스트 버튼을 클릭했을 때 발생하는 리스너
        listButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
                // → 여기서 builder는 팝업창을 의미한다고 볼 수 있다.
                // → 생성한 builder를 메인 액티비티에 종속 시킴

                builder.setTitle("리스트");    // setTitle : 팝업창의 제목 설정
                builder.setItems(items, new DialogInterface.OnClickListener() {
                // setItems : 팝업창의 하위 요소들을 설정정
               // new DialogInterface.OnClickListener() : 설정했던 하위 요소들을 클릭했을 때 발생하는 리스너
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        // 매개변수 : i → 클릭한 하위 요소의 인덱스
                        Toast.makeText(getApplicationContext(), items[i], Toast.LENGTH_SHORT).show();
                    }
                });

                AlertDialog alertDialog = builder.create();
                // → 생성한 builder를 alertDialog에 저장
                alertDialog.show();
            }//onClick()
        });//listButton.setOnClickListener()

        Button exitButton = findViewById(R.id.exitButton);
        exitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
                builder.setMessage("정말로 종료하시겠습니까?");
                builder.setTitle("종료 알림창")
                        .setCancelable(false)       // 사용자가 임의대로 종료할 수 없게 설정
                        .setPositiveButton("YES", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int i) {
                                finish();   // YES 버튼을 눌렀을 때 어플 종료
                            }
                        })
                        .setNegativeButton("NO", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int i) {
                                dialogInterface.cancel();   //NO 버튼을 눌렀을 때 팝업창만 종료
                            }
                        });
                AlertDialog alert = builder.create();
                alert.setTitle("종료 알림창");
                alert.show();

            }//onClick()
        });//exitButton.setOnClickListener()
    }//onCreate()
}//class