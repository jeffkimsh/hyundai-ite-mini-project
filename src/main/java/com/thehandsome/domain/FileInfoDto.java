// 작성자 : 차은채
// 기능 : 파일 처리에 필요한 정보를 담은 VO
package com.thehandsome.domain;

public class FileInfoDto {

	private String saveFolder;
	private String originFile;
	private String saveFile;

	public String getSaveFolder() {
		return saveFolder;
	}

	public void setSaveFolder(String saveFolder) {
		this.saveFolder = saveFolder;
	}

	public String getOriginFile() {
		return originFile;
	}

	public void setOriginFile(String originFile) {
		this.originFile = originFile;
	}

	public String getSaveFile() {
		return saveFile;
	}

	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}

}
