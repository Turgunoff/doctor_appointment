import 'dart:ui';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:table_calendar/table_calendar.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  DateTime _selectedDay = DateTime.now();

  DateTime _focusedDay = DateTime.now();

  List<Widget> _generateTimeSlots() {
    List<Widget> slots = [];
    DateTime startTime = DateTime.now(); // Start from current time

    startTime = DateTime(startTime.year, startTime.month, startTime.day,
        9); // Set the start time to 7:00 AM
    DateTime endTime = DateTime(startTime.year, startTime.month, startTime.day,
        18); // Set the end time to 6:00 PM

    while (startTime.isBefore(endTime)) {
      slots.add(
        GestureDetector(
          onTap: () {
          },
          child: Container(
            decoration: BoxDecoration(
              //primary color
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              DateFormat.jm().format(startTime),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
      startTime = startTime.add(const Duration(hours: 1));
    }

    return slots;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left_2),
          onPressed: () {
            Get.back();
          },
        ),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.white.withAlpha(100),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(100),
        title: const Text('Doctor Details'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 80, // Adjusted to leave space for the button
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text: Select Date
                    const Text(
                      'Select Date',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Date Picker
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TableCalendar(
                        availableCalendarFormats: const {
                          CalendarFormat.month: 'Month',
                        },
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          leftChevronIcon: Icon(Iconsax.arrow_left_2),
                          rightChevronIcon: Icon(Iconsax.arrow_right_3),
                        ),
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          weekendStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        firstDay: DateTime.utc(
                            2023, 1, 1), // Start calendar from Sunday
                        lastDay: DateTime.utc(2050, 12, 31),
                        focusedDay: _focusedDay,
                        selectedDayPredicate: (day) =>
                            isSameDay(_selectedDay, day),
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        },
                        daysOfWeekVisible:
                            true, // Include days of week at the top
                        calendarFormat: CalendarFormat.month,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Select Hour',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GridView.count(
                      padding: EdgeInsets.zero,
                      childAspectRatio: 2.3,
                      crossAxisCount: 3, // 3 buttons per row
                      shrinkWrap: true, // Adjust height dynamically
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable scrolling if grid fits
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: _generateTimeSlots(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                  top: 12, left: 20, right: 20, bottom: 12),
              child: GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                    backgroundColor: Colors.white,
                    title: "Congratulations!",
                    titlePadding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    titleStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    middleTextStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                    contentPadding: const EdgeInsets.all(30),
                    middleText:
                        "Your appointment with Dr. David Patel is confirmed for June 30, 2023, at 10:00 AM.",
                    actions: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'Done',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Edit your appointment',
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
