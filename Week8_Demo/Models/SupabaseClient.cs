using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile_Application.Models
{
    public class SupabaseClient
    {
        private static SupabaseClient _instance;

        // have the Supabase client instance
        public Supabase.Client CurrentSupabaseClient { get; set; }

        public SupabaseClient()
        {
        }

        // Singleton pattern
        public static SupabaseClient Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new SupabaseClient();
                }
                return _instance;
            }
        }

        public void Clear()
        {
            _instance = null;
        }

    }
}
