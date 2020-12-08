package com.example.my41_asynctask;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ProgressBar;

public class MainActivity extends AppCompatActivity {
    BackgroundTask backgroundTask;

    Button button1, button2;
    ProgressBar progressBar;
    int value;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        progressBar = findViewById(R.id.progressBar);
        button1 = findViewById(R.id.button1);
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                backgroundTask = new BackgroundTask(progressBar, value);
                backgroundTask.execute();
            }
        });//button1.setOnClickListener()

        button2 = findViewById(R.id.button2);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                backgroundTask.cancel(true);
                // → backgroundTask의 onCancled() 메소드가 호출
            }
        });//button2.setOnClickListener()

    }//onCreate()
}//class