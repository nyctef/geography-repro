using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using geography_repro;

namespace geography_repro_cli
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length != 1)
            {
                Console.Error.WriteLine("Usage: geography-repro-cli [connection string]");
            }

            var connectionString = args[0];

            try
            {
                var result = GeographySelector.GetGeographyResult(connectionString);
                Console.WriteLine(result);
            }
            catch (Exception e)
            {
                Console.Error.WriteLine(e);
            }
        }
    }
}
