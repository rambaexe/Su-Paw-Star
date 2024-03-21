namespace Mobile_Application
{
    public static class Constants
    {
        public static string RestEndpointBase = "https://api.quotable.io";

        public static class Endpoints
        {
            public static string RandomQuote = "/random";
            public static string ListRandomQuotes = "/quotes";
        }
        
          public const SQLite.SQLiteOpenFlags Flags =
                // open the database in read/write mode
                SQLite.SQLiteOpenFlags.ReadWrite |
                // create the database if it doesn't exist
                SQLite.SQLiteOpenFlags.Create |
                // enable multi-threaded database access
                SQLite.SQLiteOpenFlags.SharedCache;
        
        public const string DatabaseFilename = "DemoDatabase.db3";

        public static string DatabasePath =>
            Path.Combine(FileSystem.AppDataDirectory, DatabaseFilename);


        // postgres://postgres.kmqqbacbnpppertamtdn:[S%r&cYcy-cWr4,T]@aws-0-eu-west-2.pooler.supabase.com:5432/postgres
    }
}