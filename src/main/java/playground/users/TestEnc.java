package playground.users;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class TestEnc {

	public static void main(String[] args) {
		String s = "12_3a4B56789";

		try {
			MessageDigest md5 = MessageDigest.getInstance("md5");
			byte[] digest = md5.digest(s.getBytes("utf-8"));
			String e = new BigInteger(1, digest).toString(16);
			System.out.println(e);
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

	}

}
