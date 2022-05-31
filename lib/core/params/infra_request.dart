import 'package:freezed_annotation/freezed_annotation.dart';
part 'infra_request.g.dart';

@JsonSerializable()
class InfraRequestParams{
 final String domain;

 InfraRequestParams(this.domain);

}