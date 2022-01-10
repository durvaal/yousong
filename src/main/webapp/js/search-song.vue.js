new Vue({
  el: "#search-song",
  data() {
    return {
      radios: [],
      songs: [],
      loadingRadio: true,
      loadingSong: true,
	  loadingSaveSong: false,
      selectedRadio: {},
	  validation: {
		message: null,
		success: false,
	  },
    };
  },
  methods: {
    async getAllRadios() {
      try {
        this.loadingRadio = true;
        const response = await fetch("https://cors-to-deezer.herokuapp.com/https://api.deezer.com/radio");
        const { data: radios } = await response.json();

        this.radios = radios;
      } catch (error) {
        console.error(error);
      } finally {
        this.loadingRadio = false;
      }
    },
    async getAllSongs() {
      try {
        this.loadingSong = true;
        const response = await fetch(`https://cors-to-deezer.herokuapp.com/${this.selectedRadio.tracklist}`);
        const { data } = await response.json();

        this.songs = data;
      } catch (error) {
        console.error(error);
      } finally {
        this.loadingSong = false;
      }
    },
    async seeSongs(radio) {
      this.selectedRadio = radio;
      $("#seeSongsModal").modal();
      await this.getAllSongs();
    },
	async saveSong(song) {
	  const createSongForm = document.forms["createSongForm"];
	  const songIdInput = createSongForm["songId"];
	  const songObjectInput = createSongForm["songObject"];
	  
	  songIdInput.value = song.id;
	  songObjectInput.value = JSON.stringify(song);


	  $('#toastValidation').toast("dispose");
      this.loadingSaveSong = true;

	  const response = await fetch("/projeto-1/api/v1/songs/save", {
	  	method: "POST",
		headers: {
          "Content-Type": "application/x-www-form-urlencoded",
    	},
	    body: new URLSearchParams(new FormData(createSongForm)).toString(),
	  });
	  
      this.validation = await response.json();
	  $('#toastValidation').toast("show");
      this.loadingSaveSong = false;
	}
  },
  async mounted() {
    await this.getAllRadios();
  }
});
