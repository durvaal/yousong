package br.com.ufrn.model;

/**
 * @author Paulo Lima (paulo.xavier.700@ufrn.edu.br, plimayep@gmail.com)
 */
public class SongModel {
	
	private Integer id;
	private Integer userId;
	private Boolean favorite;
	private String song;
	
	public SongModel() {

	}

	/**
	 * @param id
	 * @param userId
	 * @param favorite
	 * @param song
	 */
	public SongModel(Integer id, Integer userId, Boolean favorite, String song) {
		super();
		this.id = id;
		this.userId = userId;
		this.favorite = favorite;
		this.song = song;
	}

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the userId
	 */
	public Integer getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	/**
	 * @return the favorite
	 */
	public Boolean getFavorite() {
		return favorite;
	}

	/**
	 * @param favorite the favorite to set
	 */
	public void setFavorite(Boolean favorite) {
		this.favorite = favorite;
	}

	/**
	 * @return the song
	 */
	public String getSong() {
		return song;
	}

	/**
	 * @param song the song to set
	 */
	public void setSong(String song) {
		this.song = song;
	}
	
}
