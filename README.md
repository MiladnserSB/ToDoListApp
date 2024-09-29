# To-Do List Application

## Overview
The To-Do List Application is a simple Flutter-based app that allows users to manage their tasks efficiently. Users can add, view, complete, and delete tasks with ease. The app is designed to be user-friendly and works seamlessly on both Android and iOS devices.

## Features
- **Task Addition**: Easily add new tasks by specifying the task title.
- **Task Viewing**: View all tasks in a list, with completed tasks marked differently.
- **Task Completion**: Mark tasks as completed or revert them back to pending.
- **Task Deletion**: Delete tasks from the list when they are no longer needed.

## Getting Started

### Installation
1. Download the application from the Google Play Store after it has been uploaded.
2. Install the app on your device.

### Usage
1. Open the application.
2. To add a task, simply input the task title and press 'Add'.
3. To modify a task, tap on the task you wish to edit, make your changes, and save.
4. To delete a task, swipe left on the task or use the delete option in the task details.
5. To mark a task as completed, tap on the checkbox next to the task; tap again to revert it back to pending.

## Documentation

### State Management
The application uses the Bloc state management solution to handle task states effectively. This allows for a reactive programming model where the UI updates automatically based on changes in the underlying state.

### Data Persistence
Tasks are stored locally using [Hive](https://docs.hivedb.dev/#/) for data persistence. This ensures that tasks remain saved and accessible even after closing and reopening the app.

### UI/UX Design
The app employs Flutter's material components to create a clean and intuitive user interface. Attention to detail has been given to ensure that user interactions are smooth and enjoyable.

### Code Quality
The code is structured according to Dart and Flutter best practices, ensuring maintainability and readability.

## Evaluation Criteria
1. **Functionality**: The application meets all core feature requirements.
2. **Code Quality**: The code is well-structured and clean.
3. **State Management**: Effective use of Bloc for managing app state.
4. **UI/UX Design**: User-friendly interface with attention to design principles.
5. **Documentation**: Clear and concise instructions for setup and usage.

## Additional Information
Feel free to explore and enjoy managing your tasks with the To-Do List Application! If you encounter any issues or have suggestions for improvements, please reach out.

