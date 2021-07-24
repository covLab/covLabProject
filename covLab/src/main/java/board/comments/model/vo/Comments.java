package board.comments.model.vo;

import java.sql.Date;

public class Comments implements java.io.Serializable{

	private static final long serialVersionUID = 112L;
	
	private int comNo;
	private int boardRef;
	private String comWriter;
	private Date comDate;
	private String comContent;
	private int comLevel;
	
	public Comments() {}

	public Comments(String comWriter, String comContent) {
		super();
		this.comWriter = comWriter;
		this.comContent = comContent;
	}

	public Comments(int comNo, int boardRef, String comWriter, Date comDate, String comContent, int comLevel) {
		super();
		this.comNo = comNo;
		this.boardRef = boardRef;
		this.comWriter = comWriter;
		this.comDate = comDate;
		this.comContent = comContent;
		this.comLevel = comLevel;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getBoardRef() {
		return boardRef;
	}

	public void setBoardRef(int boardRef) {
		this.boardRef = boardRef;
	}

	public String getComWriter() {
		return comWriter;
	}

	public void setComWriter(String comWriter) {
		this.comWriter = comWriter;
	}

	public Date getComDate() {
		return comDate;
	}

	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}

	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public int getComLevel() {
		return comLevel;
	}

	public void setComLevel(int comLevel) {
		this.comLevel = comLevel;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Comments [comNo=" + comNo + ", boardRef=" + boardRef + ", comWriter=" + comWriter + ", comDate="
				+ comDate + ", comContent=" + comContent + ", comLevel=" + comLevel + "]";
	}
	
	

}
