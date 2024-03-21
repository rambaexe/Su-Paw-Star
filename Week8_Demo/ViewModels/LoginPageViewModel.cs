using System.Windows.Input;
using MauiMicroMvvm;
using Mobile_Application.Interfaces;
using Supabase;
using Supabase.Interfaces;

namespace Mobile_Application.ViewModels
{
    public class LoginPageViewModel : BaseViewModel
    {
        private readonly Supabase.Client _supabaseClient;
        private readonly IAppState _appState;

        public ICommand NavigateToMainUiCommand { get; set; }
        public ICommand NavigateToRegisterPageCommand { get; set; }
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

        public LoginPageViewModel(ViewModelContext context, IAppState appState): base(context)
        {
            _supabaseClient = new Supabase.Client(Constants.SupabaseUrl, Constants.SupabaseAnonKey);
            validateCommand = new Command(Validate);

            NavigateToMainUiCommand = new Command(execute: async () => await NavigateToMainUI(),
                () => !string.IsNullOrEmpty(Email) && !string.IsNullOrEmpty(Password));
            NavigateToRegisterPageCommand = new Command(execute: async () => await NavigateToRegisterPage());
            _appState = appState;

        }

        public override void OnAppearing()
        {
            base.OnAppearing();
            Email = string.Empty;
            Password = string.Empty;
        }

        private async Task NavigateToRegisterPage()
        {
            await Shell.Current.GoToAsync("/RegisterPage");
        }

        private async Task NavigateToMainUI()
        {
            try
            {
                _appState.CurrentUser = new Models.User()
                {
                    Email = Email,
                    Password = Password

                };

                var response = await _supabaseClient.Auth.SignIn(Email, Password);
                // check if the user is authenticated
                if (response.User == null)
                {
                    await Shell.Current.DisplayAlert("Sign in failed", "Credentials couldn't be found. Please try again or register for an account.", "OK");
                    return;
                }
                await Shell.Current.GoToAsync("//BmiPage");
            }
            catch (Exception ex)
            {
                // display popup with general error message
                await Shell.Current.DisplayAlert("Sign in failed", "An unexpected error occurred. Please try again or register for an account.", "OK");
            }
        }

        private Command validateCommand;

        private void Validate()
        {
            
            //some validation
        }
    }
}

