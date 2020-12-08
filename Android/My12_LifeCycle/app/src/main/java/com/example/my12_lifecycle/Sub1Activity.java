package com.example.my12_lifecycle;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

// 새창 띄우기 > Activity

public class Sub1Activity extends AppCompatActivity {
    Button btnSub1;
    Intent intent;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sub1);

        btnSub1 = findViewById(R.id.btnSub1);

        btnSub1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (getIntent() != null) {
                    intent = getIntent();

                }
                finish();
            }
        });//btnSub1.setOnClickListener
    }//onCreate
}//class