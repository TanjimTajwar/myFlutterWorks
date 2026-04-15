package com.tanjimadullah.mobileappdevelopmentosisir;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.util.Locale;
import java.util.Random;

public class ChildrenMathQuizActivity extends AppCompatActivity {
    private final Random random = new Random();
    private int a;
    private int b;
    private String op;
    private int answer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_children_math_quiz);

        TextView question = findViewById(R.id.quizQuestion);
        EditText answerInput = findViewById(R.id.quizAnswerInput);
        Button generateButton = findViewById(R.id.quizGenerateButton);
        Button checkButton = findViewById(R.id.quizCheckButton);
        TextView output = findViewById(R.id.quizOutput);

        generateButton.setOnClickListener(v -> {
            generateQuestion();
            question.setText(String.format(Locale.US, "%d %s %d = ?", a, op, b));
            answerInput.setText("");
            output.setText("New question generated");
        });

        checkButton.setOnClickListener(v -> {
            Integer userAnswer = parseInt(answerInput.getText().toString());
            if (userAnswer == null) {
                Toast.makeText(this, "Enter an integer answer", Toast.LENGTH_SHORT).show();
                return;
            }
            if (userAnswer == answer) {
                output.setText("Correct! Great job!");
            } else {
                output.setText(String.format(Locale.US, "Wrong. Correct answer: %d", answer));
            }
        });

        generateQuestion();
        question.setText(String.format(Locale.US, "%d %s %d = ?", a, op, b));
    }

    private void generateQuestion() {
        a = random.nextInt(10) + 1;
        b = random.nextInt(10) + 1;
        int pick = random.nextInt(3);

        if (pick == 0) {
            op = "+";
            answer = a + b;
        } else if (pick == 1) {
            op = "-";
            if (a < b) {
                int temp = a;
                a = b;
                b = temp;
            }
            answer = a - b;
        } else {
            op = "*";
            answer = a * b;
        }
    }

    private Integer parseInt(String value) {
        try {
            return Integer.parseInt(value.trim());
        } catch (Exception ignored) {
            return null;
        }
    }
}
