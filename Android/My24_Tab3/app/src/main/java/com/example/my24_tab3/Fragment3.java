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

public class Fragment3 extends Fragment {
    MainActivity activity;
    String sendData, receiveData;

    Button button3;
    TextView textView3;

    Student student3;

    @Override
    public void onAttach(@NonNull Context context) {
        super.onAttach(context);

        activity = (MainActivity) getActivity();
        sendData = "프래그먼트3에서 보낸 데이터입니다.";
        receiveData = "";
        student3 = new Student("PARK", 33);
    }//onAttach()

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater,
                             @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {
        ViewGroup rootView = (ViewGroup) inflater.inflate(R.layout.frament3, container, false);
        textView3 = rootView.findViewById(R.id.textView3);
        button3 = rootView.findViewById(R.id.button3);

        // 데이터 보낸 곳
        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Bundle bundle = new Bundle();
                bundle.putString("sendData", sendData);
                bundle.putSerializable("student3", student3);
                bundle.putInt("index", 2);

                activity.fragBtnClicked(bundle);

                TabLayout.Tab tab = activity.tabs.getTabAt(0);
                tab.select();
            }
        });// button3.setOnClickListener()

        //데이터 받는 곳
        if (activity.mBundle != null) {
            Bundle bundle = activity.mBundle;
            receiveData = bundle.getString("sendData");

            Student student2 = (Student) bundle.getSerializable("student2");

            textView3.setText(receiveData + "\n");
            textView3.append("name : " + student2.getName() + "\n" +
                             "age : " + student2.getAge());
            activity.mBundle = null;
        }

        return rootView;
    }//onCreateView()
}//class
