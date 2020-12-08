package com.example.my24_tab3;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.Fragment;

import android.os.Bundle;
import android.util.Log;

import com.google.android.material.tabs.TabLayout;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "MainActivity";

    Toolbar toolbar;
    TabLayout tabs;
    Fragment1 fragment1;
    Fragment2 fragment2;
    Fragment3 fragment3;
    Fragment selected = null;

    Bundle mBundle = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        toolbar = findViewById(R.id.toolbar);
        //setSupportActionBar(toolbar);

        ActionBar actionBar = getSupportActionBar();
        actionBar.hide();
        // 기존에 있던 액션바의 전체를 보이지 않도록 설정

        fragment1 = new Fragment1();
        fragment2 = new Fragment2();
        fragment3 = new Fragment3();

        getSupportFragmentManager().beginTransaction()
                .replace(R.id.container, fragment1).commit();
        // → container(FrameLayout)에 fragment1을 붙여 넣음
        // → 앱을 실행할 때 첫번째 화면으로 fragment1이 보이도록 설정

        tabs = findViewById(R.id.tabs);
        tabs.addTab(tabs.newTab().setText("통화기록"));
        tabs.addTab(tabs.newTab().setText("스팸기록"));
        tabs.addTab(tabs.newTab().setText("연락처"));
        // 탭이 들어갈 공간(id.tabs)안에 탭을 생성하여 삽입

        tabs.setOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {
            // 탭이 선택되었을 때 실행되는 메소드
            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                int position = tab.getPosition();
                // → tab.getPosition() : 탭의 포지션을 반환

                Log.d(TAG, "onTabSelected: " + position);

                if (position == 0) {
                    selected = fragment1;
                    // → 탭의 position이 0일때 selected에 fragment1을 대입
                } else if (position == 1) {
                    selected = fragment2;
                } else if (position == 2) {
                    selected = fragment3;
                }
                getSupportFragmentManager().beginTransaction()
                        .replace(R.id.container, selected).commit();
                // → 조건문에서 대입된 selected를 container에 붙여넣음
            }
            // 탭이 선택되지 않았을 때 실행되는 메소드
            @Override
            public void onTabUnselected(TabLayout.Tab tab) {

            }
            // 탭이 다시 선택되었을 때 실행되는 메소드
            @Override
            public void onTabReselected(TabLayout.Tab tab) {

            }
        });//tabs.setOnTabSelectedListener()

    }//onCreate()

    //프래그먼트에서 보낸 데이터를 받는 메소드
    public void fragBtnClicked(Bundle bundle) {
        this.mBundle = bundle;
    }//fragBtnClicked()
}//class

/*
프로젝트 복사했을 때 바꿔야할 부분

1. java 폴더의 패키지 이름
2. res 폴더 > values > strings.xml
3. Gradle Scripts > build.gradle(Module:app)
4. Gradle Scripts > settings.gradle

 */