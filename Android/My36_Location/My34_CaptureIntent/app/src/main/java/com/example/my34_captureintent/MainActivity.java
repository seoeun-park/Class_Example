package com.example.my34_captureintent;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.core.content.FileProvider;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;

import java.io.File;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "MainActivity";

    Button btnCap;
    ImageView imageView;

    File file = null;
    public int reqPicCode = 1004;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        checkDangerousPermissions();

        btnCap = findViewById(R.id.btnCap);
        imageView = findViewById(R.id.imageView);

        btnCap.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (file == null) {
                    file = createFile();    //파일 생성하기
                }

                Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
                
                // API24 이상부터는 file:// 대신 content:// 으로 접근이 가능하다.
                // 그래서 FileProvider를 사용해야 한다.
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                    intent.putExtra(MediaStore.EXTRA_OUTPUT,
                            FileProvider.getUriForFile(getApplicationContext(),
                                    getApplicationContext().getPackageName() + ".fileprovider",
                                    file));
                    Log.d(TAG, "onClick: " + getApplicationContext().getPackageName());
                } else {
                    intent.putExtra(MediaStore.EXTRA_OUTPUT, Uri.fromFile(file));
                }
                
                if (intent.resolveActivity(getPackageManager()) != null) {
                    startActivityForResult(intent, reqPicCode);
                }

            }//onClick()
        });//btnCap.setOnClickListener()
    }//onCreate()

    // 파일 생성하기
    private File createFile() {
        String imgFileName = "image.jpg";       // 파일 이름
        File storageDir = Environment.getExternalStorageDirectory();    //경로
        File curFile = new File(storageDir, imgFileName);

        Log.d(TAG, "createFile: " + curFile.getAbsolutePath());

        return curFile;
    }//createFile()

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        Log.d(TAG, "onActivityResult: " + requestCode);
        
        if (requestCode == reqPicCode) {
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inSampleSize = 8;   // 실제 해상도의 8분의 1로 크기를 설정
            if (file != null) {
                Bitmap bitmap = BitmapFactory.decodeFile(file.getAbsolutePath());
                imageView.setImageBitmap(bitmap);
            } else {
                Toast.makeText(this, "Image is null", Toast.LENGTH_SHORT).show();
            }
        }
    }

    //--------------------------------------------------------------
    //위험권한 승인
    private void checkDangerousPermissions() {
        String[] permissions = {
                Manifest.permission.CAMERA,
                Manifest.permission.READ_EXTERNAL_STORAGE,
                Manifest.permission.WRITE_EXTERNAL_STORAGE
        };

        int permissionCheck = PackageManager.PERMISSION_GRANTED;
        for (int i = 0; i < permissions.length; i++) {
            permissionCheck = ContextCompat.checkSelfPermission(this, permissions[i]);
            if (permissionCheck == PackageManager.PERMISSION_DENIED) {
                break;
            }
        }

        if (permissionCheck == PackageManager.PERMISSION_GRANTED) {
            Toast.makeText(this, "권한 있음", Toast.LENGTH_LONG).show();
        } else {
            Toast.makeText(this, "권한 없음", Toast.LENGTH_LONG).show();

            if (ActivityCompat.shouldShowRequestPermissionRationale(this, permissions[0])) {
                Toast.makeText(this, "권한 설명 필요함.", Toast.LENGTH_LONG).show();
            } else {
                ActivityCompat.requestPermissions(this, permissions, 1);
            }
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        if (requestCode == 1) {
            for (int i = 0; i < permissions.length; i++) {
                if (grantResults[i] == PackageManager.PERMISSION_GRANTED) {
                    Toast.makeText(this, permissions[i] + " 권한이 승인됨.", Toast.LENGTH_LONG).show();
                } else {
                    Toast.makeText(this, permissions[i] + " 권한이 승인되지 않음.", Toast.LENGTH_LONG).show();
                }
            }
        }
    }
}//class