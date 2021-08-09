package news.model.service;

import static common.JDBCTemp.close;
import static common.JDBCTemp.commit;
import static common.JDBCTemp.getConnection;
import static common.JDBCTemp.rollback;

import java.sql.Connection;


import java.util.ArrayList;

import news.model.vo.News;
import news.model.dao.NewsDao;

public class NewsService {
    NewsDao ndao = new NewsDao(); 
	
    public ArrayList<News> selectAllNews() {
		Connection conn = getConnection();
		ArrayList<News> news = ndao.selectAllNews(conn);
		close(conn);
		return news;
	}

}
	



