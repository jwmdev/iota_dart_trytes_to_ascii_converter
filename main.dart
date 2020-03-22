void main() {
  print('TRYTES to ASCII conversion: ');
	print(trytesToAscii('SBYBCCKBEANBXCGDHDFDXCQCIDHDTCSCEAVBTCSCVCTCFD'));
  print('ASCII to TRYTES conversion: ');
  print(asciiToTrytes('IOTA Distributed Ledger'));
}
const TRYTE_ALPHABET = '9ABCDEFGHIJKLMNOPQRSTUVWXYZ';

trytesToAscii(String trytes) {
  var ascii = "";
  RegExp exp = new RegExp(r"^[9A-Z]{1,}$");
  if (exp.hasMatch(trytes) == false) {
      print('Not a Tryte'); 
  } else {
      print('The number is tryte.');
  }
  int length = trytes.length;
  int len = trytes.length;
  print('Trytes conversion...');
  for (var i = 0; i < trytes.length; i += 2) {
      ascii += String.fromCharCode(TRYTE_ALPHABET.indexOf(trytes[i]) + TRYTE_ALPHABET.indexOf(trytes[i + 1]) * 27);
  }

  return ascii;
}

asciiToTrytes(String ascii) {
   var trytes = '';
  
    for (var i = 0; i < ascii.length; i++) {
        int unit = ascii[i].codeUnitAt(0);
        if (unit > 255) {
                return null;
        }
        int firstValue = unit % 27;
        int secondValue = ((unit - firstValue) / 27).toInt();
        trytes += TRYTE_ALPHABET[firstValue];
        trytes += TRYTE_ALPHABET[secondValue];
    }
    return trytes;
}
