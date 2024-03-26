using SQLite;
using Mobile_Application.Interfaces;
using Mobile_Application.Models;
using Supabase.Interfaces;


namespace Mobile_Application.Services
{
    public class UserSuperbaseService : UserSuperbaseServiceInterface
    {
        public UserSuperbaseService()
        {
        }

        // CRUD operations for UserSuperbaseServiceInterface
        // using Models.SupabaseClient for SupabaseClient connection

        public async Task<IEnumerable<UserSuperbase>> GetUsers()
        {
            var currentclient = SupabaseClient.Instance.CurrentSupabaseClient;
            var response = await currentclient.From<UserSuperbase>().Get();
            return response.Models;
        }

        public async Task EditUser(UserSuperbase user)
        {
            var currentclient = SupabaseClient.Instance.CurrentSupabaseClient;
            await currentclient.From<UserSuperbase>().Where(b => b.Id == user.Id)
            .Set(b => b.Email, user.Email)
            .Set(b => b.FirstandLastName, user.FirstandLastName)
            .Update();
        }

        public async Task SaveUser(UserSuperbase user)
        {
            var currentclient = SupabaseClient.Instance.CurrentSupabaseClient;
            var response = await currentclient.From<UserSuperbase>().Insert(user);
        }

        public async Task RemoveUser(UserSuperbase user)
        {
            var currentclient = SupabaseClient.Instance.CurrentSupabaseClient;
            await currentclient.From<UserSuperbase>().Where(b => b.Id == user.Id).Delete();
        }

        
    }
}
