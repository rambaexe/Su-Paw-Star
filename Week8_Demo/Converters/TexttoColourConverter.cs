using System.Globalization;

namespace Mobile_Application.Converters
{
    public class TexttoColourConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            // converter for human age: based on number, return colour based on age category

            // age categories: 
            //Baby: 0 - 2 years
            //Toddler: 2 - 4 years
            //Child: 5 - 12 years
            //Teenager: 13 - 19 years
            //Young Adult: 20 - 39 years
            //Middle Age: 40 - 59 years
            //Senior Adult: 60 + years

            var curentValue = (string)value;
            return curentValue switch
            {
                "Baby" => Colors.Blue,
                "Toddler" => Colors.Green,
                "Child" => Colors.Yellow,
                "Teenager" => Colors.Orange,
                "Young Adult" => Colors.Purple,
                "Middle Age" => Colors.Pink,
                "Senior Adult" => Colors.Red,
                _ => Colors.Red
            };
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}

