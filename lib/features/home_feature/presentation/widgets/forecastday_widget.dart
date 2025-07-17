import "package:flutter/material.dart";
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:weather_app/features/home_feature/domain/entities/location_entity.dart';

import '../../domain/entities/forecastday_entity.dart';

class ForecastdayWidget extends StatefulWidget {
  final DateTime firstDate;
  final Map<String, ForecastdayEntity> forecastdays;
  final LocationEntity location;
  const ForecastdayWidget({
    required this.firstDate,
    required this.forecastdays,
    required this.location,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ForecastdayWidgetState();
}

class _ForecastdayWidgetState extends State<ForecastdayWidget> {
  late DateTime firstDate;
  late DateTime selectedDate;
  late DateTime lastDate;
  late String formattedDate;
  late ForecastdayEntity forecastday;
  @override
  void initState() {
    super.initState();
    firstDate = widget.firstDate;
    lastDate = firstDate.add(const Duration(days: 6));
    selectedDate = firstDate;
    formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    forecastday = widget.forecastdays[formattedDate]!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _easyTimeLineDatePicker(),
          SizedBox(height: 24,),
          Text(
            "${widget.location.country} , ${widget.location.cityName}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network("https:${forecastday.condition.icon}"),
              SizedBox(width: 24,),
              Text(
                forecastday.condition.text,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_downward),
                  const SizedBox(width: 16,),
                  Text(
                    forecastday.minTempInC.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24,),
              Row(
                children: [
                  Icon(Icons.arrow_upward),
                  const SizedBox(width: 16,),
                  Text(
                    forecastday.maxTempInC.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 32,),
            ],
          ),
          const SizedBox(height: 32,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircularPercentIndicator(
                radius: 40,
                lineWidth: 10.0,
                percent: forecastday.maxWindInMph * 1/10,
                center: Icon(Icons.air),
                footer: const Column(
                  children: [
                    SizedBox(height: 24,),
                    Text(
                      "wind speed",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
              CircularPercentIndicator(
                radius: 40,
                lineWidth: 10.0,
                percent: forecastday.maxWindInMph * 1/10,
                center: Icon(Icons.water_drop),
                footer: const Column(
                  children: [
                    SizedBox(height: 24,),
                    Text(
                      "humidity",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _easyTimeLineDatePicker() {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.grey,
      ),
      child: EasyDateTimeLinePicker.itemBuilder(
        itemExtent: 80,
        selectionMode: SelectionMode.none(),
        itemBuilder: (context, date, isSelected, isDisabled, isToday, onTap) => InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color:isSelected? const Color.fromARGB(255, 23, 27, 29) : Colors.transparent,
              borderRadius: BorderRadius.circular(24)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('EEE').format(date),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height:16),
                Text(
                  date.day.toString(),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900
                  ),
                )
              ],
            ),
          ),
        ),
        focusedDate: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate,
        currentDate:firstDate ,
        timelineOptions: TimelineOptions(
          height: 150,
          padding: EdgeInsets.all(3)
        ),
        headerOptions:  HeaderOptions(
          headerType: HeaderType.none,
        ),
        onDateChange: (date) {
          // Handle the selected date.
          setState(() {
            selectedDate = date;
            formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
            forecastday = widget.forecastdays[formattedDate]!;
          });
        },
      ),
    );
  }
}
