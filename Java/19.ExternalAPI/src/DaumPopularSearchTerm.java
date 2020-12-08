import java.net.URL;
import java.util.List;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.HTMLElementName;
import net.htmlparser.jericho.Source;


public class DaumPopularSearchTerm {
	public static void main(String[] args) {
		String juso = "https://www.daum.net/";
		try {
			URL url = new URL(juso);
			Source source = new Source(url);
			//System.out.println(source);
			List<Element> list = source.getAllElements(HTMLElementName.LI);
			
			String html = null;		//인기 검색어(favorsch)
			
			for (int i = 0; i < list.size(); i++) {
				String data = list.get(i).getContent().toString();
				//System.out.println(data);
				if (data.contains("link_favorsch")) {
					html = data;
					//System.out.println(html);
					int spos = html.indexOf(">");
					int epos = html.indexOf("</a>");
					String favorsch = html.substring(spos + 1, epos);
					System.out.println((i + 1) + "위 : " + favorsch);
				}
			}//for
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//main()
}//class
