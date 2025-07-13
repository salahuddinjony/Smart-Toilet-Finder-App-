import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mrweekes229/features/guest_flow/package_hold/ship_host/screen/ship_to_host_screen.dart';
import '../model/package_model.dart';

class PackagesController extends GetxController {
  // Filter states
  String selectedFilter = 'all';

  // Package data
  List<PackageModel> allPackages = [];
  List<PackageModel> filteredPackages = [];

  // Loading state
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    loadPackages();
  }

  // Load packages from API or local storage
  Future<void> loadPackages() async {
    isLoading = true;
    update();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Sample data matching the image
      allPackages = [
        PackageModel(
          id: 'PKG001',
          name: 'Urban Comfort – Private Bathroom',
          description: 'Package for bathroom supplies',
          pickupLocation: 'Downtown Store',
          deliveryLocation: 'Urban Comfort Location',
          status: 'pending',
          size: 'Medium',
          createdAt: DateTime.now(),
          eta: 'Today 3:00pm-6:00pm',
        ),
        PackageModel(
          id: 'PKG002',
          name: 'Urban Comfort – Private Bathroom',
          description: 'Bathroom maintenance package',
          pickupLocation: 'Supply Center',
          deliveryLocation: 'Urban Comfort Location',
          status: 'completed',
          size: 'Large',
          createdAt: DateTime.now().subtract(const Duration(hours: 5)),
          deliveredAt: 'Delivered at 1:15 PM',
        ),
        PackageModel(
          id: 'PKG003',
          name: 'Urban Comfort – Private Bathroom',
          description: 'Small supplies package',
          pickupLocation: 'Local Store',
          deliveryLocation: 'Urban Comfort Location',
          status: 'completed',
          size: 'Small',
          createdAt: DateTime.now().subtract(const Duration(hours: 5)),
          deliveredAt: 'Delivered at 1:15 PM',
        ),
        PackageModel(
          id: 'PKG004',
          name: 'Urban Comfort – Private Bathroom',
          description: 'Medium size package',
          pickupLocation: 'Warehouse',
          deliveryLocation: 'Urban Comfort Location',
          status: 'pending',
          size: 'Medium',
          createdAt: DateTime.now(),
          eta: 'Today 5:00pm-8:00pm',
        ),
        PackageModel(
          id: 'PKG005',
          name: 'Urban Comfort – Private Bathroom',
          description: 'Rejected package',
          pickupLocation: 'Main Store',
          deliveryLocation: 'Urban Comfort Location',
          status: 'rejected',
          size: 'Small',
          createdAt: DateTime.now().subtract(const Duration(hours: 5)),
          rejectedAt: 'Rejected at 1:15 PM',
        ),
      ];

      applyFilter();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load packages: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading = false;
      update();
    }
  }

  // Set filter and apply
  void setFilter(String filter) {
    selectedFilter = filter;
    applyFilter();
    update();
  }

  // Apply current filter
  void applyFilter() {
    switch (selectedFilter) {
      case 'pending':
        filteredPackages =
            allPackages
                .where((p) => p.status.toLowerCase() == 'pending')
                .toList();
        break;
      case 'completed':
        filteredPackages =
            allPackages
                .where((p) => p.status.toLowerCase() == 'completed')
                .toList();
        break;
      case 'rejected':
        filteredPackages =
            allPackages
                .where((p) => p.status.toLowerCase() == 'rejected')
                .toList();
        break;
      default:
        filteredPackages = List.from(allPackages);
    }
  }

  void shipToHost() {
    Get.to(ShipToHostScreen());
  }

  void viewPackageDetails(PackageModel package) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Package Details',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 20),

            _buildDetailRow('Package ID', package.id),
            _buildDetailRow('Name', package.name),
            _buildDetailRow('Size', package.size),
            _buildDetailRow('Status', package.status),
            _buildDetailRow('Pickup', package.pickupLocation),
            _buildDetailRow('Delivery', package.deliveryLocation),

            if (package.eta != null) _buildDetailRow('ETA', package.eta!),

            if (package.deliveredAt != null)
              _buildDetailRow('Delivered', package.deliveredAt!),

            if (package.rejectedAt != null)
              _buildDetailRow('Rejected', package.rejectedAt!),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BCD4),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Close',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updatePackageStatus(PackageModel package) {
    _showStatusUpdateDialog(package);
  }

  void _showStatusUpdateDialog(PackageModel package) {
    Get.dialog(
      AlertDialog(
        title: const Text('Update Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStatusOption('Pending', package),
            _buildStatusOption('Completed', package),
            _buildStatusOption('Rejected', package),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
        ],
      ),
    );
  }

  Widget _buildStatusOption(String status, PackageModel package) {
    return ListTile(
      title: Text(status),
      onTap: () {
        _updatePackageStatus(package, status.toLowerCase());
        Get.back();
      },
    );
  }

  void _updatePackageStatus(PackageModel package, String newStatus) {
    final index = allPackages.indexWhere((p) => p.id == package.id);
    if (index != -1) {
      String? eta, deliveredAt, rejectedAt;

      switch (newStatus) {
        case 'pending':
          eta = 'Today 3:00pm-6:00pm';
          break;
        case 'completed':
          deliveredAt =
              'Delivered at ${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')} ${DateTime.now().hour >= 12 ? 'PM' : 'AM'}';
          break;
        case 'rejected':
          rejectedAt =
              'Rejected at ${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')} ${DateTime.now().hour >= 12 ? 'PM' : 'AM'}';
          break;
      }

      allPackages[index] = package.copyWith(
        status: newStatus,
        updatedAt: DateTime.now(),
        eta: eta,
        deliveredAt: deliveredAt,
        rejectedAt: rejectedAt,
      );
      applyFilter();
      update();

      Get.snackbar(
        'Status Updated',
        'Package status changed to $newStatus',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void addPackage(PackageModel package) {
    allPackages.add(package);
    applyFilter();
    update();
  }

  void deletePackage(String packageId) {
    allPackages.removeWhere((p) => p.id == packageId);
    applyFilter();
    update();
  }

  Future<void> refreshPackages() async {
    await loadPackages();
  }

  int getPackageCountByStatus(String status) {
    if (status == 'all') return allPackages.length;
    return allPackages.where((p) => p.status.toLowerCase() == status).length;
  }

  void searchPackages(String query) {
    if (query.isEmpty) {
      applyFilter();
    } else {
      filteredPackages =
          allPackages.where((package) {
            return package.name.toLowerCase().contains(query.toLowerCase()) ||
                package.description.toLowerCase().contains(
                  query.toLowerCase(),
                ) ||
                package.id.toLowerCase().contains(query.toLowerCase());
          }).toList();
    }
    update();
  }
}
