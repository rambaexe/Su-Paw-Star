using Mobile_Application.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile_Application.Interfaces
{
    public interface IUsersDogsSupabaseService
    {
        Task CreateDog(UsersDogsSuperbase usersdogssuperbase);     // C - Create
        Task<IEnumerable<UsersDogsSuperbase>> ReadDogs();          // R - Read
        Task UpdateDog(UsersDogsSuperbase usersdogssuperbase);     // U - Update
        Task DeleteDog(int id);                                    // D - Delete
    }
}
