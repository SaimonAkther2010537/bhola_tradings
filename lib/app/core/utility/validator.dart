class Validator{
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Please enter an email";
    } else if (!RegExp('^[a-zA-Z0-9_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)) {
      return "Please enter valid email";
    }
    return null;
  }

  String? validateEmpty(String? value) {
    if (value!.isEmpty) {
      return "field can't be empty";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Please enter password";
    } else if (value.length < 6) {
      return "password are too short";
    }
    return null;
  }

  String? validateAddress(String? value) {
    if (value!.isEmpty) {
      return "Please enter your address";
    } else if (value.length < 6) {
      return "Your address is too short";
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (value!.isEmpty) {
      return "Please enter your product description";
    } else if (value.length < 6) {
      return "Your description is too short";
    }
    return null;
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return "Please enter name";
    } else if (value.length < 4){
      return "Name to short";
    }
    return null;
  }

  String? validatePrice(String? value) {
    if (value!.isEmpty) {
      return "Please enter price";
    }
    if(num.parse(value) <= 0)
      {
        return "Please enter a valid price";
      }
    return null;
  }

  String? validateBangladeshNumber(String? value) {
    if (value!.isEmpty) {
      return "Please enter a mobile number";
    } else if (!RegExp(r'^01[3-9]\d{8}$').hasMatch(value)) {
      return "Please enter a valid number";
    }
    return null;
  }

  String? noValidationRequired(String? value) {
    return null;
  }
}