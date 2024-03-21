using System.Windows.Input;
using MauiMicroMvvm;
using Mobile_Application.Interfaces;
using Supabase;

namespace Mobile_Application.ViewModels
{
    public class RegisterPageViewModel : BaseViewModel
    {
        private readonly Supabase.Client _supabaseClient;
        private readonly IAppState _appState;

        public ICommand NavigateToMainUiCommand { get; set; }
        public ICommand ValidateCommand => new Command(Validate);

        public string Email
        {
            get => Get<string>();
            set
            {
                Set(value);
                (NavigateToMainUiCommand as Command).ChangeCanExecute();
            }
        }

        public string Password
        {
            get => Get<string>();
            set
            {
                Set(value);
                (NavigateToMainUiCommand as Command).ChangeCanExecute();
            }
        }

        public RegisterPageViewModel(ViewModelContext context, IAppState appState) : base(context)
        {
            _supabaseClient = new Supabase.Client(Constants.SupabaseUrl, Constants.SupabaseAnonKey);
            //ValidateCommand = new Command(Validate);

            NavigateToMainUiCommand = new Command(execute: async () => await NavigateToMainUI(),
                               () => !string.IsNullOrEmpty(Email) && !string.IsNullOrEmpty(Password));
            _appState = appState;
        }

        public override void OnAppearing()
        {
            base.OnAppearing();
            Email = string.Empty;
            Password = string.Empty;
        }

        private async Task NavigateToMainUI()
        {
            // get user details
            var user = new Models.User()
            {
                Email = Email,
                Password = Password
            };

            var response = await _supabaseClient.Auth.SignUp(Email, Password);
            
            if (response.User != null)
            {
                await Shell.Current.DisplayAlert("Sign up failed", "Account couldn't be created. Please try again.", "OK");

            }
            else
            {
                await Shell.Current.GoToAsync("//MainUI");
            }
        }

        private void Validate()
        {
            (NavigateToMainUiCommand as Command).ChangeCanExecute();
        }
    }
}
