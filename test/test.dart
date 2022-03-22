import 'package:flutter_test/flutter_test.dart';
import 'package:meal/services/api.dart';

void main() async {
  var random = await getRandomMealData();
  var getList = await getCategoryData();
  print(random.lists?[0].strMeal);

  test('check random data', () {
    expect(random.lists?[0].strMeal, isNotNull);
  });
}
