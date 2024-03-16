using System.Windows.Input;
using MauiMicroMvvm;
using Mobile_Application.Interfaces;

namespace Mobile_Application.ViewModels
{
    public class LoginPageViewModel : BaseViewModel
    {
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

        public LoginPageViewModel(ViewModelContext context, IAppState appState): base(context)
        {
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
            
            _appState.CurrentUser = new Models.User()
            {
                Email = Email,
                Password = Password
            };
            
            await Shell.Current.GoToAsync("//BmiPage");
        }

        private Command validateCommand;

        private void Validate()
        {
            //some validation
        }
    }
}

