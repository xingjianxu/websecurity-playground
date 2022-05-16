package playground.users;

import org.mindrot.jbcrypt.BCrypt;

public class TestEnc {

	public static void main(String[] args) {
		String password = "12_3a4B56789";

		String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
		
		System.out.println(BCrypt.checkpw(password, hashed));
		
	}

}
