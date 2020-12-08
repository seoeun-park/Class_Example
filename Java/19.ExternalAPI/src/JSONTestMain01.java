import java.io.BufferedWriter;
import java.io.FileWriter;

import com.hanul.study.JsonDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JSONTestMain01 {
	public static void main(String[] args) {
		JsonDTO dto1 = new JsonDTO(10, "ȫ�浿", 33, "���ֽ� ���� �󼺵�", "010-1111-1111");
		JsonDTO dto2 = new JsonDTO(20, "�ڹ���", 30, "���ֽ� ���� ������", "010-2222-2222");
		JsonDTO dto3 = new JsonDTO(30, "�̼���", 50, "���ֽ� �ϱ� �����", "010-3333-3333");
		
		JSONArray array = new JSONArray();		//JSON Array ��ü ����
		JSONObject object = new JSONObject();	//JSON Object ��ü ����
		
		object.put("member", dto1);		//DTO ��ü�� JSON Object ��ü�� ��ȯ
		array.add(object);				//JSON Object�� JSON Array�� ���(����)
		
		object.put("member", dto2);
		array.add(object);
		
		object.put("member", dto3);
		array.add(object);
		
		String json = array.toString();		//JSON ������ ������ ���
		System.out.println(json);
		
		//����� ȭ�鿡 ��� (JSONObject�� JsonDTO�� ��ȯ)
		for (int i = 0; i < array.size(); i++) {
			JSONObject obj = array.getJSONObject(i);
			obj = obj.getJSONObject("member");
			JsonDTO dto = (JsonDTO)JSONObject.toBean(obj, JsonDTO.class);
			System.out.print(dto.getNum() + "\t");
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
		}
		
		//����� ���Ϸ� ����
		try {
			FileWriter fw = new FileWriter("member.json");		//���� ������Ʈ�� ����
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(json);
			bw.flush();
			bw.close();
			fw.close();
			System.out.println("member.json ������ �����Ǿ����ϴ�.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//main()
}//class
