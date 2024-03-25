using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using MauiMicroMvvm;
using Mobile_Application.Interfaces;

namespace Mobile_Application.ViewModels
{
    public class YearsCalculatorViewModel : BaseViewModel
    {
        public ICommand CalculateDogYearsCommand { get; set; }

        public float DogAge
        {
            get => Get<float>(); 
            set
            {
                Set(value);
                (CalculateDogYearsCommand as Command).ChangeCanExecute();
            }
        }

        public string DogSize
        {
            get => Get<string>();
            set
            {
                Set(value);
                (CalculateDogYearsCommand as Command).ChangeCanExecute();
            }
        }

        public float HumanAge
        {
            get => Get<float>();
            set => Set(value);
        }

        public string AgeCategory
        {
            get => Get<string>();
            set => Set(value);
        }

        public YearsCalculatorViewModel(ViewModelContext context) : base(context)
        {
            CalculateDogYearsCommand = new Command(execute: CalculateDogYears, canExecute: CalculateYearsShouldBeEnabled);
        }

        private void CalculateDogYears()
        {
            //Small Breeds (up to 20 lbs):
            //Up to 2 years old: Human_Years = Dog_Years * 12
            //After 2 years: Human_Years = 24 + (Dog_Years - 2) * 4
            //
            //Medium Breeds(21 - 50 lbs):
            //Up to 2 years old: Human_Years = Dog_Years * 10.5
            //After 2 years: Human_Years = 21 + (Dog_Years - 2) * 5
            //
            //Large Breeds(51 - 90 lbs):
            //Up to 2 years old: Human_Years = Dog_Years * 9
            //After 2 years: Human_Years = 18 + (Dog_Years - 2) * 6
            //
            //Giant Breeds(over 90 lbs):
            //Up to 2 years old: Human_Years = Dog_Years * 8
            //After 2 years: Human_Years = 16 + (Dog_Years - 2) * 7

            // Age category
            //Baby: 0 - 2 years
            //Toddler: 2 - 4 years
            //Child: 5 - 12 years
            //Teenager: 13 - 19 years
            //Young Adult: 20 - 30 years
            //Adult: 30 - 40 years
            //Middle Age: 40 - 59 years
            //Senior Adult: 60 + years

            if (DogSize == "small")
            {
                if (DogAge <= 2)
                {
                    HumanAge = DogAge * 12;
                }
                else
                {
                    HumanAge = 24 + (DogAge - 2) * 4;
                }
            }
            else if (DogSize == "medium")
            {
                if (DogAge <= 2)
                {
                    HumanAge = DogAge * 10.5f;
                }
                else
                {
                    HumanAge = 21 + (DogAge - 2) * 5;
                }
            }
            else if (DogSize == "large")
            {
                if (DogAge <= 2)
                {
                    HumanAge = DogAge * 9;
                }
                else
                {
                    HumanAge = 18 + (DogAge - 2) * 6;
                }
            }
            else if (DogSize == "giant")
            {
                if (DogAge <= 2)
                {
                    HumanAge = DogAge * 8;
                }
                else
                {
                    HumanAge = 16 + (DogAge - 2) * 7;
                }
            }
            // round to 2 decimal places
            HumanAge = (float)Math.Round(HumanAge, 2);

            // Age category - switch statement
            AgeCategory = HumanAge switch
            {
                < 2 => "Baby",
                >= 2 and < 4 => "Toddler",
                >= 4 and < 13 => "Child",
                >= 13 and < 20 => "Teenager",
                >= 20 and < 30 => "Young Adult",
                >= 30 and < 40 => "Adult",
                >= 40 and < 60 => "Middle Age",
                >=60 => "Senior Adult",
                _ => "Invalid Age Category"
            };
            
        }

        private bool CalculateYearsShouldBeEnabled()
        {
            var dogagerequirements = DogAge != 0 && DogAge <= 16;
            // size is small, medium, large or giant
            var sizerequirements = DogSize != "" && (DogSize == "small" || DogSize == "medium" || DogSize == "large" || DogSize == "giant");
            return dogagerequirements && sizerequirements;
        }

    }
}
