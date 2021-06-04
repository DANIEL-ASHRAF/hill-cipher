import 'dart:math';

import 'package:stacked/stacked.dart';

class HillCipherViewModel extends BaseViewModel{

  late String _hillCipherText;
  late String _key;
  bool flag =false;
  String cipherText="";
  int cols = 1;
  int rows = 1;
  int index=0;
  void changeFlag(){
    flag=!flag;
    notifyListeners();
  }
  void setIndex(int x){
    index=x;
    notifyListeners();
  }
 void setText(String? text){
    _hillCipherText=text!;
  }

  void setKey(String? text){
    _key=text!;
  }

  // Following function generates the
// key matrix for the key string
  void getKeyMatrix(String key, keyMatrix) {
//    List<int> a = new List<int>.generate(26, (int index) => index+65);
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



//
//  void inverse() {
//    int i, j, k;
//    float p, q;
//    for(i = 0; i < 3; i++)
//      for(j = 0; j < 3; j++) {
//        if(i == j)
//          b[i][j]=1;
//        else
//          b[i][j]=0;
//      }
//    for(k = 0; k < 3; k++) {
//      for(i = 0; i < 3; i++) {
//        p = c[i][k];
//        q = c[k][k];
//        for(j = 0; j < 3; j++) {
//          if(i != k) {
//            c[i][j] = c[i][j]*q - p*c[k][j];
//            b[i][j] = b[i][j]*q - p*b[k][j];
//          }
//        }
//      }
//    }
//    for(i = 0; i < 3; i++)
//      for(j = 0; j < 3; j++)
//        b[i][j] = b[i][j] / c[i][i];
//    printf("\n\nInverse Matrix is:\n");
//    for(i = 0; i < 3; i++) {
//      for(j = 0; j < 3; j++)
//        printf("%d ", b[i][j]);
//      printf("\n");
//    }
//  }
//
//  void decryption() {
//    int i, j, k;
//    inverse();
//    for(i = 0; i < 3; i++)
//      for(j = 0; j < 1; j++)
//        for(k = 0; k < 3; k++)
//          decrypt[i][j] = decrypt[i][j] + b[i][k] * encrypt[k][j];
//    printf("\nDecrypted string is: ");
//    for(i = 0; i < 3; i++)
//      printf("%c", (char)(fmod(decrypt[i][0], 26) + 97));
//    printf("\n");
//  }

  // Function to implement Hill Cipher


  void hillCipher()
  {
    // Get key matrix from the key string
    var keyMatrixTemp = List.generate(3,
            (i) => List.generate(3 + 1, (j) => i + j * cols + 1, growable: true));
    getKeyMatrix(_key, keyMatrixTemp);
    var messageMatrixTemp = List.generate(3,
            (i) => List.generate(1 + 1, (j) => i + j * cols + 1, growable: true));

    // Generate vector for the message
    for (int i = 0; i < 3; i++)
    messageMatrixTemp[i][0] = _hillCipherText.codeUnitAt(i) % 65;

    var cipherMatrixTemp = List.generate(3,
            (i) => List.generate(1 + 1, (j) => i + j * cols + 1, growable: true));

    // Following function generates
    // the encrypted vector
    encrypt(cipherMatrixTemp, keyMatrixTemp, messageMatrixTemp);

    List<int> charCodes=[];
    // Generate the encrypted text from
    // the encrypted vector
    for (int i = 0; i < 3; i++) {
//      fromCharCodes
      charCodes.add(cipherMatrixTemp[i][0] + 65);
//      cipherText += (cipherMatrixTemp[i][0] + 65);
    }
    // Finally print the ciphertext
    print(" Ciphertext:" +  String.fromCharCodes(charCodes));
    cipherText=String.fromCharCodes(charCodes);
    notifyListeners();
  }


}

//just for explain :
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
//// "hello"