using Mobile_Application.ViewModels;

namespace Mobile_Application.Views;

public partial class AddDogPage : ContentPage
{
	public AddDogPage()
	{
		InitializeComponent();
	}

	void EntryName_TextChanged(Object sender, TextChangedEventArgs e)
	{
        var viewModel = (BindingContext as AddDogPageViewModel);
        if (string.IsNullOrEmpty(e.NewTextValue))
        {
            viewModel.DogName = "";
        }
        else
        {
            try
            {
                viewModel.DogName = e.NewTextValue;
            }
            catch (Exception)
            {
                viewModel.DogName = "";
            }
        }
    }

    void EntrySize_TextChanged(Object sender, TextChangedEventArgs e)
    {
        var viewModel = (BindingContext as AddDogPageViewModel);
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

    void EntryBreed_TextChanged(Object sender, TextChangedEventArgs e)
    {
        var viewModel = (BindingContext as AddDogPageViewModel);
        if (string.IsNullOrEmpty(e.NewTextValue))
        {
            viewModel.DogBreed = "";
        }
        else
        {
            try
            {
                viewModel.DogBreed = e.NewTextValue;
            }
            catch (Exception)
            {
                viewModel.DogBreed = "";
            }
        }
    }

    void EntryColour_TextChanged(Object sender, TextChangedEventArgs e)
    {
        var viewModel = (BindingContext as AddDogPageViewModel);
        if (string.IsNullOrEmpty(e.NewTextValue))
        {
            viewModel.DogColour = "";
        }
        else
        {
            try
            {
                viewModel.DogColour = e.NewTextValue;
            }
            catch (Exception)
            {
                viewModel.DogColour = "";
            }
        }
    }

    void EntryAge_TextChanged(Object sender, TextChangedEventArgs e)
    {
        var viewModel = (BindingContext as AddDogPageViewModel);
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

}