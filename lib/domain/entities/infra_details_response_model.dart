import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mcs/core/resources/app_assets.dart';
import 'package:mcs/core/styles/app_colors.dart';
import 'package:mcs/domain/entities/dashboard_model.dart';
import 'package:mcs/domain/entities/error_model.dart';
part 'infra_details_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class InfraDetailsResponseModel extends ErrorModel {
  final List<InfraDetails>? data;

  const InfraDetailsResponseModel({
    error,
    status,
    this.data,
    userMessage,
    errors,
  }) : super(error, status, userMessage, errors);

  factory InfraDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$InfraDetailsResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$InfraDetailsResponseModelToJson(this);

  List<DashboardTable> getDataList() {
    final dataList = <DashboardTable>[];
    for (var d in data!) {
      var services = <String>{};
      var ports = <int>{};
      for (var value in d.services!) {
        services.add(value.serviceName!);
        ports.add(value.port!);
      }
      var dash = DashboardTable(
        d.ip!,
        d.operatingSystem?.product ?? '',
        services.toList(),
        ports.toList(),
        d.location?.city ?? d.location!.country!,
        d.autonomousSystem?.name ?? '',
        d.blackListSource != null && d.blackListSource!.isNotEmpty
            ? true
            : false,
      );
      dataList.add(dash);
    }
    return dataList;
  }

  List<DashboardCard> getCardDataList() {
    var locations = <String?>{};
    var providers = <String?>{};
    for (var value in data!) {
      locations.add(value.location?.city);
      providers.add(value.autonomousSystem?.name);
    }

    final cardDataList = <DashboardCard>[];
    cardDataList.add(DashboardCard(
        title: 'Total IPs',
        value: '${data?.length ?? 0}',
        color: kcPaleOrangeTwo,
        textColor: kcPaleOrange,
        icon: R.ASSETS_IMAGES_IP_PNG));
    cardDataList.add(DashboardCard(
        title: 'Blacklisted Ips',
        value:
            '${data?.where((element) => element.blackListSource != null && element.blackListSource!.isNotEmpty).toList().length ?? 0}',
        color: kcLightPink,
        textColor: kcReddishPink,
        icon: R.ASSETS_IMAGES_WARNING_PNG));

    cardDataList.add(DashboardCard(
        title: 'Cloud Locations',
        value: '${locations.length}',
        color: kcGrassyGreen20,
        textColor: kcGrassyGreen,
        icon: R.ASSETS_IMAGES_LOCATION_PNG));

    cardDataList.add(DashboardCard(
        title: 'Cloud Provider',
        value: '${providers.length}',
        color: kcLiteText,
        textColor: kcSlate,
        icon: R.ASSETS_IMAGES_CLOUD_PNG));
    return cardDataList;
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class InfraDetails extends Equatable {
  final String? ip;
  final List<Services>? services;
  final Location? location;
  final AutonomousSystem? autonomousSystem;
  final OperatingSystem? operatingSystem;
  final String? lastUpdatedAt;
  @JsonKey(name: 'blackListSource')
  final List<String>? blackListSource;

  const InfraDetails({
    this.ip,
    this.services,
    this.location,
    this.autonomousSystem,
    this.operatingSystem,
    this.lastUpdatedAt,
    this.blackListSource,
  });

  factory InfraDetails.fromJson(Map<String, dynamic> json) {
    return _$InfraDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InfraDetailsToJson(this);

  @override
  List<Object?> get props => [
        ip,
        services,
        location,
        autonomousSystem,
        operatingSystem,
        lastUpdatedAt,
      ];
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Services extends Equatable {
  final int? port;
  final String? serviceName;
  final String? transportProtocol;

  const Services({
    this.port,
    this.serviceName,
    this.transportProtocol,
  });

  factory Services.fromJson(Map<String, dynamic> json) {
    return _$ServicesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ServicesToJson(this);

  @override
  List<Object?> get props => [
        port,
        serviceName,
        transportProtocol,
      ];
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Location extends Equatable {
  final String? continent;
  final String? country;
  final String? countryCode;
  final String? city;
  final String? postalCode;
  final String? timezone;
  final String? province;
  final Coordinates? coordinates;
  final String? registeredCountry;
  final String? registeredCountryCode;

  const Location({
    this.continent,
    this.country,
    this.countryCode,
    this.city,
    this.postalCode,
    this.timezone,
    this.province,
    this.coordinates,
    this.registeredCountry,
    this.registeredCountryCode,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  List<Object?> get props => [
        continent,
        country,
        countryCode,
        city,
        postalCode,
        timezone,
        province,
        coordinates,
        registeredCountry,
        registeredCountryCode,
      ];
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Coordinates extends Equatable {
  final double? latitude;
  final double? longitude;

  const Coordinates({this.latitude, this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return _$CoordinatesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AutonomousSystem extends Equatable {
  final int? asn;
  final String? description;
  final String? bgpPrefix;
  final String? name;
  final String? countryCode;

  const AutonomousSystem({
    this.asn,
    this.description,
    this.bgpPrefix,
    this.name,
    this.countryCode,
  });

  factory AutonomousSystem.fromJson(Map<String, dynamic> json) {
    return _$AutonomousSystemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AutonomousSystemToJson(this);

  @override
  List<Object?> get props => [
        asn,
        description,
        bgpPrefix,
        name,
        countryCode,
      ];
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OperatingSystem extends Equatable {
  final String? uniformResourceIdentifier;
  final String? part;
  final String? product;
  final String? source;

  const OperatingSystem({
    this.uniformResourceIdentifier,
    this.part,
    this.product,
    this.source,
  });

  factory OperatingSystem.fromJson(Map<String, dynamic> json) {
    return _$OperatingSystemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OperatingSystemToJson(this);

  @override
  List<Object?> get props => [
        uniformResourceIdentifier,
        part,
        product,
        source,
      ];
}
