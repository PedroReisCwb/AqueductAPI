import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

import 'package:todo/models/user.dart';

class Utils {
  static const String jwtKey = 
  		"37f9ae83ea99a6e9ee9ee27a4364022c8caa1dddd5b1798b8b0eba9aab1f1dce";

  static String generateSHA256Hash(String password) {
    final bytes = utf8.encode(password);
    final passwordHash = sha256.convert(bytes).toString();

    return passwordHash;
  }

  static String generateJWT(User user) {
    final claimSet = JwtClaim(
        issuer: "http://localhost:8888",
        subject: user.id.toString(),
        otherClaims: <String, dynamic>{},
        maxAge: Duration(days: 1));

    final token = "Bearer ${issueJwtHS256(claimSet, jwtKey)}";
    return token;
  }
  
}