//페이지 전환(프리젠테이션 로직 수행)을 수행하는 클래스
package com.hanul.action;

public class ActionForward {
	private String path;			//View Page(*.jsp)의 경로와 파일명
	private boolean isRedirect;		//페이지 전환 방식  ▶   true : redirect() 방식 / false : forward() 방식
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
	
}//class
