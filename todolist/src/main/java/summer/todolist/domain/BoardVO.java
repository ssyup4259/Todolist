package summer.todolist.domain;

public class BoardVO {
	private int bnum;
	private String title;
	private String content;
	private String deadline;
	private String createdate;
	private int priority;
	private String finish;

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public String getFinish() {
		return finish;
	}

	public void setFinish(String finish) {
		this.finish = finish;
	}

	@Override
	public String toString() {
		return "BoardVO [bnum=" + bnum + ", title=" + title + ", content=" + content + ", deadline=" + deadline
				+ ", createdate=" + createdate + ", priority=" + priority + ", finish=" + finish + "]";
	}

}
