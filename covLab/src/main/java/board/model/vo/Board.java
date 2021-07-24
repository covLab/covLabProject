package board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{

	private static final long serialVersionUID = 111L;
	
	private int boardNo;
	private String boardTitle;
	private String boardWriter;
	private String boardContent;
	private Date boardDate;
	private int viewCnt;
	private int recommendCnt;
	
	public Board() {}

	public Board(String boardTitle, String boardWriter, String boardContent) {
		super();
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.boardContent = boardContent;
	}

	public Board(int boardNo, String boardTitle, String boardWriter, String boardContent, Date boardDate, int viewCnt,
			int recommendCnt) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.viewCnt = viewCnt;
		this.recommendCnt = recommendCnt;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public int getRecommendCnt() {
		return recommendCnt;
	}

	public void setRecommendCnt(int recommendCnt) {
		this.recommendCnt = recommendCnt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardWriter=" + boardWriter
				+ ", boardContent=" + boardContent + ", boardDate=" + boardDate + ", viewCnt=" + viewCnt
				+ ", recommendCnt=" + recommendCnt + "]";
	}
	
	
	
	
}
