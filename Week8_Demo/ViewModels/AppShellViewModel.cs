using System.Windows.Input;
using MauiMicroMvvm;
using Mobile_Application.Interfaces;

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
        Shell.Current.GoToAsync("//login");
    }
}