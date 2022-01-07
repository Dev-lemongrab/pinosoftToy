package com.pino.ys.dto;



public class boardDto {
	private String sabun;
	private String join_day;
	private String retire_day;
	private String put_yn;
	
	private String name;
	private String job_type;
	private String pos_gbn_code;
	private String join_gbn_code; 

	//페이징 변수
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
	private int cntPage = 5;
	
	public boardDto() {
		
	}
	
	public boardDto(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	
	
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
			setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
			
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
			
			if (getLastPage() < getEndPage()) {
				setEndPage(getLastPage());
			}
			setStartPage(getEndPage() - cntPage + 1);
			if (getStartPage() < 1) {
				setStartPage(1);
			}
	}
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
			
			setEnd(nowPage * cntPerPage);
			setStart(getEnd() - cntPerPage + 1);
	}
	

	public String getSabun() {
		return sabun;
	}

	public void setSabun(String sabun) {
		this.sabun = sabun;
	}

	public String getJoin_day() {
		return join_day;
	}

	public void setJoin_day(String join_day) {
		this.join_day = join_day;
	}

	public String getRetire_day() {
		return retire_day;
	}

	public void setRetire_day(String retire_day) {
		this.retire_day = retire_day;
	}

	public String getPut_yn() {
		return put_yn;
	}

	public void setPut_yn(String put_yn) {
		this.put_yn = put_yn;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJob_type() {
		return job_type;
	}

	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}

	public String getPos_gbn_code() {
		return pos_gbn_code;
	}

	public void setPos_gbn_code(String pos_gbn_code) {
		this.pos_gbn_code = pos_gbn_code;
	}

	public String getJoin_gbn_code() {
		return join_gbn_code;
	}

	public void setJoin_gbn_code(String join_gbn_code) {
		this.join_gbn_code = join_gbn_code;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}

	@Override
	public String toString() {
		return "boardDto [sabun=" + sabun + ", join_day=" + join_day + ", retire_day=" + retire_day + ", put_yn="
				+ put_yn + ", name=" + name + ", job_type=" + job_type + ", pos_gbn_code=" + pos_gbn_code
				+ ", join_gbn_code=" + join_gbn_code + ", nowPage=" + nowPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", total=" + total + ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage
				+ ", start=" + start + ", end=" + end + ", cntPage=" + cntPage + "]";
	}
	
	
	

}
