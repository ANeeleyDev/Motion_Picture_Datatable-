<template>
<b-form @submit="onSubmit" @reset="onReset">

    <label> Name:</label>
    <input type="text" maxlength="50" required v-model="motionPicture.name"> 

    <label>Description:</label>
    <input type="text area" maxlength="500" v-model="motionPicture.description">

    <label> Release Year:</label>
    <input type="text" maxlength="4" required v-model="motionPicture.release_year">

    <b-btn type="submit">Submit</b-btn>

</b-form>

</template>    

<script>
import tableservice from "@/services/TableService";

export default {
    name: "add-form",
    props: ["Id"],

    data(){
        return{
            editId: this.$route.params.Id,

            movie:{
                Id: "",
                title: "",
                description: "",
                release_year: "",

            }
        }
    },
    methods: {
        submitForm() {
      const newMovie = {
        
        name: this.movie.title,
        description: this.movie.description,
        release_year: this.movie.release_year,       
        
      }
    }        
    }
}

</script>




<style>

form{
    max-width: 420px;
    margin: 30px auto;
    background: white;
    text-align: left;
    padding: 40px;
    border-radius: 10px;    
}
label {
    color: black;
    display: inline-block;
    margin: 25px 0 15px;
    font-size: 0.6em;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: bold;
}
input {
    display: block;
    padding: 10px 6px;
    width: 100%;
    box-sizing: border-box;
    border: none;
    border-bottom: 1px solid #ddd;
    color: #555
}
</style>