using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MPDatabase.Models;


namespace MPDatabase.DAO
{
    public class MovieTitlesDAO : IMovieTitlesDAO
    {
        private readonly string connectionString;
        public MovieTitlesDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public MovieTitles GetMovieTitle(int Id)
        {
            MovieTitles movieTitles = null;

            using SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT ID, Name, Description, Release_Year FROM MotionPictures WHERE ID = @ID", conn);
            cmd.Parameters.AddWithValue("@ID", Id);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                movieTitles = CreateTitlesFromReader(reader);
            }
            return movieTitles;
        }
        public List<MovieTitles> GetAllMovieTitles()
        {
            List<MovieTitles> allMovieTitles = new List<MovieTitles>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString)) 

                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT ID, Name, Description, Release_Year FROM MotionPictures", conn);

                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        MovieTitles movieTitles = CreateTitlesFromReader(reader);
                        allMovieTitles.Add(movieTitles);
                    }
                    
                }
            }
            catch (SqlException)
            {
                throw;
            }
            return allMovieTitles;
        }

        public bool RemoveTitle(int Id)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("DELETE FROM MotionPictures WHERE ID = @Id", conn);
                    cmd.Parameters.AddWithValue("@Id", Id);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    return (rowsAffected > 0);
                }
            }
            catch (SqlException)
            {
                throw;
            }
        }

        public bool EditTitle(MovieTitles editMovieTitle, int Id)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("UPDATE MotionPictures SET Name = @Name, Description = @Description, Release_Year = @Release_Year WHERE ID = @Id", conn);
                    cmd.Parameters.AddWithValue("@Name", editMovieTitle.Name);
                    cmd.Parameters.AddWithValue("@Description", editMovieTitle.Description);
                    cmd.Parameters.AddWithValue("@Release_Year", editMovieTitle.Release_Year);
                    cmd.Parameters.AddWithValue("@Id", Id);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    return (rowsAffected > 0);
                }
            }
            catch (SqlException)
            {
                throw;
            }
        }

        public MovieTitles AddTitle(MovieTitles addMovieTitle)
        {

            int newMovieId;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO MotionPictures (Name, Description, Release_Year) " +
                    "OUTPUT INSERTED.ID " +
                    "VALUES (@Name, @Description, @Release_Year) ", conn);

                cmd.Parameters.AddWithValue("@Name", addMovieTitle.Name);
                cmd.Parameters.AddWithValue("@Description", addMovieTitle.Description);
                cmd.Parameters.AddWithValue("@Release_Year", addMovieTitle.Release_Year);

                newMovieId = Convert.ToInt32(cmd.ExecuteScalar());
            }
            return GetMovieTitle(newMovieId);
        }

        private MovieTitles CreateTitlesFromReader(SqlDataReader reader)
        {
            MovieTitles movieTitle = new MovieTitles();
            movieTitle.Id = Convert.ToInt32(reader["ID"]);
            movieTitle.Name = Convert.ToString(reader["Name"]);
            movieTitle.Description = Convert.ToString(reader["Description"]);
            movieTitle.Release_Year = Convert.ToInt32(reader["Release_Year"]);

            return movieTitle;
        }


    }
}

