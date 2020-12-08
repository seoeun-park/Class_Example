package com.example.my09_layoutinflater;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    Button button1;
    LinearLayout linearLay;
    RelativeLayout relativeLay;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        button1 = findViewById(R.id.button1);

        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                linearLay = findViewById(R.id.linearLay);
                relativeLay = findViewById(R.id.relativeLay);

                LayoutInflater inflater =
                        (LayoutInflater) getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                inflater.inflate(R.layout.sub1_layout, linearLay, true);
                inflater.inflate(R.layout.sub2_layout, relativeLay, true);

                Button button2 = linearLay.findViewById(R.id.button2);
                button2.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        Toast.makeText(MainActivity.this, "서브1버튼 클릭", Toast.LENGTH_LONG).show();
                    }
                });//button2.setOnClickListener

                Button button3 = relativeLay.findViewById(R.id.button3);
                button3.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        Toast.makeText(MainActivity.this, "서브2버튼 클릭", Toast.LENGTH_LONG).show();
                    }
                });//button3.setOnClickListener
            }
        });//button1.setOnClickListener

    }//onCreate
}//class