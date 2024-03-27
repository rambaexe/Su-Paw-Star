using SQLite;
using Mobile_Application.Interfaces;
using Mobile_Application.Models;
using Supabase.Interfaces;
using Supabase;


namespace Mobile_Application.Services
{
    public class UsersDogsSupabaseService : IUsersDogsSupabaseService
    {
        private readonly Client _supabaseClient;

        public UsersDogsSupabaseService(Supabase.Client supabaseClient)
        {
            _supabaseClient = supabaseClient;
        }

        public async Task CreateDog(UsersDogsSuperbase usersdogssuperbase)
        {
            await _supabaseClient.From<UsersDogsSuperbase>().Insert(usersdogssuperbase);
        }

        public async Task<IEnumerable<UsersDogsSuperbase>> ReadDogs()
        {
            var response = await _supabaseClient.From<UsersDogsSuperbase>().Get();
            return response.Models;
        }

        public async Task UpdateDog(UsersDogsSuperbase usersdogssuperbase)
        {
            await _supabaseClient.From<UsersDogsSuperbase>().Where(b => b.Id == usersdogssuperbase.Id)
                .Set(b => b.User_Id, usersdogssuperbase.User_Id)
                .Set(b => b.Dog_Name, usersdogssuperbase.Dog_Name)
                .Set(b => b.Dog_Breed, usersdogssuperbase.Dog_Breed)
                .Set(b => b.Dog_Age, usersdogssuperbase.Dog_Age)    
                .Set(b => b.Dog_Colour, usersdogssuperbase.Dog_Colour)
                .Set(b => b.Dog_Size, usersdogssuperbase.Dog_Size)
                .Update();
        }

        public async Task DeleteDog(int id)
        {
            await _supabaseClient.From<UsersDogsSuperbase>().Where(b => b.Id == id).Delete();
        }
    }
}
