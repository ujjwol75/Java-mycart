package com.helper;

import java.io.FileOutputStream;
import java.io.InputStream;

public class picupload {
public boolean uploadfile(InputStream is,String path) {
	boolean test=false;
	try {
		byte[]  byt=new byte[is.available()];
		is.read(byt);
		FileOutputStream fops=new FileOutputStream(path);
		fops.write(byt);
		fops.flush();
		fops.close();
		test=true;
	} catch (Exception e) {
	e.printStackTrace();
	}
	return true;
}
}
