package com.froala.editor;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.Part;

import org.apache.commons.codec.binary.Hex;

/**
 * Basic utils.
 * 
 * @author florin@froala.com
 *
 */
public final class Utils {

	/**
	 * Private constructor.
	 */
	private Utils() {

	}

	public static String generateUniqueString() throws NoSuchAlgorithmException {

		String miliseconds = Calendar.getInstance().get(Calendar.MILLISECOND) + "";
		MessageDigest d = null;
		d = MessageDigest.getInstance("SHA-1");
		d.reset();
		d.update(miliseconds.getBytes());
		return bytesToHex(d.digest());
	}

	public static String bytesToHex(byte[] in) {
		StringBuilder builder = new StringBuilder();
		for (byte b : in) {
			builder.append(String.format("%02x", b));
		}
		return builder.toString();
	}

	public static String getFileName(Part part) {
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	public static byte[] hmac(byte[] key, String data) throws Exception {
		Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
		SecretKeySpec secret_key = new SecretKeySpec(key, "HmacSHA256");
		sha256_HMAC.init(secret_key);

		return sha256_HMAC.doFinal(data.getBytes("UTF-8"));
	}

	public static String hmac_hex(byte[] key, String data) throws Exception {
		return new String(Hex.encodeHex(hmac(key, data)));
	}
}
