namespace Mobile_Application.Views;

public partial class UpdateWalkPage : ContentPage
{
	public UpdateWalkPage()
	{
		InitializeComponent();
	}

    public void OnSliderValueChanged(object sender, ValueChangedEventArgs e)
    {
        var newStep = Math.Round(e.NewValue);

        ((Slider)sender).Value = newStep;
    }
}