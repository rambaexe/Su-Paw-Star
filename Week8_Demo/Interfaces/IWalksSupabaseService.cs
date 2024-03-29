using Mobile_Application.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile_Application.Interfaces
{
    public interface IWalksSupabaseService
    {
        Task CreateWalk(WalksSupabase walksSupabase);       // C - Create
        Task<IEnumerable<WalksSupabase>> ReadWalks();       // R - Read
        Task UpdateWalk(WalksSupabase walksSupabase);       // U - Update
        Task DeleteWalk(int id);                            // D - Delete
    }
}
