using System.Security.Cryptography;
using System.Windows.Input;
using MauiMicroMvvm;
using Mobile_Application.Interfaces;
using Mobile_Application.Models;
using Supabase;
using Mobile_Application.Services;

namespace Mobile_Application.ViewModels
{
    public class RegisterPageViewModel : BaseViewModel
    {
        private readonly Supabase.Client _supabaseClient;
        private readonly IAppState _appState;

        public ICommand RegisterCommand { get; set; }

        public string FirstandLastName
        {
            get => Get<string>();
            set
            {
                Set(value);
                (RegisterCommand as Command).ChangeCanExecute();
            }
        }

        public string Email
        {
            get => Get<string>();
            set
            {
                Set(value);
                (RegisterCommand as Command).ChangeCanExecute();
            }
        }

        public string Password
        {
            get => Get<string>();
            set
            {
                Set(value);
                (RegisterCommand as Command).ChangeCanExecute();
            }
        }

        public string ConfirmPassword
        {
            get => Get<string>();
            set
            {
                Set(value);
                (RegisterCommand as Command).ChangeCanExecute();
            }
        }

        public RegisterPageViewModel(ViewModelContext context, IAppState appState) : base(context)
        {
            _supabaseClient = new Supabase.Client(Constants.SupabaseUrl, Constants.SupabaseAnonKey);
            _appState = appState;

            RegisterCommand = new Command(execute: async () => await Register(),
                                          canExecute: () => !string.IsNullOrEmpty(FirstandLastName) && !string.IsNullOrEmpty(Email) && !string.IsNullOrEmpty(Password) && !string.IsNullOrEmpty(ConfirmPassword));
        }

        private async Task Register()
        {
            if (string.IsNullOrEmpty(FirstandLastName) || string.IsNullOrEmpty(Email) || string.IsNullOrEmpty(Password) || string.IsNullOrEmpty(ConfirmPassword))
            {
                await Shell.Current.DisplayAlert("Error", "Please fill in all fields.", "OK");
                return;
            }

            if (Password != ConfirmPassword)
            {
                await Shell.Current.DisplayAlert("Error", "Passwords do not match.", "OK");
                return;
            }

            try
            {
                var response = await _supabaseClient.Auth.SignUp(Email, Password);
                // get user id from response
               
                var model = new UserSuperbase
                {
                    Email = Email,
                    CreatedAt = DateTime.Now.ToString(),
                    FirstandLastName = FirstandLastName
                };

                try
                {
                    // use UserSuperbaseService to save user
                    // Services.UserSuperbaseService userSuperbaseService = new Services.UserSuperbaseService();
                    // userSuperbaseService.SaveUser(model);
                    var response2 = await _supabaseClient.From<UserSuperbase>().Insert(model);
                    if(response2 == null)
                    {
                        await Shell.Current.DisplayAlert("Error", "User not created", "OK");
                    }
                    await Shell.Current.DisplayAlert("Account Registered", "Sign Up Completed. You can now sign in with your credentials.", "OK");
                    await Shell.Current.Navigation.PopAsync();
                }
                catch (Exception e)
                {
                    await Shell.Current.DisplayAlert("Error", e.Message, "OK");
                }
            }
            catch (Exception e)
            {
                await Shell.Current.DisplayAlert("Error", e.Message, "OK");
            }
        }
    }
}
