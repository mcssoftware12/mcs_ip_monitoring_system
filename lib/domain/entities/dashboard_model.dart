import 'package:flutter/material.dart';
import 'package:mcs/core/styles/app_colors.dart';

class DashboardModel {
  final List<DashboardCard> dashCards;
  final List<DashboardTable> dashboardTable;

  DashboardModel(this.dashCards, this.dashboardTable);
}

class DashboardCard {
  final String title;
  final String value;
  final Color color;
  final Color textColor;
  final String icon;

  DashboardCard({
    required this.title,
    required this.value,
    required this.color,
    required this.textColor,
    required this.icon,
  });
}

class DashboardTable {
  final String ipAddress;
  final String? operatingSystem;
  final List<String> services;
  final List<int> openPorts;
  final String location;
  final String provider;
  final bool isBlackListed;

  DashboardTable(this.ipAddress, this.operatingSystem, this.services,
      this.openPorts, this.location, this.provider, this.isBlackListed,);
}