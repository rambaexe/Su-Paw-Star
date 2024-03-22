using System.Runtime.CompilerServices;

namespace Mobile_Application.Models
{
    public class User
    {
        public string Email { get; set; }
        public string Password { get; set; }
        public string FirstandLastName { get; set; }

        private static User _instance;

        public User()
        {
        }

        public static User Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new User();
                }
                return _instance;
            }
        }
    }
}

