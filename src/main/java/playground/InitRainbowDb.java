package playground;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class InitRainbowDb {

	public static void main(String[] args) throws IOException, Exception {
		long start = System.currentTimeMillis();

		FileInputStream fin = new FileInputStream(new File("passdb.txt"));

		BufferedReader reader = new BufferedReader(new InputStreamReader(fin));

		String line = reader.readLine();

		Connection conn = DBUtils.getConnection();
		conn.setAutoCommit(false);
		PreparedStatement st = conn.prepareStatement("INSERT INTO rainbow (raw,hashed) VALUES (?,?)");

		while (line != null) {
			String raw = line.trim();

			// 1. 将密码明文转变为密文
			String hashed = encMD5(raw);

			// 2. 将密码的明文和密文插入到数据库中
			st.setString(1, raw);
			st.setString(2, hashed);
			// 高效批量插入数据
			st.addBatch();

			line = reader.readLine();
		}
		st.executeBatch();
		conn.commit();

		System.out.println("全部执行完成，耗时：");
		System.out.println((System.currentTimeMillis() - start) / 1000.0);

	}

	public static String encMD5(String str) {
		byte[] digest = null;
		try {
			MessageDigest md5 = MessageDigest.getInstance("md5");
			digest = md5.digest(str.getBytes("utf-8"));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 16是表示转换为16进制数
		String md5Str = new BigInteger(1, digest).toString(16);
		return md5Str;
	}

}
