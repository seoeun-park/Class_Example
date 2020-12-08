package com.hanul.study;

import java.net.URL;

import net.htmlparser.jericho.Source;

public class GjbusDAO {
	public Source makeJson() {
		Source source = null;
		try {
			String juso = "http://api.gwangju.go.kr/json/lineInfo";
			URL url = new URL(juso);
			source = new Source(url);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("makeJson() Exception!");
		}
		return source;
	} //makeJson()
	
}//class
