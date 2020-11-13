package kr.co.jj.common.vo;

import java.util.ArrayList;
import java.util.List;

public class PageVO {
	
	//검색 조건(제목 또는 내용)
	//private String searchItem;
	//검색 키워드
	//private String searchValue; 
	
	private static final int DEFAULT_PAGENO = 1;
	private static final int DEFAULT_PAGESIZE = 5;
	private static final int DEFAULT_PAGEBLOCK = 1;
	private static final int DEFAULT_PAGEBLOCKSIZE = 5;
	
	// 현재 페이지 번호
	private int pageNo = DEFAULT_PAGENO;
	// 한 페이지에 보여줄 게시글 개수
	private int pageSize = DEFAULT_PAGESIZE;
	// DB에서 처음으로 가져올 row 행 인덱스
	private int offset;
	// 총 게시글 개수
	private int rowCount;
	// 총 페이지 개수
	private int pageCount;
	// 페이지 블록
	private int pageBlock = DEFAULT_PAGEBLOCK;
	// 페이지 블록 사이즈 (한 페이지에 보여줄 페이지 번호 개수)
	private int pageBlockSize = DEFAULT_PAGEBLOCKSIZE;
	// 페이지 블록 개수
	private int pageBlockCount;
	// 블록 기준 시작 페이지 번호
	private int pageBegin;
	// 블록 기준 끝 페이지 번호
	private int pageEnd;
	// 다음 페이지 번호 (없으면 0)
	private int nextBlockPage;
	// 이전 페이지 번호 (없으면 0)
	private int prevBlockPage;

	private List<Integer> pageList;
	
	// 웹 페이지에서 보여줄 맨 처음 게시글 번호
	private int rowNum;

	private String url;

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		rowNum = pageBlockSize * pageSize + 1;
		pageList = new ArrayList<Integer>(pageBlockSize);
		for (int i = 0; i <= pageBlockSize; i++) {
			pageList.add((pageSize * i) + 1);
		}
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
		offset = pageSize * (pageNo - 1);
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;

		pageCount = rowCount / pageSize;
		if (rowCount > pageSize * pageCount) {
			pageCount++;
		}

		pageBlockCount = pageCount / pageBlockSize;
		if (pageCount > pageBlockSize * pageBlockCount) {
			pageBlockCount++;
		}

		pageBlock = (pageNo - 1) / pageBlockSize;

		if (pageNo > pageCount) {
			pageBegin = (pageBlockCount - 1) * pageBlockSize + 1;
		} else {
			pageBegin = pageBlock * pageBlockSize + 1;
		}

		prevBlockPage = (pageBegin == 1) ? 0 : pageBegin - 1;

		pageEnd = pageBegin + pageBlockSize - 1;
		if (pageEnd > pageCount)
			pageEnd = pageCount;

		nextBlockPage = (pageEnd == pageCount) ? 0 : pageEnd + 1;
		
		pageBlock++;
	}

}