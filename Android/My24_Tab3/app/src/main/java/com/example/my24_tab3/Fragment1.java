package com.example.my24_tab3;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.google.android.material.tabs.TabLayout;

public class Fragment1 extends Fragment {
    MainActivity activity;
    String sendData, receiveData;

    Button button1;
    TextView textView1;

    Student student1;

    //화면이 붙을 때 불러오는 메소드
    @Override
    public void onAttach(@NonNull Context context) {
        super.onAttach(context);

        activity = (MainActivity) getActivity();
        sendData = "프래그먼트1에서 보낸 데이터입니다.";
        receiveData = "";
        student1 = new Student("KIM", 25);

    }//onAttach()

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater,
                             @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {
        ViewGroup rootView = (ViewGroup) inflater.inflate(R.layout.frament1, container, false);
        textView1 = rootView.findViewById(R.id.textView1);
        button1 = rootView.findViewById(R.id.button1);

        // 데이터 받는 곳
        if (activity.mBundle != null) {
            Bundle bundle = activity.mBundle;
            receiveData = bundle.getString("sendData");
            Student student3 = (Student) bundle.getSerializable("student3");

            textView1.setText(receiveData + "\n");
            textView1.append("name : " + student3.getName() + "\n" +
                             "age : " + student3.getAge());

            activity.mBundle = null;
        }

        // 데이터 보내는 곳
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Bundle bundle = new Bundle();
                bundle.putString("sendData", sendData);
                bundle.putSerializable("student1", student1);
                bundle.putInt("index", 0);

                activity.fragBtnClicked(bundle);
                // → 데이터를 메인으로 보내기

                TabLayout.Tab tab = activity.tabs.getTabAt(1);
                tab.select();
                // → 두번째 탭을 선택하게끔 설정
                //   > MainActivity의 setOnTabSelectedListener가 작동
                //   > 메인에 본래 있던 fragment를 지우고 fragment2를 나타내게 함
            }
        });//button1.setOnClickListener()

        return rootView;
    }//onCreateView()
}//class
