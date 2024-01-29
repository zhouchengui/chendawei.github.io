package com.dao;

import com.entity.Chapter;
import com.entity.Resource;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;


public interface ChapterDao {
    public List<Chapter> findAll( @Param("chapter")Chapter chapter, @Param("begin_date") Date begin_date, @Param("end_date") Date end_date);
    void insertNewChapter(Chapter chapter);
    int updateChapter(Chapter chapter);
    List<Chapter> showChapterFrontByCourseId(Integer course_id);
    List<Resource> selectResourcesByChapterId(Integer id);
}
