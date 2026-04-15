package com.tanjimadullah.mobileappdevelopmentosisir;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        setupFeatureNavigation(R.id.btnFeature1, TemperatureConverterActivity.class);
        setupFeatureNavigation(R.id.btnFeature2, BmiCalculatorActivity.class);
        setupFeatureNavigation(R.id.btnFeature3, GeneralCalculatorActivity.class);
        setupFeatureNavigation(R.id.btnFeature4, IslamicInheritanceActivity.class);
        setupFeatureNavigation(R.id.btnFeature5, ReverseStringActivity.class);
        setupFeatureNavigation(R.id.btnFeature6, TodoListActivity.class);
        setupFeatureNavigation(R.id.btnFeature7, PhoneCallSimulatorActivity.class);
        setupFeatureNavigation(R.id.btnFeature8, ZakahCalculatorActivity.class);
        setupFeatureNavigation(R.id.btnFeature9, EmailSenderSimulatorActivity.class);
        setupFeatureNavigation(R.id.btnFeature10, ChildrenMathQuizActivity.class);
    }

    // Bind one button to one target activity using explicit Intent navigation.
    private void setupFeatureNavigation(int buttonId, Class<?> targetActivity) {
        Button button = findViewById(buttonId);
        button.setOnClickListener(v -> startActivity(new Intent(this, targetActivity)));
    }

}
