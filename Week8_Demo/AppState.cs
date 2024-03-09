using Mobile_Application.Interfaces;
using Mobile_Application.Models;

namespace Mobile_Application
{
    public class AppState : IAppState
    {
        public User CurrentUser { get; set; }

        public AppState()
        {

        }
    }
}

