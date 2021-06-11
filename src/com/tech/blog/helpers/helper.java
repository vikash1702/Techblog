package com.tech.blog.helpers;

import java.io.File;
import java.io.FileOutputStream;

public class helper {

	public static boolean deleteFile(String path) {
		boolean f = false;
		try {
			File file = new File(path);
			f = file.delete();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public static boolean saveFile(java.io.InputStream inputStrea , String path) {
		boolean f = false;
		try {
			byte b[] = new byte[inputStrea.available()];
			inputStrea.read(b);
			
			FileOutputStream fos = new FileOutputStream(path);
			
			fos.write(b);
			
			fos.flush();
			
			fos.close();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
