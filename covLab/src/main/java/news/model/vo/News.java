package news.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class News implements Serializable {
	private static final long serialVersionUID = 128L;
	
	private String title;
	private String url;
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}
	public News(String title, String url) {
		super();
		this.title = title;
		this.url = url;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
	