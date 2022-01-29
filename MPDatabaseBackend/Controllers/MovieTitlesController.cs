using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MPDatabase.DAO;
using MPDatabase.Models;



namespace MPDatabase.Controllers
{
    [Route("/movietitles/")]
    [ApiController]

    public class MovieTitlesController : ControllerBase

    {
        private readonly IMovieTitlesDAO movieTitlesDAO;

        public MovieTitlesController(IMovieTitlesDAO _movieTitlesDAO)
        {
            movieTitlesDAO = _movieTitlesDAO;
        }

        [HttpGet("display")]
        public List<MovieTitles> GetAllMovieTitles()
        {
            return movieTitlesDAO.GetAllMovieTitles();
        }

        [HttpPost("add")]
        public MovieTitles AddTitle(MovieTitles addMovieTitle)
        {
            return movieTitlesDAO.AddTitle(addMovieTitle);
        }

        [HttpDelete("remove")]
        public bool RemoveTitle(int Id)
        {
            return movieTitlesDAO.RemoveTitle(Id);
        }

        [HttpPut("edit")]
        public bool EditTitle(MovieTitles editMovieTitle, int Id)
        {
            return movieTitlesDAO.EditTitle(editMovieTitle, Id);
        }



    }
}
