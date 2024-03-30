import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var sum = 0.0.obs;

var a = 0.0.obs;
  updateSum(newSum) {
    sum.value=newSum;
  }
  updateA(newA) {
    a.value=newA;

}
var b = 0.0.obs;
updateB(newB) {
    b.value=newB;

}
}