namespace Mobile_Application.Views;

public partial class LoginPage : ContentPage
{
    public LoginPage(ViewModels.LoginPageViewModel viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
    }

    void Email_TextChanged(System.Object sender, Microsoft.Maui.Controls.TextChangedEventArgs e)
    {
        var viewModel = (BindingContext as ViewModels.LoginPageViewModel);
        viewModel.Email = e.NewTextValue;
    }

    void Password_TextChanged(System.Object sender, Microsoft.Maui.Controls.TextChangedEventArgs e)
    {
        var viewModel = (BindingContext as ViewModels.LoginPageViewModel);
        viewModel.Password = e.NewTextValue;
    }
}
