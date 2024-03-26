using Mobile_Application.Models;
using Supabase.Gotrue;

namespace Mobile_Application.Interfaces
{
    public interface IUserSupabaseService
    {
        Task CreateUser(UserSuperbase usersupabase);       // C - Create
        Task<IEnumerable<UserSuperbase>> ReadUsers();       // R - Read
        Task UpdateUser(UserSuperbase usersupabase);       // U - Update
        Task DeleteUser(int id);                           // D - Delete
    }
}