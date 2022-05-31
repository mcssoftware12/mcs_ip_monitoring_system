// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infra_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfraDetailsResponseModel _$InfraDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    InfraDetailsResponseModel(
      error: json['error'],
      status: json['status'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => InfraDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      userMessage: json['user_message'],
      errors: json['errors'],
    );

Map<String, dynamic> _$InfraDetailsResponseModelToJson(
        InfraDetailsResponseModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'status': instance.status,
      'user_message': instance.userMessage,
      'errors': instance.errors,
      'data': instance.data,
    };

InfraDetails _$InfraDetailsFromJson(Map<String, dynamic> json) => InfraDetails(
      ip: json['ip'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Services.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      autonomousSystem: json['autonomous_system'] == null
          ? null
          : AutonomousSystem.fromJson(
              json['autonomous_system'] as Map<String, dynamic>),
      operatingSystem: json['operating_system'] == null
          ? null
          : OperatingSystem.fromJson(
              json['operating_system'] as Map<String, dynamic>),
      lastUpdatedAt: json['last_updated_at'] as String?,
      blackListSource: (json['blackListSource'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$InfraDetailsToJson(InfraDetails instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'services': instance.services,
      'location': instance.location,
      'autonomous_system': instance.autonomousSystem,
      'operating_system': instance.operatingSystem,
      'last_updated_at': instance.lastUpdatedAt,
      'blackListSource': instance.blackListSource,
    };

Services _$ServicesFromJson(Map<String, dynamic> json) => Services(
      port: json['port'] as int?,
      serviceName: json['service_name'] as String?,
      transportProtocol: json['transport_protocol'] as String?,
    );

Map<String, dynamic> _$ServicesToJson(Services instance) => <String, dynamic>{
      'port': instance.port,
      'service_name': instance.serviceName,
      'transport_protocol': instance.transportProtocol,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      continent: json['continent'] as String?,
      country: json['country'] as String?,
      countryCode: json['country_code'] as String?,
      city: json['city'] as String?,
      postalCode: json['postal_code'] as String?,
      timezone: json['timezone'] as String?,
      province: json['province'] as String?,
      coordinates: json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      registeredCountry: json['registered_country'] as String?,
      registeredCountryCode: json['registered_country_code'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'continent': instance.continent,
      'country': instance.country,
      'country_code': instance.countryCode,
      'city': instance.city,
      'postal_code': instance.postalCode,
      'timezone': instance.timezone,
      'province': instance.province,
      'coordinates': instance.coordinates,
      'registered_country': instance.registeredCountry,
      'registered_country_code': instance.registeredCountryCode,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

AutonomousSystem _$AutonomousSystemFromJson(Map<String, dynamic> json) =>
    AutonomousSystem(
      asn: json['asn'] as int?,
      description: json['description'] as String?,
      bgpPrefix: json['bgp_prefix'] as String?,
      name: json['name'] as String?,
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$AutonomousSystemToJson(AutonomousSystem instance) =>
    <String, dynamic>{
      'asn': instance.asn,
      'description': instance.description,
      'bgp_prefix': instance.bgpPrefix,
      'name': instance.name,
      'country_code': instance.countryCode,
    };

OperatingSystem _$OperatingSystemFromJson(Map<String, dynamic> json) =>
    OperatingSystem(
      uniformResourceIdentifier: json['uniform_resource_identifier'] as String?,
      part: json['part'] as String?,
      product: json['product'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$OperatingSystemToJson(OperatingSystem instance) =>
    <String, dynamic>{
      'uniform_resource_identifier': instance.uniformResourceIdentifier,
      'part': instance.part,
      'product': instance.product,
      'source': instance.source,
    };
