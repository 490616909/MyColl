package great.entity;

import org.springframework.stereotype.Component;
@Component
public class Study {
	int studyId;
	String studyName;
	public Study() {
		super();
	}
	public Study(int studyId, String studyName) {
		super();
		this.studyId = studyId;
		this.studyName = studyName;
	}
	public int getStudyId() {
		return studyId;
	}
	public void setStudyId(int studyId) {
		this.studyId = studyId;
	}
	public String getStudyName() {
		return studyName;
	}
	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}
	@Override
	public String toString() {
		return "Study [studyId=" + studyId + ", studyName=" + studyName + "]";
	}
	
}
