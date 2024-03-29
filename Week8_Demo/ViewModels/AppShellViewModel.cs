using System.Windows.Input;
using MauiMicroMvvm;
using Mobile_Application.Interfaces;
using Mobile_Application.Models;

namespace Mobile_Application.ViewModels;

public class AppShellViewModel : BaseViewModel
{
    public ICommand LogOutCommand { get; set; }

    public string UserName
    {
        get => Models.User.Instance.FirstandLastName;
        set => Set(value);
    }

    public AppShellViewModel(ViewModelContext context, IAppState state) : base(context)
    {
        LogOutCommand = new Command(ExecuteLogout);
    }

    private void ExecuteLogout()
    {
        // delete user from local storage
        Models.User.Instance.Clear();
        Shell.Current.GoToAsync("//login");
    }
}