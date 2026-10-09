import 'package:flutter_test/flutter_test.dart';
import 'package:social_login_replica/main.dart';

void main() {
  testWidgets('shows static login page', (tester) async {
    await tester.pumpWidget(const SocialLoginApp());
    expect(find.text('Log into Facebook'), findsOneWidget);
    expect(find.text('Create new account'), findsOneWidget);
  });
}
