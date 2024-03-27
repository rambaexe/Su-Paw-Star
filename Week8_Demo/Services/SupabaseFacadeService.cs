using Mobile_Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Supabase.Interfaces;
using Mobile_Application.Models;

namespace Mobile_Application.Services
{
    public class SupabaseFacadeService
    {
        public UsersDogsSupabaseService _usersDogsSupabaseService;
        public UserSupabaseService _usersSupabaseService;

        public SupabaseFacadeService(Supabase.Client supabaseClient)
        {
            _usersDogsSupabaseService = new UsersDogsSupabaseService(supabaseClient);
            _usersSupabaseService = new UserSupabaseService(supabaseClient);
        }

        public async Task CreateUser(UserSuperbase usersupabase)
        {
            await _usersSupabaseService.CreateUser(usersupabase); 
        }

        public async Task<IEnumerable<UserSuperbase>> ReadUsers()
        {
            return await _usersSupabaseService.ReadUsers();
        }

        public async Task UpdateUser(UserSuperbase usersupabase)
        {
            await _usersSupabaseService.UpdateUser(usersupabase);
        }

        public async Task DeleteUser(int id)
        {
            await _usersSupabaseService.DeleteUser(id);
        }

        public async Task CreateDog(UsersDogsSuperbase usersdogssuperbase)
        {
            await _usersDogsSupabaseService.CreateDog(usersdogssuperbase);
        }

        public async Task<IEnumerable<UsersDogsSuperbase>> ReadDogs()
        {
            return await _usersDogsSupabaseService.ReadDogs();
        }

        public async Task UpdateDog(UsersDogsSuperbase usersdogssuperbase)
        {
            await _usersDogsSupabaseService.UpdateDog(usersdogssuperbase);
        }

        public async Task DeleteDog(int id)
        {
            await _usersDogsSupabaseService.DeleteDog(id);
        }

    }
}
