package com.example.my20_pager;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentStatePagerAdapter;
import androidx.viewpager.widget.ViewPager;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    Button button1;
    ViewPager pager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        pager = findViewById(R.id.pager);

        pager.setOffscreenPageLimit(3);
        // → 좌우로 보여줄 화면의 갯수 설정

        Fragment fragment1 = new Fragment1();
        Fragment fragment2 = new Fragment2();
        Fragment fragment3 = new Fragment3();

        MyPagerAdapter adapter = new MyPagerAdapter(getSupportFragmentManager());

        adapter.addItem(fragment1);
        adapter.addItem(fragment2);
        adapter.addItem(fragment3);

        pager.setAdapter(adapter);  //fragment를 추가한 adapter를 pager에 설정
        button1 = findViewById(R.id.button1);
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                pager.setCurrentItem(1);
                // → page를 index가 1인(두번째) page로 바꾸기
            }
        });//button1.setOnClickListener

    }//onCreate()

    // FragmentStatePagerAdapter를 상속받는 클래스 정의
    class MyPagerAdapter extends FragmentStatePagerAdapter {
        ArrayList<Fragment> items = new ArrayList<>();  // fragment를 담을 무한배열

        // 생성자 메소드
        public MyPagerAdapter(@NonNull FragmentManager fm) {
            super(fm);
        }//MyPagerAdapter()

        // fragment를 추가해주는 메소드
        public void addItem(Fragment item) {
            items.add(item);
        }//addItem()

        // items 자체를 반환해주는 메소드
        @NonNull
        @Override
        public Fragment getItem(int position) {
        // 매개변수 : position items(무한배열)의 index
            return items.get(position);
        }//getItem()

        // items의 길이를 반환해주는 메소드
        @Override
        public int getCount() {
            return items.size();
        }//getCount()

        // 스트립(PagerTabStrip)의 텍스트를 정해주는 메소드
        @Nullable
        @Override
        public CharSequence getPageTitle(int position) {
            return "페이지" + (position + 1);
        }//getPageTitle()
    }//MyPagerAdapter()
}//class

/*
1. File 탭 > Project Structure > Dependencies > app > + 버튼 > Library Depedency
    > design으로 검색 > google로 되어있는 design 적용
    > Gradle Scripts의 build.gradle(Module:app) 코드로 들어가서 빨간줄이 떠있는 코드에 30.0.0으로 수정
    > 오른쪽 상단의 sync now 클릭

2. xml의 design 탭에서 Containers의 PagerView 다운로드 받기

ViewPager가 메인 전체를 차지하게 된다면 활용도가 떨어지게 되므로
메인 전체 화면이 ViewPager인 경우는 거의 없음
즉 ViewPager는 하나의 컨텐츠로(이미지 뷰어) 많이 쓰인다.

 */