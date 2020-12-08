import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.hanul.study.JsonDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JSONTestMain02 {
	public static void main(String[] args) {
		JsonDTO dto1 = new JsonDTO(10, "ȫ�浿", 33, "���ֽ� ���� �󼺵�", "010-1111-1111");
		JsonDTO dto2 = new JsonDTO(20, "�ڹ���", 30, "���ֽ� ���� ������", "010-2222-2222");
		JsonDTO dto3 = new JsonDTO(30, "�̼���", 50, "���ֽ� �ϱ� �����", "010-3333-3333");
		
		ArrayList<JsonDTO> list = new ArrayList<>();
		list.add(dto1);
		list.add(dto2);
		list.add(dto3);
		
		//ArrayList<JsonDTO> �� JSON ������ ��ȯ (JSON Object �� JSON Array)
		JSONArray array = JSONArray.fromObject(list);
		String json = array.toString();
		System.out.println(json);
		
		//����� ȭ�鿡 ���
		for (int i = 0; i < array.size(); i++) {
			JSONObject object = array.getJSONObject(i);
			JsonDTO dto = (JsonDTO)JSONObject.toBean(object, JsonDTO.class);
			System.out.print(dto.getNum() + "\t");
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
		}
		
		//����� ���Ϸ� ����
		try {
			FileWriter fw = new FileWriter("memberList.json");		//���� ������Ʈ�� ����
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(json);
			bw.flush();
			bw.close();
			fw.close();
			System.out.println("memberList.json ������ �����Ǿ����ϴ�.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//main()
}//class
