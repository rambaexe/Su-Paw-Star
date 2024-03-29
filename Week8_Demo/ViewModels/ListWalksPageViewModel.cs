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

namespace Mobile_Application.ViewModels
{
    public class ListWalksPageViewModel : BaseViewModel
    {
        private readonly SupabaseFacadeService _supabaseFacadeService;

        public ICommand DeleteCommand { get; set; }
        public ICommand UpdateWalkCommand { get; set; }

        public string UserName
        {
            get => Models.User.Instance.FirstandLastName;
            set => Set(value);
        }

        public ObservableCollection<UsersDogsSuperbase> Dogs { get; set; } = new();
        public ObservableCollection<UsersDogsSuperbase> CurrentDogs { get; set; } = new();

        public ObservableCollection<WalksSupabase> Walks { get; set; } = new();
        public ObservableCollection<WalksSupabase> CurrentWalks { get; set; } = new();

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

        public ListWalksPageViewModel(ViewModelContext context) : base(context)
        {
            DeleteCommand = new Command<WalksSupabase>(async (walk) => await DeleteWalk(walk));

            UpdateWalkCommand = new Command<WalksSupabase>(async (walk) => await UpdateWalk(walk));
        }

        private async Task UpdateWalk(WalksSupabase walk)
        {
            var result = await Shell.Current.DisplayAlert("Add walk", $"Do you want to edit \"{walk.Walk_Title}\"?", "Yes", "No");
            if (result is true)
            {
                // create current walk
                Models.CurrentWalk.Instance.Clear();
                Models.CurrentWalk.Instance.Id = walk.Walk_Id;
                Models.CurrentWalk.Instance.Title = walk.Walk_Title;
                Models.CurrentWalk.Instance.Date = walk.Walk_Date;
                Models.CurrentWalk.Instance.Time = walk.Walk_Time;
                Models.CurrentWalk.Instance.Description = walk.Walk_Description;
                Models.CurrentWalk.Instance.Rating = walk.Dog_Rating;


                await Shell.Current.GoToAsync("/UpdateWalkPage");

            }

        }

        private async Task DeleteWalk(WalksSupabase walk)
        {
            var result = await Shell.Current.DisplayAlert("Delete", $"Are you sure you want to delete \"{walk.Walk_Title}\"?", "Yes", "No");

            if (result is true)
            {
                var _supabaseclient = new Supabase.Client(Constants.SupabaseUrl, Constants.SupabaseAnonKey);
                var _supabaseFacadeService = new SupabaseFacadeService(_supabaseclient);
                try
                {
                    await _supabaseFacadeService.DeleteWalk(walk.Walk_Id);
                    await FetchAllWalks();
                }
                catch (Exception e)
                {
                    AppShell.Current.DisplayAlert("Error", "Failed to delete walk", "OK");
                    Console.WriteLine(e.Message);
                }
            }
        }

        public override async void OnAppearing()
        {
            base.OnAppearing();
            try
            {
                await FetchAllWalks();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private async Task FetchAllWalks()
        {
            Walks.Clear();
            CurrentWalks.Clear();

            var _supabaseclient = new Supabase.Client(Constants.SupabaseUrl, Constants.SupabaseAnonKey);
            var _supabaseFacadeService = new SupabaseFacadeService(_supabaseclient);
            var result = await _supabaseFacadeService.ReadWalks();
            // get results from the database and add them to the Dogs collection


            if (result.Any())
            {
                foreach (var walk in result)
                {
                    Walks.Add(walk);
                }
            }

            // filter the dogs collection to only show the dogs that belong to the current user
            Console.WriteLine("User ID: " + Models.User.Instance.ID);
            foreach (var walk in Walks)
            {
                Console.WriteLine("Walk: " + walk.Walk_Title);
                if (walk.User_Id == Models.User.Instance.ID)
                {
                    CurrentWalks.Add(walk);
                }
            }

            if (CurrentWalks.Count > 0)
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
