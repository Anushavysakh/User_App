import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

InputDecoration buildInputDecoration(String hintText) {
  return InputDecoration(
      fillColor: Colors.grey.shade100,
      filled: true,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ));

}
TextField buildTextFieldUserName( _userName) {
  return TextField(
    style: TextStyle(color: Colors.black),
    keyboardType: TextInputType.name,
    controller: _userName,
    decoration: buildInputDecoration('User Name'),
  );
}
TextField buildTextFieldEmail( _email) {
  return TextField(
      style: TextStyle(color: Colors.black),
    keyboardType: TextInputType.emailAddress,
    controller: _email,

    decoration: buildInputDecoration('Email'),
  );
}
TextField buildTextFieldPassword(_password) {
  return TextField(
    controller: _password,
    keyboardType: TextInputType.visiblePassword,
    obscureText: true,
    decoration: buildInputDecoration('Password'),
  );
}
TextField buildTextFieldConfirmPassword(_confirmpassword){
  return TextField(
    controller: _confirmpassword,
    keyboardType: TextInputType.visiblePassword,
    obscureText: true,
    decoration: buildInputDecoration('Re-enter password'),
  );

}
