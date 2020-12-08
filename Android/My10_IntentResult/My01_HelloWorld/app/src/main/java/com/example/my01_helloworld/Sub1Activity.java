package com.example.my01_helloworld;

import android.os.Bundle;
        import android.view.View;
        import android.widget.Button;

        import androidx.appcompat.app.AppCompatActivity;

public class Sub1Activity extends AppCompatActivity {
    Button btnRtnMain;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sub1);

        btnRtnMain = findViewById(R.id.btnRtnMain);
        btnRtnMain.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();       //화면 사라지게 하기

            }//onClick
        });//btnRtnMain.setOnClickListener
    }//onCreate
}//class