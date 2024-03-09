using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Mobile_Application.ViewModels;

public class BaseViewModelMoreSimple : INotifyPropertyChanged
{
    public event PropertyChangedEventHandler PropertyChanged;

    protected void OnPropertyChanged([CallerMemberName] string propertyName = "")
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }

    public BaseViewModelMoreSimple()
    {
    }
}