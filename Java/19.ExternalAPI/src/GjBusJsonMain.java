import java.io.BufferedReader;
import java.io.FileReader;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

public class GjBusJsonMain {
	public static void main(String[] args) {
		String jsonData = getJsonData();
		//System.out.println(jsonData);
		
		JSONArray array = JSONArray.fromObject(jsonData);
		for (Object object : array) {
			JSONObject obj = (JSONObject)JSONSerializer.toJSON(object);
			System.out.println("노선번호 : " + obj.get("LINE_NAME"));
			System.out.println("출발지 : " + obj.get("DIR_UP_NAME"));
			System.out.println("도착지 : " + obj.get("DIR_DOWN_NAME") + "\n");
		}//for-each
		
	}//main()
	
	//gjbus.json 파일의 내용을 읽어서 String Type으로 만드는 메소드
	public static String getJsonData() {
		String jsonData = "";
		try {
			FileReader fr = new FileReader("gjbus.json");
			BufferedReader br = new BufferedReader(fr);
			String json = null;
			
			while ((json = br.readLine()) != null) {
				jsonData += json;
			}//while
			br.close();
			fr.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jsonData;
	}//getJsonData()
	
}//class
