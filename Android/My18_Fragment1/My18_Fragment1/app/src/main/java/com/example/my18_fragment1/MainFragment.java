package com.example.my18_fragment1;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

public class MainFragment extends Fragment {
    MainActivity activity;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater,
                             @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {

        ViewGroup rootView = (ViewGroup) inflater.inflate(R.layout.fragment_main,
                                container, false);
        activity = (MainActivity) getActivity();
        //→ 현재 프래그먼트가 속해있는 메인 액티비티에 접근(메인 액티비티의 자바파일에 정의된 메소드에 접근하기 위해)

        Button btnMain = rootView.findViewById(R.id.btnMain);
        btnMain.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                activity.onFragmentChange(1);
            }
        });//btnMain.setOnClickListener()

        return rootView;
    }
}
