package com.dev.nao.util;
/*
 * Description :
 * 
 *   This file contains a class which converts a UTF-8 string into a cipher string, and vice versa.
 *   The class uses 128-bit AES Algorithm in Cipher Block Chaining (CBC) mode with a UTF-8 key
 *   string and a UTF-8 initial vector string which are hashed by MD5. PKCS5Padding is used
 *   as a padding mode and binary output is encoded by Base64. 
 * 
 * Since :
 * 
 *   2007.10.20
 * 
 * Author :
 * 
 *   JO Hyeong-ryeol (http://www.hyeongryeol.com/6)
 * 
 * Copyright :
 * 
 *   Permission to copy, use, modify, sell and distribute this software is granted provided this
 *   copyright notice appears in all copies. This software is provided "as is" without express
 *   or implied warranty, and with no claim as to its suitability for any purpose.
 *   
 *   Copyright (C) 2007 by JO Hyeong-ryeol.
 * 
 * $Id: StringEncrypter.java 65 2007-12-14 15:29:49Z JO Hyeong-ryeol $
 * 
 */


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**
 * This class converts a UTF-8 string into a cipher string, and vice versa.
 * It uses 128-bit AES Algorithm in Cipher Block Chaining (CBC) mode with a UTF-8 key
 * string and a UTF-8 initial vector string which are hashed by MD5. PKCS5Padding is used
 * as a padding mode and binary output is encoded by Base64.
 * 
 * @author JO Hyeong-ryeol
 */
public class StringEncrypter {
	private Cipher rijndael;
	private SecretKeySpec key;
	private IvParameterSpec initalVector;

	// pass phrase
	private static final String _key = "clipker!@#$";    
	private static final String _iv = "wizmeta!@#$";
	
	 
	
	/**
	 * Creates a StringEncrypter instance.
	 * 
	 * @param key A key string which is converted into UTF-8 and hashed by MD5.
	 *            Null or an empty string is not allowed.
	 * @param initialVector An initial vector string which is converted into UTF-8
	 *                      and hashed by MD5. Null or an empty string is not allowed.
	 * @throws Exception
	 */
	public StringEncrypter(String key, String initialVector) throws Exception {
		if (key == null || key.equals(""))
			throw new Exception("The key can not be null or an empty string.");

		if (initialVector == null || initialVector.equals(""))
			throw new Exception("The initial vector can not be null or an empty string.");

		// Create a AES algorithm.
		this.rijndael = Cipher.getInstance("AES/CBC/PKCS5Padding");

		// Initialize an encryption key and an initial vector.
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		this.key = new SecretKeySpec(md5.digest(key.getBytes("UTF-8")), "AES");
		this.initalVector = new IvParameterSpec(md5.digest(initialVector.getBytes("UTF-8")));
	}

	/**
	 * Encrypts a string.
	 * 
	 * @param value A string to encrypt. It is converted into UTF-8 before being encrypted.
	 *              Null is regarded as an empty string.
	 * @return An encrypted string.
	 * @throws Exception
	 */
	public String encrypt(String value) throws Exception {
		if (value == null)
			value = "";

		// Initialize the cryptography algorithm.
		this.rijndael.init(Cipher.ENCRYPT_MODE, this.key, this.initalVector);

		// Get a UTF-8 byte array from a unicode string.
		byte[] utf8Value = value.getBytes("UTF-8");

		// Encrypt the UTF-8 byte array.
		byte[] encryptedValue = this.rijndael.doFinal(utf8Value);

		// Return a base64 encoded string of the encrypted byte array.
		return Base64Util.encode(encryptedValue);
	}

	/**
	 * Decrypts a string which is encrypted with the same key and initial vector. 
	 * 
	 * @param value A string to decrypt. It must be a string encrypted with the same key and initial vector.
	 *              Null or an empty string is not allowed.
	 * @return A decrypted string
	 * @throws Exception
	 */
	public String decrypt(String value) throws Exception {
		if (value == null || value.equals(""))
			throw new Exception("The cipher string can not be null or an empty string.");

		// Initialize the cryptography algorithm.
		this.rijndael.init(Cipher.DECRYPT_MODE, this.key, this.initalVector);

		// Get an encrypted byte array from a base64 encoded string.
		byte[] encryptedValue = Base64Util.decode(value);

		// Decrypt the byte array.
		byte[] decryptedValue = this.rijndael.doFinal(encryptedValue);

		// Return a string converted from the UTF-8 byte array.
		return new String(decryptedValue, "UTF-8");
	}

	public static String encryptSHA256(String str) {
	    String SHA = null;
	    try {
	        MessageDigest sh = MessageDigest.getInstance("SHA-256"); // 이 부분을 SHA-1으로 바꿔도 된다!
	        sh.update(str.getBytes()); 
	        byte byteData[] = sh.digest();
	        StringBuffer sb = new StringBuffer(); 
	        for(int i = 0 ; i < byteData.length ; i++){
	            sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
	        }
	        SHA = sb.toString();
	    } catch(NoSuchAlgorithmException e){
	        e.printStackTrace(); 
	    }
	    return SHA;
	}

	/**
	 * 암호화
	 * @param str
	 * @return
	 */
	public static String getEncrypt(String str){
		try {
			StringEncrypter encrypter = new StringEncrypter(_key, _iv);
			return encrypter.encrypt(str); // URLEncoder.encode(encrypter.encrypt(str), "UTF-8");
		} catch (Exception e) {
			return "";
		}
	}
	
	/**
	 * 복호화
	 * @param str
	 * @return
	 */
	public static String getDecrypt(String str){
		try {
			StringEncrypter encrypter = new StringEncrypter(_key, _iv);
			return encrypter.decrypt(str);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
}
