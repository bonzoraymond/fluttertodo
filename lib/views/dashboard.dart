import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import DateFormat class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ToDoListDashboard(),
    );
  }
}

class ToDoListDashboard extends StatefulWidget {
  const ToDoListDashboard({Key? key}) : super(key: key);

  @override
  _ToDoListDashboardState createState() => _ToDoListDashboardState();
}

class _ToDoListDashboardState extends State<ToDoListDashboard> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();
  List<Task> tasks = [];

  void addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to To Do List Dashboard',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text('Tasks'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()), // Navigate to ProfilePage
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.blue[100],
        child: Column(
          children: [
            _buildTaskInput(),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      '${tasks[index].name}: ${tasks[index].title}',
                      style: TextStyle(
                        decoration: tasks[index].completed
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    subtitle: Text(
                      'Category: ${tasks[index].category} | Due: ${DateFormat('yyyy-MM-dd HH:mm').format(tasks[index].dateTime!)}',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(tasks: tasks)),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                _showAddTaskDialog(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()), // Navigate to ProfilePage
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        label: const Text('To Do'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildTaskInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (tasks.isNotEmpty)
            const Text(
              'Tasks:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _showAddTaskDialog(BuildContext context) async {
    TextEditingController taskController = TextEditingController();
    DateTime? selectedDateTime;
    String? selectedCategory;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _taskController,
                decoration: const InputDecoration(
                  hintText: 'Enter task...',
                ),
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter your name...',
                ),
              ),
              DropdownButtonFormField<String>(
                value: selectedCategory,
                onChanged: (newValue) {
                  setState(() {
                    selectedCategory = newValue;
                  });
                },
                items: ['Personal', 'Work', 'Project']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  hintText: 'Select category...',
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    color: Colors.blue,
                    onPressed: () {
                      _selectDate(context, (DateTime pickedDate) {
                        setState(() {
                          selectedDateTime = pickedDate;
                        });
                      });
                    },
                  ),
                  if (selectedDateTime != null)
                    Text(
                      'Selected Date: ${DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime!)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final task = Task(
                  name: _nameController.text,
                  title: _taskController.text,
                  dateTime: selectedDateTime,
                  category: selectedCategory ?? 'Personal',
                );
                addTask(task);
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context, Function(DateTime) onSelect) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        onSelect(DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute));
      }
    }
  }
}

class Task {
  final String name;
  final String title;
  final bool completed;
  final DateTime? dateTime;
  final String category;

  Task({
    required this.name,
    required this.title,
    this.completed = false,
    this.dateTime,
    required this.category,
  });
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with default values
    _nameController.text = "John Doe"; // Replace with actual default name
    _emailController.text = "john.doe@example.com"; // Replace with actual default email
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Save changes
                    _saveChanges();
                  },
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _saveChanges() {
    // Perform actions to save changes (e.g., update database)
    String newName = _nameController.text;
    String newEmail = _emailController.text;
    // For demonstration, print the new values
    print('New Name: $newName');
    print('New Email: $newEmail');
    // You can add additional logic here to update the backend with the new values
    // Once saved, you can provide feedback to the user (e.g., show a snackbar)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Changes saved successfully!'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Task> tasks;

  const HomePage({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the number of completed tasks
    int completedTasksCount = tasks.where((task) => task.completed).length;
    // Calculate the total number of tasks
    int totalTasksCount = tasks.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total Tasks: $totalTasksCount',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Completed Tasks: $completedTasksCount',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.category),
                  trailing: task.completed ? const Icon(Icons.check) : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
