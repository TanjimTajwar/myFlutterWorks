package com.tanjimadullah.mobileappdevelopmentosisir;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class ReverseStringActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reverse_string);

        EditText input = findViewById(R.id.reverseInput);
        Button reverseButton = findViewById(R.id.reverseButton);
        TextView output = findViewById(R.id.reverseOutput);

        reverseButton.setOnClickListener(v -> {
            String text = input.getText().toString();
            output.setText(new StringBuilder(text).reverse().toString());
        });
    }
}
