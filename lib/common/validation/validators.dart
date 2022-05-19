import 'package:form_field_validator/form_field_validator.dart';

var emailValidator = EmailValidator(errorText: "Enter valid email id");

var requiredValidator = RequiredValidator(errorText: "* Required");

var maxLengthValidator = MaxLengthValidator(16,
    errorText: "Password cannot be longer than 16 characters");

var minLengthValidator = MinLengthValidator(6,
    errorText: "Password should be at least 6 characters");
