package edu.numberone.studystar.entity;

import java.io.Serializable;
import java.util.List;

public class Pager<T> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1880019558453064416L;

	private Integer pageSize;// ÿҳ��ʾ��������¼
	private Integer currentPage;// ��ǰ�ڼ�ҳ����
	private Integer totalRecord;// һ����������¼
	private Integer totalPage;// һ������Ҳ��¼
	private List<T> dateList;// Ҫ��ʾ������

	public Pager() {
		super();
	}

	public Pager(Integer pageSize, Integer currentPage, Integer totalRecord, Integer totalPage, List<T> dateList) {
		super();
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.totalRecord = totalRecord;
		this.totalPage = totalPage;
		this.dateList = dateList;
	}

	/**
	 * ��Sublist��ҳ��ʽ��ѯ���ݿ⣬ͨ��pageNum��pageSize��pageList�����ҪPager����,
	 * 
	 * @param pageList
	 *            ��Ҫ��ҳ�ļ���
	 * @param pageNum
	 *            ��ǰҳ��
	 * @param ��ǰҳ��ʾ�����ݴ�С
	 *
	 * 
	 */
	public Pager(List<T> pageList, int pageNum, int pageSize) {

		if (pageList == null||pageList.size()==0) {
			return;
		}
		// ����ܼ�¼��
		this.totalRecord = pageList.size();
		// ��õ�ǰҳ���Ĵ�С
		this.pageSize = pageSize;
		// �����ҳ��
		this.totalPage = this.totalRecord % pageSize == 0 ? this.totalRecord / pageSize
				: this.totalRecord / pageSize + 1;
		System.out.println("totalPage ---->" + totalPage);

		// ��õ�ǰҳ��
		this.currentPage = pageNum > this.totalPage ? this.totalPage : pageNum;
		System.out.println("currentPage ---->" + currentPage);

		// �����Ҫ��ʾ������
		int start = this.pageSize * (this.currentPage - 1);
		int end = this.pageSize * this.currentPage > this.totalRecord ? this.totalRecord
				: this.pageSize * this.currentPage;

		System.out.println("start ---->" + start);
		System.out.println("end ---->" + end);

		this.dateList = pageList.subList(start, end);

	}

	/**
	 * ��SQL��ҳ��ʽ��ѯ���ݿ�ͨ��pageNum��pageSize��pageList�����ҪPager����
	 * 
	 * @param pageNum
	 *            ��ǰҳ��
	 * @param ��ǰҳ��ʾ�����ݴ�С
	 *            * @param pageList ��Ҫ��ҳ�ļ���
	 *
	 * 
	 */
	public Pager(int pageNum, int pageSize, List<T> pageList) {

		if (pageList == null) {
			return;
		}
		// ����ܼ�¼��
		this.totalRecord = pageList.size();
		// ��õ�ǰҳ���Ĵ�С
		this.pageSize = pageSize;
		// �����ҳ��
		this.totalPage = this.totalRecord % pageSize == 0 ? this.totalRecord / pageSize
				: this.totalRecord / pageSize + 1;
		System.out.println("totalPage ---->" + totalPage);

		// ��õ�ǰҳ��
		this.currentPage = pageNum > this.totalPage ? this.totalPage : pageNum;
		System.out.println("currentPage ---->" + currentPage);

		

		this.dateList = pageList;

	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(Integer totalRecord) {
		this.totalRecord = totalRecord;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public List<T> getDateList() {
		return dateList;
	}

	public void setDateList(List<T> dateList) {
		this.dateList = dateList;
	}

}
