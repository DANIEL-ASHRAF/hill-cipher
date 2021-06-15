import 'dart:math';

import 'package:stacked/stacked.dart';

class HillCipherViewModel extends BaseViewModel{

  late String _hillCipherText;
  late String _key;
  bool _flag =false;
  int _index=0;
  String _cipherText="";
  int _cols = 1;

  int get index => _index;
  bool get flag => _flag;
  String get cipherText =>_cipherText;

  void changeFlag(){
    _flag=!flag;
    notifyListeners();
  }

  void setIndex(int x){
    _index=x;
    notifyListeners();
  }

  void setText(String? text){
    _hillCipherText=text!;
  }

  void setKey(String? text){
    _key=text!;
  }

// key matrix for the key string
  void getKeyMatrix(String key, keyMatrix) {
    int keyLength=_key.length;
    int temp=sqrt(keyLength).toInt();
    int k = 0;
    for (int i = 0; i < temp; i++) {
      for (int j = 0; j < temp; j++) {
        keyMatrix[i][j] = key.codeUnitAt(k) % 65;
        k++;
      }
    }
  }

   //Following function encrypts the message
  void encrypt(cipherMatrix,keyMatrix,messageVector) {
    int x, i, j;
    for (i = 0; i < 3; i++) {
      for (j = 0; j < 1; j++) {
        cipherMatrix[i][j] = 0;
        for (x = 0; x < 3; x++) {
          cipherMatrix[i][j] +=keyMatrix[i][x] * messageVector[x][j];
        }
        cipherMatrix[i][j] = cipherMatrix[i][j] % 26;
      }
    }
  }

  void hillCipher()
  {
    // Get key matrix from the key string
    var keyMatrixTemp = List.generate(3,
            (i) => List.generate(3 + 1, (j) => i + j * _cols + 1, growable: true));
    getKeyMatrix(_key, keyMatrixTemp);
    var messageMatrixTemp = List.generate(3,
            (i) => List.generate(1 + 1, (j) => i + j * _cols + 1, growable: true));

    // Generate vector for the message
    for (int i = 0; i < 3; i++)
    messageMatrixTemp[i][0] = _hillCipherText.codeUnitAt(i) % 65;

    var cipherMatrixTemp = List.generate(3,
            (i) => List.generate(1 + 1, (j) => i + j * _cols + 1, growable: true));

    // the encrypted vector
    encrypt(cipherMatrixTemp, keyMatrixTemp, messageMatrixTemp);

    List<int> charCodes=[];
    for (int i = 0; i < 3; i++) {
      charCodes.add(cipherMatrixTemp[i][0] + 65);
    }
    // Finally print the ciphertext
    print(" Ciphertext:" +  String.fromCharCodes(charCodes));
    _cipherText=String.fromCharCodes(charCodes);
    notifyListeners();
  }


}

//Explain:
//string = 'Dart';
//string.codeUnitAt(0); // 68
//string.codeUnits;     // [68, 97, 114, 116]

//void RandomString() {
//  List<int> a = new List<int>.generate(26, (int index) => index + 65);// +65 >> in assci code
//  String f = String.fromCharCodes(a);
//  print(f); //ABCDEFGHIJKLMNOPQRSTUVWXYZ
//}

//List<int> charCodes = [104, 101, 108, 108, 111];
//print(new String.fromCharCodes(charCodes));
// "hello"