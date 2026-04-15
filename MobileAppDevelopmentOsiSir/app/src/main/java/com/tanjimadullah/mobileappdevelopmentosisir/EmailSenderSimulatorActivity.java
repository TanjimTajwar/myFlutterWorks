package com.tanjimadullah.mobileappdevelopmentosisir;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class EmailSenderSimulatorActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_email_sender_simulator);

        EditText toInput = findViewById(R.id.emailToInput);
        EditText subjectInput = findViewById(R.id.emailSubjectInput);
        EditText bodyInput = findViewById(R.id.emailBodyInput);
        Button sendButton = findViewById(R.id.emailSendButton);
        TextView output = findViewById(R.id.emailOutput);

        sendButton.setOnClickListener(v -> {
            String to = toInput.getText().toString().trim();
            String subject = subjectInput.getText().toString().trim();
            if (to.isEmpty() || subject.isEmpty()) {
                Toast.makeText(this, "To and Subject are required", Toast.LENGTH_SHORT).show();
                return;
            }
            output.setText("Email sent (simulation)\nTo: " + to + "\nSubject: " + subject +
                    "\nBody length: " + bodyInput.getText().toString().length() + " chars");
        });
    }
}
