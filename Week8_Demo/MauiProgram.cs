using Microsoft.Extensions.Logging;
using Mobile_Application.Interfaces;
using Mobile_Application.Services;
using Mobile_Application.ViewModels;
using Mobile_Application.Views;

namespace Mobile_Application;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiMicroMvvm<AppShell>(
                "Resources/Styles/Colors.xaml",
                "Resources/Styles/Styles.xaml")
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
            });

#if DEBUG
        builder.Logging.AddDebug();
#endif
        builder.Services
            .MapView<AppShell, AppShellViewModel>()
            .MapView<LoginPage, LoginPageViewModel>()
            .MapView<RegisterPage, RegisterPageViewModel>()
            .MapView<YearsCalculatorPage, YearsCalculatorViewModel>()
            .MapView<AddDogPage,AddDogPageViewModel>()
            .MapView<ListDogsPage, ListDogsPageViewModel>()
            .MapView<AddWalkPage, AddWalkPageViewModel>()
            .MapView<ListWalksPage, ListWalksPageViewModel>()
            .MapView<UpdateWalkPage, UpdateWalkPageViewModel>()
            .MapView<UpdateDogPage, UpdateDogPageViewModel>();

        builder.Services.AddSingleton<BaseViewModel>();
        builder.Services.AddSingleton<BaseViewModelMoreSimple>();

        return builder.Build();
    }
}