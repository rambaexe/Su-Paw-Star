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

        public struct CurrentWalkswithDateSeparated
        {
            public string Year { get; set; }
            public string Month { get; set; }
            public string Day { get; set; }
            public string Time { get; set; }
        }

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
                    Console.WriteLine("Date:" + walk.Walk_Date);
                    Console.WriteLine("Time:" + walk.Walk_Time);
                    CurrentWalks.Add(walk);
                }
            }

            // date is in the format mm/dd/yyyy
            // get year, month, day from time
            foreach (var walk in CurrentWalks)
            {
                var date = walk.Walk_Date.Split('/');
                var year = date[2];
                var month = date[0];
                var day = date[1];
                Console.WriteLine("Year: " + year);
                Console.WriteLine("Month: " + month);
                Console.WriteLine("Day: " + day);
            }

            // sort the dogs by year, month, day and then time
            for(int i=0; i<CurrentWalks.Count - 1; i++) 
            {
                for(int j=i+1; j<CurrentWalks.Count; j++)
                {
                    var date1 = CurrentWalks[i].Walk_Date.Split('/');
                    var year1 = date1[2];
                    var month1 = date1[0];
                    var day1 = date1[1];
                    var time1 = CurrentWalks[i].Walk_Time;

                    var date2 = CurrentWalks[j].Walk_Date.Split('/');
                    var year2 = date2[2];
                    var month2 = date2[0];
                    var day2 = date2[1];
                    var time2 = CurrentWalks[j].Walk_Time;

                    if (year1 == year2)
                    {
                        if (month1 == month2)
                        {
                            if (day1 == day2)
                            {
                                if (CurrentWalks[i].Walk_Time.CompareTo(CurrentWalks[j].Walk_Time) > 0)
                                {
                                    var temp = CurrentWalks[i];
                                    CurrentWalks[i] = CurrentWalks[j];
                                    CurrentWalks[j] = temp;
                                }
                            }
                            else if (day1.CompareTo(day2) > 0)
                            {
                                var temp = CurrentWalks[i];
                                CurrentWalks[i] = CurrentWalks[j];
                                CurrentWalks[j] = temp;
                            }
                        }
                        else if (month1.CompareTo(month2) > 0)
                        {
                            var temp = CurrentWalks[i];
                            CurrentWalks[i] = CurrentWalks[j];
                            CurrentWalks[j] = temp;
                        }
                    }
                    else if (year1.CompareTo(year2) > 0)
                    {
                        var temp = CurrentWalks[i];
                        CurrentWalks[i] = CurrentWalks[j];
                        CurrentWalks[j] = temp;
                    }
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
