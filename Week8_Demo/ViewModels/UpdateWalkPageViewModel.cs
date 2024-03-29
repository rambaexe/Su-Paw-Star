using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using MauiMicroMvvm;
using Mobile_Application.Interfaces;
using Mobile_Application.Models;
using Mobile_Application.Services;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;

namespace Mobile_Application.ViewModels
{
    public class UpdateWalkPageViewModel : BaseViewModel
    {
        public ICommand UpdateWalkCommand { get; set; }

        // UserName is Model.User.Instance.FirstandLastName
        public string UserName
        {
            get => Models.User.Instance.FirstandLastName;
            set => Set(value);
        }

        public string DogNameVM
        {
            get => Models.CurrentDog.Instance.Name;
            set => Set(value);
        }

        public string WalkDate
        {
            get => Get<string>();
            set => Set(value);
        }

        public TimeSpan WalkTime
        {
            get => Get<TimeSpan>();
            set => Set(value);
        }

        public string WalkDescription
        {
            get => Get<string>();
            set => Set(value);
        }

        public int DogRating
        {
            get => Get<int>();
            set => Set(value);
        }

        public UpdateWalkPageViewModel(ViewModelContext context) : base(context)
        {
            UpdateWalkCommand = new Command(execute: UpdateWalk);
        }

        public override void OnAppearing()
        {
            base.OnAppearing();
            WalkDescription = Models.CurrentWalk.Instance.Description;
            DogRating = Models.CurrentWalk.Instance.Rating;
        }

        private void UpdateWalk()
        {
            try
            {
                if (WalkDate == null)
                {
                    //set to today
                    WalkDate = DateTime.Now.ToString();
                }
                // delete last 3 characters of WalkDate
                var time = WalkTime.ToString();
                if (time.Length > 3)
                {
                    time = time.Substring(0, time.Length - 3);
                }
                var date = WalkDate.Split(' ')[0];

                // write data to console
                Console.WriteLine($"Dog Name: {DogNameVM}");
                Console.WriteLine($"Walk Date: {date}");
                Console.WriteLine($"Walk Time: {time}");
                Console.WriteLine($"Walk Description: {WalkDescription}");
                Console.WriteLine($"Dog Rating: {DogRating}");

                var title = $"Walk with {DogNameVM} 🐕";

                // create walk object
                var walk = new WalksSupabase()
                {
                    Walk_Id = Models.CurrentWalk.Instance.Id,
                    User_Id = Models.User.Instance.ID,
                    Dog_Id = Models.CurrentDog.Instance.Id,
                    Walk_Date = date,
                    Walk_Time = time,
                    Walk_Description = WalkDescription,
                    Dog_Rating = DogRating,
                    Walk_Title = title
                };

                try
                {
                    var _supabaseclient = new Supabase.Client(Constants.SupabaseUrl, Constants.SupabaseAnonKey);
                    var service = new SupabaseFacadeService(_supabaseclient);
                    var response = service.UpdateWalk(walk);

                    if (response != null)
                    {
                        Shell.Current.DisplayAlert("Success", "Walk updated.", "OK");
                        Shell.Current.Navigation.PopAsync();
                    }
                    else
                    {
                        Shell.Current.DisplayAlert("Error", "Failed to update walk", "OK");
                    }
                }
                catch (Exception e)
                {
                    Shell.Current.DisplayAlert("Error", e.Message, "OK");
                    return;
                }

            }
            catch (Exception e)
            {
                Shell.Current.DisplayAlert("Error", e.Message, "OK");
                return;
            }
        }


        public void OnSliderValueChanged(object sender, ValueChangedEventArgs e)
        {
            var newStep = Math.Round(e.NewValue);

            ((Slider)sender).Value = newStep;
        }
    }
}
