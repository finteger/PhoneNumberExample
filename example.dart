class PhoneNumber {
  String? clean(String number) {
    //regular expression to eliminate disallowed punctuation
    String num = number.replaceAll(RegExp(r'([()\s-.+])'), '');

    //Does the phone number have letters?
    if (num.contains(RegExp(r'[a-z]'))) {
      throw FormatException('Letters are not allowed');
    } else if (num.contains(RegExp(r'[^\w]+'))) {
      throw FormatException('Punctuation is not permitted.');
    }

    //Checking for length
    if (num.length < 11 || num.length > 11) {
      throw FormatException(
          'Phone number must be less than or greater than 10');
    }

    //Replacing the first character with nothing if 11 digits
    if (num.length == 11) {
      if (num[0] == '1') {
        num = num.replaceFirst('1', '');
      } else {
        throw FormatException('11 digits must start with a 1');
      }
    }
  
   
  //If first char starts with '0', throw error 
  if(num[0] == '0'){
    throw FormatException('Area code cannot start with zero');
  }

  return num;
}
}

void main(){
  PhoneNumber phone = new PhoneNumber();

  try{
    String? cleanedNumber = phone.clean("1(403)-505-5555");
    print('Cleaned number: $cleanedNumber');
  }catch(e){
    print("Error: $e");
  }

}
