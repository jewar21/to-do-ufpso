import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_ufpso/models/task.dart';

void main() {
  group('Task Model Tests', () {
    test('Una nueva tarea debe inicializarse como no completada', () {
      final task = Task(id: '1', title: 'Aprender Flutter');

      expect(task.isCompleted, false);
      expect(task.title, 'Aprender Flutter');
    });

    test('toggleCompleted debe cambiar el estado de la tarea', () {
      final task = Task(id: '1', title: 'Aprender Flutter');
      
      expect(task.isCompleted, false);
      
      task.toggleCompleted();
      expect(task.isCompleted, true);
      
      task.toggleCompleted();
      expect(task.isCompleted, false);
    });
  });
}
