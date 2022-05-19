package playground;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

public class InitRainbowDb {

	public static void main(String[] args) throws IOException {
		FileInputStream fin = new FileInputStream(new File("passdb.txt"));
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(fin));
		
		String line = reader.readLine();
		while(line != null) {
			String raw = line.trim();
			
			// 1. 将密码明文转变为密文
			
			// 2. 将密码的明文和密文插入到数据库中
			
			line = reader.readLine();
		}
		

	}

}
