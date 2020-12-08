package com.example.my18_fragment1;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

public class MainActivity extends AppCompatActivity {

    MainFragment mainFragment;
    SubFragment subFragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        /*mainFragment = new MainFragment();*/
        mainFragment = (MainFragment) getSupportFragmentManager().findFragmentById(R.id.mainFragment);
        subFragment = new SubFragment();

/*        getSupportFragmentManager().beginTransaction()
                .replace(R.id.container, mainFragment).commit();*/
    }//onCreate()

    // 프래그먼트를 바꾸는 메소드
    public void onFragmentChange(int state) {
    // 매개변수 : state → 어떤 프래그먼트인지 저장하는 변수
        if (state == 1) {
            getSupportFragmentManager().beginTransaction()
                    .replace(R.id.container, subFragment).commit();
        } else if (state == 2) {
            getSupportFragmentManager().beginTransaction()
                    .replace(R.id.container, mainFragment).commit();
        }
    }//onFragmentChange()
}//class

/*

Intent를 통한 서브 액티비티 띄우기 vs Fragment

1. Intent를 통한 서브 액티비티 띄우기
Intent를 생성하여 os로 전달한 다음,
os를 통해 intent로 sub 액티비티에서 메인 액티비티를 띄움

2. Fragment
1) Fragment는 os와 관련이 없기 때문에 intent가 필요 x

2) Fragment를 만들기 위해서는 한 Fragment 당 java, xml파일이 필요하다.
	- 특히 Fragment의 java 파일에서 MainActivity 클래스는 Fragment를 상속받아야한다.

3) 메인 액티비티안에 프래그먼트 매니저를 통해 os를 거치지 않고 바로 Fragment를 제어할 수 있다.

4) 메인 액티비티 위에 fragment가 올라오게 하는 방법 3가지

	① 메인 xml의 name 속성에 프래그먼트 주소를 값으로 넣기
	② xml에서 fragment 태그 지우기 > MainFragment, SubFragment 생성자를 통해 변수 만들기
	  > getSupportFragmentManager().beginTransaction().replace() 활용하기
	③ 1번 방법 그대로 > MainFragment, SubFragment를 새로 생성하지 않고
	                   getSupportFragmentManager().findFragmentById()를 통해
	                   찾아놓은 프래그먼트를 삽입하기

5) 메인 액티비티에 띄운 프래그먼트를 다른 프래그먼트로 바꾸려면
    메인 액티비티의 java 파일에 프래그먼트를 바꾸는 메소드를 정의해야한다.
 */