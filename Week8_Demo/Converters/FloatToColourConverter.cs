using System.Globalization;
using System.Reflection;

namespace Mobile_Application.Converters
{
    public class FloatToColourConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            // converter for human age: based on number, return colour based on age category

            // set colours in a gradient from red to green based on the categories

            // age categories: 
            //Baby: 0 - 2 years
            //Toddler: 2 - 4 years
            //Child: 5 - 12 years
            //Teenager: 13 - 19 years
            //Young Adult: 20 - 30 years
            //Adult: 30 - 40 years
            //Middle Age: 40 - 59 years
            //Senior Adult: 60 + years

            var currentValue = (float)value;
            return currentValue switch
            {
                0 => Colors.Black, // Baby: 0 - 2 years
                < 2 => Colors.LightBlue, // Baby: 0 - 2 years
                >= 2 and < 5 => Colors.LightGreen, // Toddler: 2 - 4 years
                >= 5 and < 13 => Colors.Green, // Child: 5 - 12 years
                >= 13 and < 20 => Colors.YellowGreen, // Teenager: 13 - 19 years
                >= 20 and < 30 => Colors.Gold, // Young Adult: 20 - 30 years
                >= 30 and < 40 => Colors.Orange, // Adult: 30 - 40 years
                >= 40 and < 60 => Colors.Red, // Middle Age: 40 - 59 years
                >= 60 => Colors.DarkRed, // Senior Adult: 60 + years
                _ => Colors.Black // not valid
            };
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}

