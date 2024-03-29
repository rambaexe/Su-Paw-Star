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
        public WalksSupabaseService _walksSupabaseService;

        public SupabaseFacadeService(Supabase.Client supabaseClient)
        {
            _usersDogsSupabaseService = new UsersDogsSupabaseService(supabaseClient);
            _usersSupabaseService = new UserSupabaseService(supabaseClient);
            _walksSupabaseService = new WalksSupabaseService(supabaseClient);
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

        public async Task<IEnumerable<UsersDogsSuperbase>> ReadDogsByUserId(int userId)
        {
            return await _usersDogsSupabaseService.ReadDogsByUserId(userId);
        }

        public async Task CreateWalk(WalksSupabase walksSupabase)
        {
            await _walksSupabaseService.CreateWalk(walksSupabase);
        }

        public async Task<IEnumerable<WalksSupabase>> ReadWalks()
        {
            return await _walksSupabaseService.ReadWalks();
        }

        public async Task UpdateWalk(WalksSupabase walksSupabase)
        {
            await _walksSupabaseService.UpdateWalk(walksSupabase);
        }

        public async Task DeleteWalk(int id)
        {
            await _walksSupabaseService.DeleteWalk(id);
        }
    }
}
