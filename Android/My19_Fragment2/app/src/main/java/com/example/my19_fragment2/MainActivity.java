package com.example.my19_fragment2;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;

import android.os.Bundle;

import java.util.List;

public class MainActivity extends AppCompatActivity {
    ListFragment listFragment;
    ViewerFragment viewerFragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        FragmentManager manager = getSupportFragmentManager();

        listFragment = (ListFragment) manager.findFragmentById(R.id.listFragment);
        viewerFragment = (ViewerFragment) manager.findFragmentById(R.id.viewerFragment);

    }//onCreate()
    /*
    public void onImageSelected1(int index) {
        viewerFragment.setChangeImage1(index);
    }//onImageSelected1()
    */
    public void onImageSelected2(int resId) {
        viewerFragment.setChangeImage2(resId);
    }//onImageSelected1()

    /*
    버튼을 클릭했을 때 이미지를 바꾸는 방법 2가지

    1. MainActivity.java에 button1을 눌렀을 경우 숫자 1을 넘겨주고
        button2를 눌렀을 경우 숫자 2를 넘겨주는 메소드 정의(onImageSelected())한 다음,
        ViewerFragment에 이미지를 바꾸는 메소드를 정의(setChangeImage())하고
        onImageSelected() 메소드에서 호출한다.
    2. 1번 방법과 그대로이지만 매개변수로 숫자가 아닌 이미지 그 자체(R.drawable.father)로 설정하는 방법
     */

}//class