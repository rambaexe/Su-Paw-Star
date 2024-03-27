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
    public class AddDogPageViewModel : BaseViewModel
    {
        public ICommand AddDogCommand { get; set; }

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
                (AddDogCommand as Command).ChangeCanExecute();
            }
        }

        public string DogColour
        {
            get => Get<string>();
            set
            {
                Set(value);
                (AddDogCommand as Command).ChangeCanExecute();
            }
        }

        public string DogBreed
        {
            get => Get<string>();
            set
            {
                Set(value);
                (AddDogCommand as Command).ChangeCanExecute();
            }
        }

        public float DogAge
        {
            get => Get<float>();
            set
            {
                Set(value);
                (AddDogCommand as Command).ChangeCanExecute();
            }
        }

        public string DogSize
        {
            get => Get<string>();
            set
            {
                Set(value);
                (AddDogCommand as Command).ChangeCanExecute();
            }
        }

        public AddDogPageViewModel(ViewModelContext context) : base(context)
        {
           AddDogCommand = new Command(execute: AddDog, canExecute: AddDogShouldBeEnabled);
        }

        private void AddDog()
        {
            // create dog using DogBuilder and DogFactory
            Dog currentdog;
            if(String.IsNullOrEmpty(DogSize)) DogSize = "";
            if(String.IsNullOrEmpty(DogColour)) DogColour = "";
            if(String.IsNullOrEmpty(DogBreed)) DogBreed = "";
            if(String.IsNullOrEmpty(DogName)) DogName = "";
            
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

            UsersDogsSuperbase dogsupabase = new UsersDogsSuperbase()
            {
                User_Id = Models.User.Instance.ID,
                Dog_Name = currentdog.DogName,
                Dog_Colour = currentdog.DogColour.ToLower(),
                Dog_Breed = currentdog.DogBreed.ToLower(),
                Dog_Age = currentdog.DogAge,
                Dog_Size = currentdog.DogSize.ToLower()
            };

            // create supabase client
            var supabaseClient = new Supabase.Client(Constants.SupabaseUrl, Constants.SupabaseAnonKey);

            // create service
            try
            {
                var service = new SupabaseFacadeService(supabaseClient);
                var response = service.CreateDog(dogsupabase);

                if (response == null)
                {
                    // show alert message window with error
                    AppShell.Current.DisplayAlert("Error", "Failed to add dog", "OK");
                }
                else
                {
                    // show successfull message
                    AppShell.Current.DisplayAlert("Success", "Dog added successfully", "OK");
                }
                
            }
            catch (Exception e)
            {
                // show alert message window with error
                AppShell.Current.DisplayAlert("Error", e.Message, "OK");
            }
        }

        private bool AddDogShouldBeEnabled()
        {
            var dogagerequirements = DogAge >= 0 && DogAge <= 16;
            // size is small, medium, large or giant
            var sizerequirements = !String.IsNullOrEmpty(DogSize)&& (DogSize == "small" || DogSize == "medium" || DogSize == "large" || DogSize == "giant");
            var namerequirements = !String.IsNullOrEmpty(DogName);
            return namerequirements && namerequirements;
        }

    }
}
