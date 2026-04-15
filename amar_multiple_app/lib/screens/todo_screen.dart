import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  static const routeName = '/todo';

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _todoController = TextEditingController();
  final List<_TodoItem> _todos = [];

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  void _addTodo() {
    final task = _todoController.text.trim();
    if (task.isEmpty) {
      return;
    }

    setState(() {
      _todos.add(_TodoItem(title: task));
      _todoController.clear();
    });
  }

  void _toggleTodo(int index, bool? value) {
    setState(() {
      _todos[index] = _todos[index].copyWith(isDone: value ?? false);
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0A0F24),
              Color(0xFF1A1F3A),
              Color(0xFF2C2F6B),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _todoController,
                        decoration: const InputDecoration(
                          hintText: 'Add a new task',
                          prefixIcon: Icon(Icons.edit_note),
                        ),
                        onSubmitted: (_) => _addTodo(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _addTodo,
                      child: const Text('Add'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: _todos.isEmpty
                      ? const Center(
                          child: Text(
                            'No tasks yet. Add one to start.',
                            style: TextStyle(color: Colors.white70),
                          ),
                        )
                      : ListView.builder(
                          itemCount: _todos.length,
                          itemBuilder: (context, index) {
                            final todo = _todos[index];
                            return Card(
                              child: ListTile(
                                leading: Checkbox(
                                  value: todo.isDone,
                                  onChanged: (value) =>
                                      _toggleTodo(index, value),
                                ),
                                title: Text(
                                  todo.title,
                                  style: TextStyle(
                                    decoration: todo.isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  onPressed: () => _deleteTodo(index),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TodoItem {
  const _TodoItem({
    required this.title,
    this.isDone = false,
  });

  final String title;
  final bool isDone;

  _TodoItem copyWith({
    String? title,
    bool? isDone,
  }) {
    return _TodoItem(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}
