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
    public class UpdateDogPageViewModel : BaseViewModel
    {
        public ICommand UpdateDogCommand { get; set; }

        // UserName is Model.User.Instance.FirstandLastName
        public string UserName
        {
            get => Models.User.Instance.FirstandLastName;
            set => Set(value);
        }

        public string DogName
        {
            get => Get<string>();
            set
            {
                Set(value);
                (UpdateDogCommand as Command).ChangeCanExecute();
            }
        }

        public string DogColour
        {
            get => Get<string>();
            set
            {
                Set(value);
                (UpdateDogCommand as Command).ChangeCanExecute();
            }
        }

        public string DogBreed
        {
            get => Get<string>();
            set
            {
                Set(value);
                (UpdateDogCommand as Command).ChangeCanExecute();
            }
        }

        public float DogAge
        {
            get => Get<float>();
            set
            {
                Set(value);
                (UpdateDogCommand as Command).ChangeCanExecute();
            }
        }

        public string DogSize
        {
            get => Get<string>();
            set
            {
                Set(value);
                (UpdateDogCommand as Command).ChangeCanExecute();
            }
        }

        public UpdateDogPageViewModel(ViewModelContext context) : base(context)
        {
            UpdateDogCommand = new Command(execute: UpdateDog, canExecute: UpdateDogShouldBeEnabled);
        }

        // show current dog on appearing
        public override void OnAppearing()
        {
            base.OnAppearing();
            DogName = Models.CurrentDog.Instance.Name;
            DogBreed = Models.CurrentDog.Instance.Breed;
            DogColour = Models.CurrentDog.Instance.Colour;
            DogAge = Models.CurrentDog.Instance.Age;
            DogSize = Models.CurrentDog.Instance.Size;
        }

        private void UpdateDog()
        {
            // create dog using DogBuilder and DogFactory
            Dog currentdog;
            if (String.IsNullOrEmpty(DogSize)) DogSize = "";
            if (String.IsNullOrEmpty(DogColour)) DogColour = "";
            if (String.IsNullOrEmpty(DogBreed)) DogBreed = "";
            if (String.IsNullOrEmpty(DogName)) DogName = "";

            switch (DogSize.ToLower())
            {
                case "small":
                    currentdog = DogFactory.CreateSmallDog(DogName, DogBreed, DogAge, DogColour);
                    break;
                case "medium":
                    currentdog = DogFactory.CreateMediumDog(DogName, DogBreed, DogAge, DogColour);
                    break;
                case "large":
                    currentdog = DogFactory.CreateLargeDog(DogName, DogBreed, DogAge, DogColour);
                    break;
                case "giant":
                    currentdog = DogFactory.CreateGiantDog(DogName, DogBreed, DogAge, DogColour);
                    break;
                case "":
                    // display error message
                    App.Current.MainPage.DisplayAlert("Error", "Invalid dog size", "OK");
                    return;
                default:
                    // display error message
                    App.Current.MainPage.DisplayAlert("Error", "Invalid dog size", "OK");
                    return;
            }

            // create model to insert to supabase
            // create dog model
            // make strings lowercase
            // first letter of each word in name is uppercase
            // first letter of each word in breed is uppercase 
            currentdog.DogName = currentdog.DogName.ToLower();
            currentdog.DogName = System.Threading.Thread.CurrentThread.CurrentCulture.TextInfo.ToTitleCase(currentdog.DogName);
            currentdog.DogBreed = currentdog.DogBreed.ToLower();
            currentdog.DogBreed = System.Threading.Thread.CurrentThread.CurrentCulture.TextInfo.ToTitleCase(currentdog.DogBreed);

            UsersDogsSuperbase dogsupabase = new UsersDogsSuperbase()
            {
                Dog_Name = currentdog.DogName,
                Dog_Colour = currentdog.DogColour.ToLower(),
                Dog_Breed = currentdog.DogBreed,
                Dog_Age = currentdog.DogAge,
                Dog_Size = currentdog.DogSize.ToLower(),
                User_Id = Models.User.Instance.ID,
                Id = Models.CurrentDog.Instance.Id
            };

            Console.WriteLine(dogsupabase.Dog_Name);
            Console.WriteLine(dogsupabase.Dog_Breed);
            Console.WriteLine(dogsupabase.Dog_Colour);
            Console.WriteLine(dogsupabase.Dog_Age);
            Console.WriteLine(dogsupabase.Dog_Size);
            Console.WriteLine(dogsupabase.User_Id);
            Console.WriteLine(dogsupabase.Id);

            // create supabase client
            var supabaseClient = new Supabase.Client(Constants.SupabaseUrl, Constants.SupabaseAnonKey);

            // create service
            try
            {
                var service = new SupabaseFacadeService(supabaseClient);
                var response = service.UpdateDog(dogsupabase);

                if (response == null)
                {
                    // show alert message window with error
                    AppShell.Current.DisplayAlert("Error", "Failed to update dog", "OK");
                }
                else
                {
                    // show successfull message
                    AppShell.Current.DisplayAlert("Success", "Dog updated successfully", "OK");
                    Shell.Current.Navigation.PopAsync();
                }

            }
            catch (Exception e)
            {
                // show alert message window with error
                AppShell.Current.DisplayAlert("Error", e.Message, "OK");
            }
        }

        private bool UpdateDogShouldBeEnabled()
        {
            var dogagerequirements = DogAge >= 0 && DogAge <= 16;
            // size is small, medium, large or giant
            var sizerequirements = !String.IsNullOrEmpty(DogSize) && (DogSize == "small" || DogSize == "medium" || DogSize == "large" || DogSize == "giant");
            var namerequirements = !String.IsNullOrEmpty(DogName);
            return namerequirements && namerequirements;
        }
    }
}
