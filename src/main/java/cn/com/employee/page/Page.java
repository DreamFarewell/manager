package cn.com.employee.page;

import java.util.List;

public class Page<T> {
	private List<T> list; // 当前页列表数据，数据库查询得到
	private int pageNumber; // 当前页码，前端页面传递
	private int totalRecord; // 总记录数
	private int pageSize; // 每页显示记录数

	public Page() {
		super();
	}

	public Page(int pageNumber, int totalRecord) {
		super();
		this.pageNumber = pageNumber;
		this.totalRecord = totalRecord;
		this.pageSize = 10;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getPageNumber() {
		if (pageNumber < 1) {
			pageNumber = 1;
		} else if (pageNumber > getTotalPage()) {
			pageNumber = getTotalPage();
		}
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return pageNumber <= (int) Math.ceil((double) getTotalRecord() / getPageSize())
				? (int) Math.ceil((double) getTotalRecord() / getPageSize())
				: (int) Math.ceil((double) getTotalRecord() / getPageSize());
	}

	public int getIndex() {
		return (getPageNumber() - 1) * getPageSize();
	}
}