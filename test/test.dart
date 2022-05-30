import 'package:meal/services/api.dart';

void main() async {
  // var random = await getRandomMealData();
  // var getList = await getCategoryData();
  // var data = await getMealDataByCategory(inputText: 'SeaFood');
  var areaList = await getAreaList();
  // print(random.lists?[0].strMeal);
  // print(data.lists?[0].strMeal);
  print(areaList.lists);

  // test('check random data', () {
  //   expect(random.lists?[0].strMeal, isNotNull);
  // });
  //
  // test('search by category', () {
  //   expect(data.lists?[0].strMeal, 'Baked salmon with fennel & tomatoes');
  // });
}
