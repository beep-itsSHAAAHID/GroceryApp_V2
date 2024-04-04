import 'package:get/get.dart';

import '../models/order.dart';
import '../services/firestore_db.dart';
import '../styles/styles.dart';

class OrderController extends GetxController {
  final _isLoading = false.obs;
  final _isError = false.obs;
  final _errorMessage = ''.obs;

  // Observables for loading state
  bool get isLoading => _isLoading.value;
  bool get isError => _isError.value;
  String get errorMessage => _errorMessage.value;

  // Observable for open state
  var isOpen = false.obs;

  // Observable list of orders
  final orders = <Order>[].obs;
  List<Order> get productList => orders;

  @override
  void onReady() {
    super.onReady();
    // Bind orders stream when the controller is ready
   // orders.bindStream(FirestoreDB().getOrdersByStatus('Pending') as Stream<List<Order>>);
  }

  Future<void> getOrdersByStatus(String status) async {
    // Bind orders stream by status
   // orders.bindStream(FirestoreDB().getOrdersByStatus(status) as Stream<List<Order>>);
  }

  Future<void> deleteOrder(String id) async {
    _isLoading.value = true;
    try {
     // await FirestoreDB().deleteOrder(id);
    } catch (e) {
      _isError.value = true;
      _errorMessage.value = e.toString();
    } finally {
      _isLoading.value = false;
      // Show a snackbar indicating the deletion status
      Get.snackbar(
        'Deleted order',
        'Order is deleted successfully!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Styles.orangeColor,
        colorText: Styles.whiteColor,
        duration: const Duration(seconds: 1),
      );
    }
  }

  Future<void> updateOrder(Order order) async {
    _isLoading.value = true;
    try {
      // Update order status
      order.status = (order.status == 'preparing') ? 'shipping' : 'delivered';
     // await FirestoreDB().updateOrder(order);
    } catch (e) {
      _isError.value = true;
      _errorMessage.value = e.toString();
    } finally {
      _isLoading.value = false;
      // Show a snackbar indicating the update status
      Get.snackbar(
        'Updated order',
        'Order is updated successfully!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Styles.orangeColor,
        colorText: Styles.whiteColor,
        duration: const Duration(seconds: 1),
      );
    }
  }

  Future<void> addOrder(Order order) async {
    _isLoading.value = true;
    try {
     // await FirestoreDB().addOrder(order: order);
    } catch (e) {
      _isError.value = true;
      _errorMessage.value = e.toString();
    } finally {
      _isLoading.value = false;
      // Show a snackbar indicating the addition status
      Get.snackbar(
        'Added order',
        'Order is added successfully!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Styles.orangeColor,
        colorText: Styles.whiteColor,
        duration: const Duration(seconds: 1),
      );
    }
  }
}
