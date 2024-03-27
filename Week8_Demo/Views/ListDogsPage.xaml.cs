namespace Mobile_Application.Views;

public partial class ListDogsPage : ContentPage
{
	public ListDogsPage()
	{
		InitializeComponent();
	}

    private async void OnBackButtonClicked(object sender, EventArgs e)
    {
        await Navigation.PopAsync();
    }
}