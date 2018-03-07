using System;
using System.Data.SqlClient;

namespace geography_repro
{
    public static class GeographySelector
    {
        public static string GetGeographyResult(string connectionString)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (var command = new SqlCommand("SELECT geo from geo_table", connection))
                {
                    return command.ExecuteScalar().ToString();
                }
            }
        }
    }
}
