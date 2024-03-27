using System.Windows.Input;
using MauiMicroMvvm;
using Mobile_Application.Interfaces;
using Mobile_Application.Models;

namespace Mobile_Application.ViewModels;

public class AppShellViewModel : BaseViewModel
{
    private readonly IAppState _state;
    public ICommand LogOutCommand { get; set; }
    
    

    public AppShellViewModel(ViewModelContext context, IAppState state) : base(context)
    {
        _state = state;
        LogOutCommand = new Command(ExecuteLogout);
        
    }

    private void ExecuteLogout()
    {
        _state.CurrentUser = null;
        // delete user from local storage
        Models.User.Instance.Clear();
        Shell.Current.GoToAsync("//login");
    }
}