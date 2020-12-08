package com.example.my19_fragment2;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

public class ViewerFragment extends Fragment {
    MainActivity activity;
    ImageView imageView;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater,
                             @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {

        // main 화면에 fragment 붙이기
        ViewGroup rootView = (ViewGroup) inflater.inflate(R.layout.fragment_viewer,
                                container, false);
        activity = (MainActivity) getActivity();

        imageView = rootView.findViewById(R.id.imageView);


        return rootView;
    }//onCreateView()

    public void setChangeImage1(int index) {
        if(index == 1) {
            imageView.setImageResource(R.drawable.father);
        } else if (index == 2) {
            imageView.setImageResource(R.drawable.mother);
        }
    }//setChangeImage()

    public void setChangeImage2(int resId) {
        imageView.setImageResource(resId);
    }//setChangeImage()
}//class
