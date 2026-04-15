package com.tanjimadullah.mobileappdevelopmentosisir;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;
import java.util.List;

public class TodoListActivity extends AppCompatActivity {
    private final List<String> todoItems = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_todo_list);

        EditText input = findViewById(R.id.todoInput);
        Button addButton = findViewById(R.id.todoAddButton);
        Button clearButton = findViewById(R.id.todoClearButton);
        TextView output = findViewById(R.id.todoOutput);

        addButton.setOnClickListener(v -> {
            String task = input.getText().toString().trim();
            if (task.isEmpty()) {
                Toast.makeText(this, "Enter a task first", Toast.LENGTH_SHORT).show();
                return;
            }
            todoItems.add(task);
            input.setText("");
            output.setText(formatTodoList());
        });

        clearButton.setOnClickListener(v -> {
            todoItems.clear();
            output.setText("No tasks yet.");
        });
    }

    private String formatTodoList() {
        if (todoItems.isEmpty()) {
            return "No tasks yet.";
        }
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < todoItems.size(); i++) {
            builder.append(i + 1).append(". ").append(todoItems.get(i)).append('\n');
        }
        return builder.toString().trim();
    }
}
