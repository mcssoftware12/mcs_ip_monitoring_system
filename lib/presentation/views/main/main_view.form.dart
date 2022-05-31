// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String DomainValueKey = 'domain';

final Map<String, TextEditingController> _MainViewTextEditingControllers = {
  DomainValueKey: TextEditingController(),
};

final Map<String, FocusNode> _MainViewFocusNodes = {
  DomainValueKey: FocusNode(),
};

final Map<String, String? Function(String?)?> _MainViewTextValidations = {
  DomainValueKey: null,
};

mixin $MainView on StatelessWidget {
  TextEditingController get domainController =>
      _MainViewTextEditingControllers[DomainValueKey]!;
  FocusNode get domainFocusNode => _MainViewFocusNodes[DomainValueKey]!;

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    domainController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) {
    model.setData(
      model.formValueMap
        ..addAll({
          DomainValueKey: domainController.text,
        }),
    );
    _updateValidationData(model);
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        DomainValueKey: _getValidationMessage(DomainValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _MainViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_MainViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    domainController.dispose();
    domainFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get domainValue => this.formValueMap[DomainValueKey] as String?;

  bool get hasDomain => this.formValueMap.containsKey(DomainValueKey);

  bool get hasDomainValidationMessage =>
      this.fieldsValidationMessages[DomainValueKey]?.isNotEmpty ?? false;

  String? get domainValidationMessage =>
      this.fieldsValidationMessages[DomainValueKey];
}

extension Methods on FormViewModel {
  setDomainValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DomainValueKey] = validationMessage;
}
