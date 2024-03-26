using Mobile_Application.Models;
using Supabase.Gotrue;

namespace Mobile_Application.Interfaces
{
    public interface UserSuperbaseServiceInterface
    {
        // CRUD OPERATIONS FOR UserSuperbase
        public Task SaveUser(Models.UserSuperbase user);            // C - Create
        public Task EditUser(Models.UserSuperbase user);            // U - Update
        public Task RemoveUser(Models.UserSuperbase user);                         // D - Delete
        public Task<IEnumerable<Models.UserSuperbase>> GetUsers();         // R - Read
    }
}