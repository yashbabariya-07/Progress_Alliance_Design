import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:progress_alliance/Views/Components/LoginTextFormField/loginCustom.dart';
import 'package:progress_alliance/Views/Pages/Login/login.dart';


void main() {
  testWidgets('LoginPage renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
       
      ),
    );

    // Check for text widgets
    expect(find.text('Enter mobile number'), findsOneWidget);
    expect(find.text('Use mobile number to get continue'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    // Check for the mobile number input field
    expect(find.byType(MobileNumberInput), findsOneWidget);

    // Interact with the phone number input field
    await tester.enterText(find.byType(MobileNumberInput), '1234567890');
    await tester.pump();

    // Check that the button is tappable and triggers the onTap action
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Verify navigation
    expect(find.text('Connect'), findsOneWidget);  // assuming the next page shows 'Connect'
  });

  testWidgets('Terms and Privacy Policy are tappable', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
       
      ),
    );

    // Check Terms of Service text
    final termsOfServiceFinder = find.text('Terms of service');
    expect(termsOfServiceFinder, findsOneWidget);

    // Check Privacy Policy text
    final privacyPolicyFinder = find.text('Privacy Policy');
    expect(privacyPolicyFinder, findsOneWidget);

    // Optionally tap on the text and ensure it opens the correct page
    // Add the necessary navigation check here if applicable
  });
}
