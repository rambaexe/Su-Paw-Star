# 6002CEM_TeodorAndreiRamba
# YouTube Link
https://www.youtube.com/watch?v=ZTOFpX9hGFE
# .ReadMe for Mobile Application
“Su-paw-star“ is a mobile application designed to track walks with dogs. The motivation behind it stems from the deep connection between dogs and humans. As a dog owner myself, one of my favourite activities is taking my dog for walks. Thus, I always want to record each walk to remind myself of the fun times I had with my dog. Keeping a record of my dog’s behaviour on walks is crucial to me because I want to take care of him the best possible way and track his well-being. 
“Su-paw-star” allows users to add dogs to their list alongside their age, breed, size, name and colours. Users can also keep track of the walks they've taken with their dogs, the way the dogs behaved throughout the walk, and the time and date of the walk using this app. The application is created using the MVVM architecture.
The application includes the following features:
## Feature 1: Login and Register Flow
Upon opening, the user is greeted with a login page. If the user does not have an account, they can sign up for one using their name, email address and password. The email address and password are required for the user’s login. The authorisation and authentication processes are handled by one cloud integrated API: Supabase. User’s login and registration credentials are stored in the authentication section of Supabase. Once the user is logged in, the app edit’s the apps states and save the current user using the Singleton Software Design Pattern. 
## Feature 2: Dog’s Age to Human Years Calculator
Users can calculate a dog’s age in human years based on the dog’s size. The page includes fields for inputting the dog’s age (float) and the dog’s size (small, medium, large or giant) to calculate the respective age in human years and the human age category (baby, toddler, child, teenager, young adult, adult, middle age or senior adult). The output’s colour is displayed using a convertor based on the years and category (going from green-young to red-old). Formulae for calculating the age differ based on the dog’s size.
## Databases for Dogs, Walks and Users
Users, users’ dogs and users’ walks are stored in a cloud database using a second API; through Supabase. All CRUD (Create, Read, Update, Delete) operations are implemented for the database tables. The operations are handled by a common service using the Façade Software Design Pattern.
## Dogs Features
## Feature 3: Create dog and add dog to list (Create operation)
Users can create dogs and add these to their list. To add a dog, the user needs to provide the dog’s name, size, colour, breed and age. The dog objects are created using the Factory and the Builder Software Design Patterns.
## Feature 4: Viewing user’s dogs and their information (Read operation)
The users can view the dogs that they own. The dogs’ listing is made in an informative manner, showcasing each dog’s details. The application filters the dogs and only displays the dogs owned by the current user.
## Feature 5: Edit dogs’ details (Update operation)
From the “View Dog” page, the user can select a dog and update its details in the “Edit Dog” page. The dogs’ size, colour, breed and age can be updated. 
## Feature 6: Delete dogs’ from user (Delete operation)
From the “View Dog” page, users can select dogs and delete them from their list. Upon a dog’s deletion, all the walks with the dog will also be deleted.
## Walks Features
## Feature 7: Add walk with dog (Create operation)
From the “View Dog” page, the user can add a walk with the dog. The user needs to provide the walk’s date, time, a description for the walk and the dog’s behaviour rating.
## Feature 8: View user’s walks and their information (Read operation)
The user can view the walks with their dogs and their information in an informative manner. Each walk is displayed with the dog the walk was completed with. The application sorts the walks based on the date and time (from earliest to oldest). The application only shows the walks of the current user. 
## Feature 9: Editing walks’ details (Update operation)
Users can edit selected walks’ details such as their dates, times, description and the dogs’ rating.
## Feature 10: Deleting walks’ from user (Delete operation)
Users can delete selected walks with dogs from the “View Walks” Page.
# UI
The UI of the application is comprehensive, including UI controls such as Scrollable Elements, Frames, Entries, Labels, Buttons, Date Pickers, Time Pickers, Silders and Swipe Elements. The application includes a Tab Bar with 4 pages (Years Calculator, Adding Dogs, Viewing Walks and Viewing Dogs) and a Flyout Bar with the Logout functionality.  UI layouts used include CollectionView, VerticalStackLayout, HorizontalStackLayout, GridLayout and FlexLayouts.
