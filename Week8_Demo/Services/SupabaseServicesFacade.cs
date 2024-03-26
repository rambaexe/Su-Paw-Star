using System;
using Mobile_Application.Interfaces;
using Mobile_Application.Models;
using Supabase.Interfaces;

namespace Mobile_Application.Services
{
    public class SupabaseServicesFacade
    {
        private readonly UserSuperbaseService _userService;

        public SupabaseServicesFacade(UserSuperbaseService userService)
        {
            _userService = userService;

        }

        // get user by user id
        public async Task<UserSuperbase> GetUser(int id)
        {
            var models = await _userService.GetUsers();
            foreach (var model in models)
            {
                if (model.Id == id)
                {
                    return model;
                }
            }
            return null;
        }
        
        public async Task<IEnumerable<UserSuperbase>> GetUsers()
        {
            return await _userService.GetUsers();
        }

        public async Task EditUser(int id, string email, string firstAndLastName)
        {
            UserSuperbase user = new UserSuperbase
            {
                Id = id,
                Email = email,
                FirstandLastName = firstAndLastName
            };

            await _userService.EditUser(user);
        }

        public async Task SaveUser(string email, string firstAndLastName)
        {
            UserSuperbase user = new UserSuperbase
            {
                Email = email,
                FirstandLastName = firstAndLastName
            };

            await _userService.SaveUser(user);
        }

        public async Task RemoveUser(int id)
        {
            UserSuperbase user = new UserSuperbase
            {
                Id = id
            };
            await _userService.RemoveUser(user);
        }
    }

}
