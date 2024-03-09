using System.Windows.Input;

namespace Mobile_Application.ViewModels
{
    public class ClassicMauiPageViewModel : BaseViewModelMoreSimple
    {
        private int _count;
        public ICommand AddToCounterCommand { get; set; }
        
        public string Test { get; set; }
        public int Count
        {
            get => _count;
            set
            {
                _count = value;
                OnPropertyChanged(nameof(Count));
            }
        }

        public ClassicMauiPageViewModel()
        {
            AddToCounterCommand = new Command(execute: IncreaseCount);

        }

        private void IncreaseCount()
        {
            Count++;
        }
    }
}

