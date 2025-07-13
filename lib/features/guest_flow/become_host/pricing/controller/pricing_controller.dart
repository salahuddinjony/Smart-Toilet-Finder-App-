import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mrweekes229/features/guest_flow/become_host/rules/screen/bathroom_rules_screen.dart';

class PricingController extends GetxController {
  // Pricing slots data
  List<Map<String, String>> pricingSlots = [
    {'time': '15 min', 'price': '\$2.50'},
    {'time': '25 min', 'price': '\$4.00'},
    {'time': '30 min', 'price': '\$5.00'},
  ];

  // Late fee settings
  bool lateFeeEnabled = false;
  String lateFeeAmount = '\$0.50';

  // Update slot time
  void updateSlotTime(int index, String time) {
    if (index >= 0 && index < pricingSlots.length) {
      pricingSlots[index]['time'] = time;
      update(); // This will rebuild GetBuilder widgets
    }
  }

  // Update slot price
  void updateSlotPrice(int index, String price) {
    if (index >= 0 && index < pricingSlots.length) {
      pricingSlots[index]['price'] = price;
      update();
    }
  }

  // Add new pricing slot
  void addNewSlot() {
    if (pricingSlots.length < 10) {
      // Limit to 10 slots
      pricingSlots.add({'time': '15 min', 'price': '\$2.50'});
      update();

      Get.snackbar(
        'Slot Added',
        'New pricing slot added successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Limit Reached',
        'Maximum 10 pricing slots allowed',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    }
  }

  // Remove pricing slot
  void removeSlot(int index) {
    if (pricingSlots.length > 1 && index >= 0 && index < pricingSlots.length) {
      pricingSlots.removeAt(index);
      update();

      Get.snackbar(
        'Slot Removed',
        'Pricing slot removed successfully',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Toggle late fee
  void toggleLateFee(bool enabled) {
    lateFeeEnabled = enabled;
    update();
  }

  // Update late fee amount
  void updateLateFee(String amount) {
    lateFeeAmount = amount;
    update();
  }

  // Validation
  bool validatePricing() {
    if (pricingSlots.isEmpty) {
      Get.snackbar(
        'No Pricing Slots',
        'Please add at least one pricing slot',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return false;
    }

    // Check for duplicate time slots
    Set<String> times = {};
    for (var slot in pricingSlots) {
      if (times.contains(slot['time'])) {
        Get.snackbar(
          'Duplicate Time Slots',
          'Please ensure all time slots are unique',
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
        return false;
      }
      times.add(slot['time']!);
    }

    return true;
  }

  // Go to next step
  void goToNextStep() {
    if (validatePricing()) {
      Get.snackbar(
        'Pricing Set',
        'Pricing configuration saved successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to next screen
      Get.to(() => BathroomRulesScreen());
    }
  }

  // Get pricing summary
  String getPricingSummary() {
    String summary = '${pricingSlots.length} pricing slots configured';
    if (lateFeeEnabled) {
      summary += ' with late fee of $lateFeeAmount';
    }
    return summary;
  }

  // Calculate total revenue potential
  double getTotalRevenuePotential() {
    double total = 0;
    for (var slot in pricingSlots) {
      String priceStr = slot['price']!.replaceAll('\$', '');
      double price = double.tryParse(priceStr) ?? 0;
      total += price;
    }
    return total;
  }

  // Get pricing data for API
  Map<String, dynamic> getPricingData() {
    return {
      'pricing_slots': pricingSlots,
      'late_fee_enabled': lateFeeEnabled,
      'late_fee_amount': lateFeeAmount,
      'total_slots': pricingSlots.length,
    };
  }

  // Reset pricing to defaults
  void resetPricing() {
    pricingSlots = [
      {'time': '15 min', 'price': '\$2.50'},
      {'time': '25 min', 'price': '\$4.00'},
      {'time': '30 min', 'price': '\$5.00'},
    ];
    lateFeeEnabled = false;
    lateFeeAmount = '\$0.50';
    update();
  }

  // Sort slots by time duration
  void sortSlotsByTime() {
    pricingSlots.sort((a, b) {
      int timeA = int.parse(a['time']!.replaceAll(' min', ''));
      int timeB = int.parse(b['time']!.replaceAll(' min', ''));
      return timeA.compareTo(timeB);
    });
    update();
  }

  // Auto-calculate suggested prices based on time
  void autoCalculatePrices() {
    for (int i = 0; i < pricingSlots.length; i++) {
      String timeStr = pricingSlots[i]['time']!.replaceAll(' min', '');
      int minutes = int.tryParse(timeStr) ?? 15;

      // Base rate: $0.15 per minute
      double suggestedPrice = minutes * 0.15;
      pricingSlots[i]['price'] = '\$${suggestedPrice.toStringAsFixed(2)}';
    }
    update();

    Get.snackbar(
      'Prices Updated',
      'Prices auto-calculated based on time duration',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }
}
