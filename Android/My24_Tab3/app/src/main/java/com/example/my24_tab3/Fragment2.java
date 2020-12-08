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

public class Fragment2 extends Fragment {
    MainActivity activity;
    String sendData, receiveData;

    Button button2;
    TextView textView2;

    Student student2;   // 보낼 데이터를 담을 DTO

    //화면이 붙을 때 불러오는 메소드
    @Override
    public void onAttach(@NonNull Context context) {
        super.onAttach(context);

        activity = (MainActivity) getActivity();
        sendData = "프래그먼트2에서 보낸 데이터입니다.";
        receiveData = "";
        student2 = new Student("LEE", 27);
    }//onAttach()

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater,
                             @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {
        ViewGroup rootView = (ViewGroup) inflater.inflate(R.layout.frament2, container, false);
        textView2 = rootView.findViewById(R.id.textView2);
        button2 = rootView.findViewById(R.id.button2);

        //데이터 보내는 곳
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Bundle bundle = new Bundle();
                bundle.putString("sendData", sendData);
                bundle.putSerializable("student2", student2);
                bundle.putInt("index", 1);

                activity.fragBtnClicked(bundle);

                TabLayout.Tab tab = activity.tabs.getTabAt(2);
                tab.select();
            }
        });//button2.setOnClickListener()

        //데이터 받는 곳
        if(activity.mBundle != null) {      //mBundle에 데이터가 있을 때
            Bundle bundle = activity.mBundle;
            receiveData = bundle.getString("sendData");
            //int index = bundle.getInt("index");

            Student student1 = (Student) bundle.getSerializable("student1");
            //String name = student1.getName();
            //int age = student1.getAge();

            textView2.setText(receiveData + "\n");
            textView2.append("name : " + student1.getName() + "\n" +
                             "age : " + student1.getAge());
            activity.mBundle = null;    //데이터 정리
        }

        return rootView;
    }//onCreateView()
}//class
