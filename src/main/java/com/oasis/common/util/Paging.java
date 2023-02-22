package com.oasis.common.util;

public class Paging {

	private int totalPage;
	private int pageBlock;
	private int startPage;
	private int endPage;
	private int currentPage;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	private StringBuffer pageHtml = new StringBuffer();

	public Paging(int countItemAll, int pageBlock, int pageSize, int currentPage, String url, String searchUrl) {
		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 아이템의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소
		totalPage = countItemAll / pageSize + (countItemAll % pageSize == 0 ? 0 : 1);
		this.pageBlock = pageBlock;

		startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;
		endPage = startPage + pageBlock - 1;
		if (endPage > totalPage) { // endPage가 페이지수보다 크다면 endPage를 페이지블록만큼 제한
			endPage = totalPage;
		}

		this.currentPage = currentPage;

		// pageHtml을 작성
		makePageHtml(url, searchUrl);
	}

	private void makePageHtml(String url, String searchUrl) {
		pageHtml.append("<div class=\"paging1\">");
		pageHtml.append("<ul>");
		if (startPage > pageBlock) {
			pageHtml.append(
					"<li><a href=\"" + url + "?page=" + (startPage - pageBlock) + searchUrl + "\">&lt;</a></li>");
		}

		for (int i = startPage; i <= endPage; i++) {

			if (i != currentPage) {
				pageHtml.append("<li><a href=\"" + url + "?page=" + i + searchUrl + "\">" + i + "</a></li>");
			} else {
				pageHtml.append("<li class=\"active\"><span>" + i + "</span>");
			}
		}

		if (endPage < totalPage) {
			pageHtml.append(
					"<li><a href=\"" + url + "?page=" + (startPage + pageBlock) + searchUrl + "\">&gt;</a></li>");
		}

		pageHtml.append("</ul></div>");
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public StringBuffer getPageHtml() {
		return pageHtml;
	}
}