package com.example.study1_calculator;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }//onCreate()

    public void addClick(View view) {
        EditText number1 = findViewById(R.id.number1);
        EditText number2 = findViewById(R.id.number2);
        TextView result = findViewById(R.id.result);
        int n1 = Integer.parseInt(number1.getText().toString());
        int n2 = Integer.parseInt(number2.getText().toString());

        result.setText(Integer.toString(n1 + n2));
    }//addClick()

    public void subtractClick(View view) {
        EditText number1 = findViewById(R.id.number1);
        EditText number2 = findViewById(R.id.number2);
        TextView result = findViewById(R.id.result);
        int n1 = Integer.parseInt(number1.getText().toString());
        int n2 = Integer.parseInt(number2.getText().toString());

        result.setText(Integer.toString(n1 - n2));
    }//subtractClick()

    public void multiplyClick(View view) {
        EditText number1 = findViewById(R.id.number1);
        EditText number2 = findViewById(R.id.number2);
        TextView result = findViewById(R.id.result);
        int n1 = Integer.parseInt(number1.getText().toString());
        int n2 = Integer.parseInt(number2.getText().toString());

        result.setText(Integer.toString(n1 * n2));
    }//multiplyClick()

    public void divideClick(View view) {
        EditText number1 = findViewById(R.id.number1);
        EditText number2 = findViewById(R.id.number2);
        TextView result = findViewById(R.id.result);
        int n1 = Integer.parseInt(number1.getText().toString());
        int n2 = Integer.parseInt(number2.getText().toString());

        result.setText(Integer.toString(n1 / n2));
    }//divideClick()
}