import java.net.URL;
import java.util.Arrays;
import java.util.List;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.HTMLElementName;
import net.htmlparser.jericho.Source;

public class HtmlParser {
	public static void main(String[] args) {
		try {
			String juso = "https://sum.su.or.kr:8888/bible/today";
			URL url = new URL(juso);
			Source source = new Source(url);	//html 전체 코드
			//System.out.println(source);
			List<Element> list = source.getAllElements(HTMLElementName.DIV);
			
			String html1 = null;	//제목(subject)
			String html2 = null;	//날짜(date)
			String html3 = null;	//부제목(sub)
			String html4 = null;	//내용(content)
			
			for(int i = 0; i < list.size(); i++) {
				String data = list.get(i).getContent().toString();
				//System.out.println(data);		
				
				if (data.contains("id=\"bible_text\">")) {
					html1 = data;
				}//if
				
				if (data.contains("id=\"dailybible_info\">")) {
					html2 = data;
				}//if
				
				if (data.contains("id=\"bibleinfo_box\">")) {
					html3 = data;
				}//if
				
				if (data.contains("id=\"body_list\">")) {
					html4 = data;
				}//if
			}//for
			
			//System.out.println(html1);
			//System.out.println(html2);
			//System.out.println(html3);
			//System.out.println(html4);
			
			int spos = html1.indexOf("id=\"bible_text\">");
			String subject = html1.substring(spos + 16);
			//System.out.println(subject);
			int epos = subject.indexOf("</div>");
			subject = subject.substring(0, epos);
			System.out.println("제목 : " + subject);
			
			spos = html2.indexOf("id=\"dailybible_info\">");
			String date = html2.substring(spos + 21);
			//System.out.println(date);
			epos = date.indexOf("</div>");
			date = date.substring(0, epos);
			System.out.println("날짜 : " + date.trim().substring(4).trim());
			
			spos = html3.indexOf("id=\"bibleinfo_box\">");
			String sub = html3.substring(spos + 19);
			//System.out.println(sub);
			epos = sub.indexOf("</div>");
			sub = sub.substring(0, epos);
			System.out.println(sub.trim());
			
			spos = html4.indexOf("id=\"body_list\">");
			String content = html4.substring(spos + 15);
			//System.out.println(content);
			epos = content.indexOf("</ul>");
			content = content.substring(0, epos);
			//System.out.println(content);
			String[] sp = content.split("</li>");
			//System.out.println(Arrays.toString(sp));
			
			for (int i = 0; i < sp.length - 1; i++) {
				// 숫자 뽑기
				int numSpos = sp[i].indexOf("class=\"num\">");
				String num = sp[i].substring(numSpos + 12);
				//System.out.println(num);
				int numEpos = num.indexOf("</div>");
				num = num.substring(0, numEpos);
				
				//내용 뽑기
				int infoSpos = sp[i].indexOf("class=\"info\">");
				String info = sp[i].substring(infoSpos + 13);
				//System.out.println(info);
				int infoEpos = info.indexOf("</div");
				info = info.substring(0, infoEpos);
				System.out.println(num + " : " + info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//main()
}//class
