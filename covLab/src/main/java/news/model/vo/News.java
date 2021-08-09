package news.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class News implements Serializable {
	private static final long serialVersionUID = 128L;
	
	private String title;
	private String url;
	private Date wrtn_tm;
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}
	public News(String title, String url, Date wrtn_tm) {
		super();
		this.title = title;
		this.url = url;
		this.wrtn_tm = wrtn_tm;
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
	public Date getWrtn_tm() {
		return wrtn_tm;
	}
	public void setWrtn_tm(Date wrtn_tm) {
		this.wrtn_tm = wrtn_tm;
	}
}
	