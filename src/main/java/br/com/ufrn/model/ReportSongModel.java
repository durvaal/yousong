package br.com.ufrn.model;

/**
 * @author Paulo Lima (paulo.xavier.700@ufrn.edu.br, plimayep@gmail.com)
 */
public class ReportSongModel {
	
	private Integer savedCount = 0;
	private Integer favoriteCount = 0;
	
	public ReportSongModel() {

	}

	/**
	 * @param savedCount
	 * @param favoriteCount
	 */
	public ReportSongModel(Integer savedCount, Integer favoriteCount) {
		super();
		this.savedCount = savedCount;
		this.favoriteCount = favoriteCount;
	}

	/**
	 * @return the savedCount
	 */
	public Integer getSavedCount() {
		return savedCount;
	}

	/**
	 * @param savedCount the savedCount to set
	 */
	public void setSavedCount(Integer savedCount) {
		this.savedCount = savedCount;
	}

	/**
	 * @return the favoriteCount
	 */
	public Integer getFavoriteCount() {
		return favoriteCount;
	}

	/**
	 * @param favoriteCount the favoriteCount to set
	 */
	public void setFavoriteCount(Integer favoriteCount) {
		this.favoriteCount = favoriteCount;
	}
	
}
