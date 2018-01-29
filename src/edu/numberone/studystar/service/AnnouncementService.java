package edu.numberone.studystar.service;

import edu.numberone.studystar.entity.Announcement;
import edu.numberone.studystar.entity.Pager;
import edu.numberone.studystar.entity.Paper;
import edu.numberone.studystar.jdbc.JdbcQuery;
import edu.numberone.studystar.jdbc.JdbcUtils;

public interface AnnouncementService {
	public Announcement findNewById(String ann_id);
	
	//ĳһҳ�Ĺ���
	public Pager<Announcement> findAllAnnouncement(Integer currentPage, Integer pageSize);
		
}
