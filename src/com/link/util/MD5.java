package com.link.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {

	public static String getStrMD5(String str) {
		return getBytesMD5(str.getBytes());
	}

	public static String getBytesMD5(byte[] bytes) {

		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] digest = md5.digest(bytes);

			return bytesToHexStr(digest);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return null;
	}

	private static String bytesToHexStr(byte[] bytes) {

		StringBuilder sb = new StringBuilder(bytes.length * 2);

		for (byte b : bytes) {
			sb.append(Integer.toHexString((b >> 4) & 0xf)); // 高四位
			sb.append(Integer.toHexString(b & 0xf)); // 低四位
		}
		return sb.toString();
	}

	public static void main(String[] args) {
		// 123456 e10adc3949ba59abbe56e057f20f883e
		System.out.println(getStrMD5("a@123456"));
	}
}
