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
    public class ListDogsPageViewModel : BaseViewModel
    {
        public ListDogsPageViewModel(ViewModelContext context) : base(context)
        {
           
        }
    }
}
