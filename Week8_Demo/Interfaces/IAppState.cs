using Mobile_Application.Models;

namespace Mobile_Application.Interfaces
{
    public interface IAppState
    {
        public User CurrentUser { get; set; }
    }
}

