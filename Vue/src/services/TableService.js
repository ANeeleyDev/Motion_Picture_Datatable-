import axios from 'axios';

export default {


    getAllMovieTitles(){
        return axios.get(`/movietitles/display`)
    },

    addTitle(addMovieTitle){
        return axios.post(`/movietitles/add`, addMovieTitle)
    },

    editTitle(Id, editMovieTitle){
        return axios.put(`/movietitles/edit/${Id}`, editMovieTitle)
    },

    removeTitle(Id){
        return axios.delete(`/movietitles/remove/${Id}`)
    },
}