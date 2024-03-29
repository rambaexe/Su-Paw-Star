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
using System.Collections.ObjectModel;
using Mobile_Application.Services;
using Mobile_Application.Models;
using Mobile_Application.Interfaces;

namespace Mobile_Application.ViewModels
{
    public class ListDogsPageViewModel : BaseViewModel
    {
        
        private readonly SupabaseFacadeService _supabaseFacadeService;

        public ICommand DeleteCommand { get; set; }
        public ICommand AddWalkCommand { get; set; }
        public ICommand EditCommand { get; set;}


        public string UserName
        {
            get => Models.User.Instance.FirstandLastName;
            set => Set(value);
        }

        public ObservableCollection<UsersDogsSuperbase> Dogs { get; set; } = new();
        public ObservableCollection<UsersDogsSuperbase> CurrentDogs { get; set; } = new();

        public bool ShouldShowDefaultText
        {
            get => Get<bool>();
            set => Set(value);
        }
        public bool ShouldShowPopulatedLayout
        {
            get => Get<bool>();
            set => Set(value);
        }

        public ListDogsPageViewModel(ViewModelContext context) : base(context)
        {
            DeleteCommand = new Command<UsersDogsSuperbase>(async (dog) => await DeleteDog(dog));
            AddWalkCommand = new Command<UsersDogsSuperbase>(async (dog) => await AddWalk(dog));
            EditCommand = new Command<UsersDogsSuperbase>(async (dog) => await EditDog(dog));
        }

        private async Task EditDog(UsersDogsSuperbase dog)
        {
            var result = await Shell.Current.DisplayAlert("Edit", $"Do you want to edit \"{dog.Dog_Name}\"?", "Yes", "No");
            if (result is true)
            {
                // create current dog
                Models.CurrentDog.Instance.Clear();
                Models.CurrentDog.Instance.Id = dog.Id;
                Models.CurrentDog.Instance.Name = dog.Dog_Name;
                Models.CurrentDog.Instance.Breed = dog.Dog_Breed;
                Models.CurrentDog.Instance.Colour = dog.Dog_Colour;
                Models.CurrentDog.Instance.Age = dog.Dog_Age;
                Models.CurrentDog.Instance.Size = dog.Dog_Size;

                await Shell.Current.GoToAsync("/UpdateDogPage");
            }
        }

        private async Task AddWalk(UsersDogsSuperbase dog)
        {
            var result = await Shell.Current.DisplayAlert("Add walk", $"Do you want to add a walk with \"{dog.Dog_Name}\"?", "Yes", "No");
            if (result is true)
            {
                // create current dog
                Models.CurrentDog.Instance.Clear();
                Models.CurrentDog.Instance.Id = dog.Id;
                Models.CurrentDog.Instance.Name = dog.Dog_Name;

                await Shell.Current.GoToAsync("/AddWalkPage");

            }

        }

        private async Task DeleteDog(UsersDogsSuperbase dog)
        {
            var result = await Shell.Current.DisplayAlert("Delete", $"Are you sure you want to delete \"{dog.Dog_Name}\"?", "Yes", "No");

            if (result is true)
            {
                var _supabaseclient = new Supabase.Client(Constants.SupabaseUrl, Constants.SupabaseAnonKey);
                var _supabaseFacadeService = new SupabaseFacadeService(_supabaseclient);
                try
                {
                    await _supabaseFacadeService.DeleteDog(dog.Id);
                    await FetchAllDogs();
                }
                catch (Exception e)
                {
                    AppShell.Current.DisplayAlert("Error", "Failed to delete dog", "OK");
                    Console.WriteLine(e.Message);
                }
            }
        }
        
        public override async void OnAppearing()
        {
            base.OnAppearing();
            try
            {
                await FetchAllDogs();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private async Task FetchAllDogs()
        {
            Dogs.Clear();
            CurrentDogs.Clear();
            var _supabaseclient = new Supabase.Client(Constants.SupabaseUrl, Constants.SupabaseAnonKey);
            var _supabaseFacadeService = new SupabaseFacadeService(_supabaseclient);
            var result = await _supabaseFacadeService.ReadDogs();
            // get results from the database and add them to the Dogs collection
            
            
            if(result.Any())
            {
                foreach (var dog in result)
                {
                    Dogs.Add(dog);
                }
            }

            // filter the dogs collection to only show the dogs that belong to the current user
            Console.WriteLine("User ID: " + Models.User.Instance.ID);
            foreach (var dog in Dogs)
            {
                Console.WriteLine("Dog's User ID: " + dog.User_Id);
                if (dog.User_Id == Models.User.Instance.ID)
                {
                    CurrentDogs.Add(dog);
                }
            }

            if (CurrentDogs.Count > 0)
            {
                ShouldShowPopulatedLayout = true;
                ShouldShowDefaultText = false;
            }
            else
            {
                ShouldShowPopulatedLayout = false;
                ShouldShowDefaultText = true;
            }
        }
    }
}
