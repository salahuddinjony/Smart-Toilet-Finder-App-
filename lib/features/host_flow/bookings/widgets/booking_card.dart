import 'package:flutter/material.dart';
import 'package:mrweekes229/core/utils/constants/colors.dart';
import 'package:mrweekes229/features/host_flow/bookings/controller/all_booking_controller.dart';

class BookingCard extends StatelessWidget {
  final Booking booking;

  const BookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final statusColor =
        {
          'ongoing': Colors.amber.withValues(alpha: .4),
          'canceled': Colors.red.withValues(alpha: .4),
          'completed': Colors.green.withValues(alpha: .4),
          'upcoming': Colors.blue.withValues(alpha: .4),
        }[booking.status.toLowerCase()] ??
        Colors.grey;

    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: AppColors.info.withValues(alpha: .15),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              minLeadingWidth: 0,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  booking.imagePath ?? "assets/images/image1.png",
                  width: screenWidth * 0.15 > 70 ? 70 : screenWidth * 0.15,
                  height: screenWidth * 0.15 > 70 ? 70 : screenWidth * 0.15,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          Image.asset("assets/images/image1.png"),
                ),
              ),
              title: Text(
                booking.title ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: constraints.maxWidth * 0.7,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: AppColors.iconColor,
                        ),
                        Flexible(
                          child: Text(
                            booking.date ?? '',
                            style: const TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.access_time,
                          size: 16,
                          color: AppColors.iconColor,
                        ),
                        Flexible(
                          child: Text(
                            booking.time ?? '',
                            style: const TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: constraints.maxWidth * 0.7,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 16,
                          color: AppColors.iconColor,
                        ),
                        Flexible(
                          child: Text(
                            booking.userName,
                            style: const TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    booking.price ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.iconColor,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      booking.status,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
