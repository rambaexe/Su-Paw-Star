using Mobile_Application.ViewModels;

namespace Mobile_Application.Views;

public partial class YearsCalculatorPage : ContentPage
{
	public YearsCalculatorPage()
	{
		InitializeComponent();
	}

    void EntryAge_TextChanged(Object sender, TextChangedEventArgs e)
    {
        var viewModel = (BindingContext as YearsCalculatorViewModel);
        if (string.IsNullOrEmpty(e.NewTextValue))
        {
            viewModel.DogAge = 0;
        }
        else
        {
            try
            {
                //convert to float
                viewModel.DogAge = Convert.ToSingle(e.NewTextValue);
            }
            catch (Exception)
            {
                viewModel.DogAge = 0;
            }
        }
    }

    void EntrySize_TextChanged(Object sender, TextChangedEventArgs e)
    {
        var viewModel = (BindingContext as YearsCalculatorViewModel);
        if (string.IsNullOrEmpty(e.NewTextValue))
        {
            viewModel.DogSize = "";
        }
        else
        {
            try
            {
                viewModel.DogSize = e.NewTextValue;
                // make it lowercase
                viewModel.DogSize = viewModel.DogSize.ToLower();
            }
            catch (Exception)
            {
                viewModel.DogSize = "";
            }

        }
    }
}