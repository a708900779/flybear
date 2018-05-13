package flybear.hziee.app.util;

import java.util.List;

public class Page {

	/**
	 * 当前页，默认第一页
	 */
	private int page = 1;
	
	/**
	 * 每页数量,默认每页15个
	 */
	private int rows = 15;
	
	/**
	 * 总数
	 */
	private int total;
	
	/**
	 * 最大页码
	 */
	private int maxPage;
	
	/**
	 * 是否有上一页
	 */
	private boolean hasPrev;
	
	/**
	 * 是否有下一页
	 */
	private boolean hasNext;
	
	private List<?> data;
	
	private int[] pageRange;
	
	public Page(int page,int rows,int total,List<?> data) {
		this.page = page;
		this.rows = rows;
		this.total = total;
		this.data = data;
		init();
	}


	private void init() {
		//计算最大页码
		this.maxPage = total%rows == 0 ? total/rows : total/rows+1;
		hasNext = page >= 1 && page < maxPage;
		hasPrev = page <= maxPage &&  page > 1;
		
		//计算当前页前后共5页页码
		if(maxPage <= 5) {
			//总共才5页，都显示出来
			pageRange = new int[maxPage];
			for(int i=1;i<=maxPage;i++) {
				pageRange[i-1] = i;
			}
		} else {
			//大于5页
			int start = page -2;
			int end = page + 2;
			if(page>=1 && page <= 3) {
				//在前面5页
				start = 1;
				end = 5;
			} else if(page <=maxPage && page >=maxPage-2) {
				//在最后5页
				end = maxPage;
				start = maxPage - 4;
			}
			int j = 0;
			pageRange = new int[5];
			for(int i=start;i<=end;i++) {
				pageRange[j++] = i;
			}
		}
		
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getRows() {
		return rows;
	}


	public void setRows(int rows) {
		this.rows = rows;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public int getMaxPage() {
		return maxPage;
	}


	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}


	public boolean isHasPrev() {
		return hasPrev;
	}


	public void setHasPrev(boolean hasPrev) {
		this.hasPrev = hasPrev;
	}


	public boolean isHasNext() {
		return hasNext;
	}


	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}


	public List<?> getData() {
		return data;
	}


	public void setData(List<?> data) {
		this.data = data;
	}


	public int[] getPageRange() {
		return pageRange;
	}


	public void setPageRange(int[] pageRange) {
		this.pageRange = pageRange;
	}
	
}
