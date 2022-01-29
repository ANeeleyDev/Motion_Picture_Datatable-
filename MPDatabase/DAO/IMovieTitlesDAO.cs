using MPDatabase.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace MPDatabase.DAO
{


    public interface IMovieTitlesDAO
    {

        public MovieTitles AddTitle(MovieTitles addMovieTitle);
        public bool RemoveTitle(int Id);
        public List<MovieTitles> GetAllMovieTitles();
        public bool EditTitle(MovieTitles editMovieTitle, int Id);

    }
}

