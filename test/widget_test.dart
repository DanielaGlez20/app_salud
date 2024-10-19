// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Construir el widget y desencadenar un frame.
    

    // Verifica que nuestro contador comienza en 0.
    expect(find.text('Contador: 0'), findsOneWidget);
    expect(find.text('Contador: 1'), findsNothing);

    // Toca el icono '+' y desencadena un frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifica que nuestro contador ha incrementado.
    expect(find.text('Contador: 0'), findsNothing);
    expect(find.text('Contador: 1'), findsOneWidget);
  });
}
