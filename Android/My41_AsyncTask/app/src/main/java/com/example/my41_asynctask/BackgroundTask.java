package com.example.my41_asynctask;

import android.os.AsyncTask;
import android.util.Log;
import android.widget.ProgressBar;

public class BackgroundTask extends AsyncTask<Void, Integer, String> {
    private static final String TAG = "main:BackgroundTask";

    ProgressBar progressBar;
    int value;

    // 생성자 메소드 : 메인에서의 progressBar, value를 받기 위해
    public BackgroundTask(ProgressBar progressBar, int value) {
        this.progressBar = progressBar;
        this.value = value;
    }

    //doInBackground 메소드가 실행되기 전에 설정이나 초기값을 지정
    @Override
    protected void onPreExecute() {
        super.onPreExecute();

        value = 0;
        progressBar.setProgress(value);
        // → progressBar를 초기에 0으로 설정
    }//onPreExecute()

    @Override
    protected String doInBackground(Void... voids) {
        while (!isCancelled()) {
            value++;
            if (value >= 100) {
                break;
            } else {
                //publishProgress(value);
                // → onProgressUpdate() 메소드 호출한 후 value를 넘겨줌

                publishProgress(value, value+1, value+2);
                // → onProgressUpdate() 메소드 호출한 후 배열(values)을 넘겨줌
            }

            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }//while

        return "100% 완료...";
    }//doInBackground()

    @Override
    protected void onProgressUpdate(Integer... values) {
        super.onProgressUpdate(values);

        progressBar.setProgress(values[0].intValue());
        Log.d(TAG, "onProgressUpdate1: " + values[1].toString());
        Log.d(TAG, "onProgressUpdate2: " + values[2].toString());
    }//onProgressUpdate()

    @Override
    protected void onPostExecute(String result) {
        super.onPostExecute(result);

        Log.d(TAG, "onPostExecute: " + result);

        progressBar.setProgress(0);
    }//onPostExecute()

    @Override
    protected void onCancelled() {
        super.onCancelled();

        Log.d(TAG, "onCancelled: 실행 취소됨!!");
        //progressBar.setProgress(0);
        // → 실행 취소를 눌렀을 때 progressBar가 다시 0으로 초기화
    }
}//class
