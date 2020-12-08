package com.example.my02_linearlayout;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
/*
constraint layout 에서 linear layout으로 바꾸는 방법
1. constraint layout > 마우스오른쪽 convert layout 클릭한 후 바꾸기
   & 왼쪽 상단 아이콘으로 vertical로 바꾸기

2. code에서 바꾸기

    <?xml version="1.0" encoding="utf-8"?>
    <LinearLayout
        xmlns:android="http://schemas.android.com/apk/res/android"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="vertical">

    </LinearLayout>

화면분할

감싸고 있는 레이아웃 코드에 android:weightSum="분할 하고자 하는 자식 레이아웃의 수"
자식 레이아웃 코드에  android:layout_weight="1" 추가한 후,
레이아웃이 vertical인 경우, 자식 레이아웃 코드의  android:layout_height를 0dp로 준다.
레이아웃이 horizontal인 경우, 자식 레이아웃 코드의  android:layout_width를 0dp로 준다.

 */