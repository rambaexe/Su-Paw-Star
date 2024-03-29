using SQLite;
using Mobile_Application.Interfaces;
using Mobile_Application.Models;
using Supabase.Interfaces;
using Supabase;

namespace Mobile_Application.Services
{
    public class WalksSupabaseService : IWalksSupabaseService
    {
        private readonly Client _supabaseClient;

        public WalksSupabaseService(Supabase.Client supabaseClient)
        {
            _supabaseClient = supabaseClient;
        }

        public async Task CreateWalk(WalksSupabase walksSupabase)
        {
            await _supabaseClient.From<WalksSupabase>().Insert(walksSupabase);
        }

        public async Task<IEnumerable<WalksSupabase>> ReadWalks()
        {
            var response = await _supabaseClient.From<WalksSupabase>().Get();
            return response.Models;
        }

        public async Task UpdateWalk(WalksSupabase walksSupabase)
        {
            await _supabaseClient.From<WalksSupabase>().Where(b => b.Walk_Id == walksSupabase.Walk_Id)
                .Set(b => b.Walk_Date, walksSupabase.Walk_Date)
                .Set(b => b.Walk_Time, walksSupabase.Walk_Time)
                .Set(b => b.Walk_Description, walksSupabase.Walk_Description)
                .Set(b => b.Dog_Rating, walksSupabase.Dog_Rating)
                .Update();
        }

        public async Task DeleteWalk(int id)
        {
            await _supabaseClient.From<WalksSupabase>().Where(b => b.Walk_Id == id).Delete();
        }
    }
}
