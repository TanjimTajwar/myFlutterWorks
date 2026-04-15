package com.tanjimadullah.mobileappdevelopmentosisir;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.util.Locale;

public class GeneralCalculatorActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_general_calculator);

        EditText firstInput = findViewById(R.id.calcFirstInput);
        EditText secondInput = findViewById(R.id.calcSecondInput);
        Button addButton = findViewById(R.id.btnAdd);
        Button subButton = findViewById(R.id.btnSub);
        Button mulButton = findViewById(R.id.btnMul);
        Button divButton = findViewById(R.id.btnDiv);
        TextView output = findViewById(R.id.calcOutput);

        addButton.setOnClickListener(v -> calculate(firstInput, secondInput, output, "+"));
        subButton.setOnClickListener(v -> calculate(firstInput, secondInput, output, "-"));
        mulButton.setOnClickListener(v -> calculate(firstInput, secondInput, output, "*"));
        divButton.setOnClickListener(v -> calculate(firstInput, secondInput, output, "/"));
    }

    private void calculate(EditText firstInput, EditText secondInput, TextView output, String operation) {
        Double a = parseDouble(firstInput.getText().toString());
        Double b = parseDouble(secondInput.getText().toString());
        if (a == null || b == null) {
            Toast.makeText(this, "Enter two valid numbers", Toast.LENGTH_SHORT).show();
            return;
        }
        if ("/".equals(operation) && b == 0) {
            Toast.makeText(this, "Cannot divide by zero", Toast.LENGTH_SHORT).show();
            return;
        }

        double result;
        switch (operation) {
            case "+":
                result = a + b;
                break;
            case "-":
                result = a - b;
                break;
            case "*":
                result = a * b;
                break;
            default:
                result = a / b;
                break;
        }
        output.setText(String.format(Locale.US, "Result: %.2f", result));
    }

    private Double parseDouble(String value) {
        try {
            return Double.parseDouble(value.trim());
        } catch (Exception ignored) {
            return null;
        }
    }
}
