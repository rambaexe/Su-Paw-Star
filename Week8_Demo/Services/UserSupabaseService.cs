using SQLite;
using Mobile_Application.Interfaces;
using Mobile_Application.Models;
using Supabase.Interfaces;
using Supabase;


namespace Mobile_Application.Services
{
    public class UserSupabaseService : IUserSupabaseService
    {
        private readonly Client _supabaseClient;

        public UserSupabaseService(Supabase.Client supabaseClient)
        {
            _supabaseClient = supabaseClient;
        }

        public async Task CreateUser(UserSuperbase usersupabase)
        {
            await _supabaseClient.From<UserSuperbase>().Insert(usersupabase);
        }

        public async Task<IEnumerable<UserSuperbase>> ReadUsers()
        {
            var response = await _supabaseClient.From<UserSuperbase>().Get();
            return response.Models;
        }

        public async Task UpdateUser(UserSuperbase usersupabase)
        {
            await _supabaseClient.From<UserSuperbase>().Where(b => b.Id == usersupabase.Id)
                .Set(b => b.Email, usersupabase.Email)
                .Set(b => b.CreatedAt, usersupabase.CreatedAt)
                .Set(b => b.FirstandLastName, usersupabase.FirstandLastName)
                .Update();
        }

        public async Task DeleteUser(int id)
        {
            await _supabaseClient.From<UserSuperbase>().Where(b => b.Id == id).Delete();
        }
    }
}
