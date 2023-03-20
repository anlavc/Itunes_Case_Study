# Itunes - Ios Mobile Case Study - MVVM

## Requierements:

Your application must contain 2 screen. One of them is search screen and the other one is detail screen. Main goal of the app is searching terms of api, showing them in a list and navigate to detail of item. There are some important points that you should consider them.
* There must be filter button at the top right of the screen and filtering by category should be possible by filtering with the filter button. Example:

 <img width="128" alt="Ekran Resmi 2023-03-20 22 24 20" src="https://user-images.githubusercontent.com/50744756/226444880-9bb5e50a-abb6-428f-ac86-8e4718fd0ae2.png">

* There should be 4 tabs in one tabbar. It contains ‘Movies’, ‘Music’, ‘Apps’, ‘Books’. Don’t forget to check wrapperType filter on the documentation.
* You should get results with pagination with infitine scrolling.
* Results have to be shown in a collection view.
* Each item in results must contain ‘releaseDate’, ‘artworkUrl100’, ‘country, ‘collectionName’. Date should be in readable format.
* If any item is tapped, you should navigate to detail of the item and show some information. User should go back from the detail page.
Additional Info:
* No restrictions about UI design.
* Assume that, after tihs work, another developer will start working.
* It will be helpfull for us if you take notes about your decisions on your work and write a short read me file.


#### GET

```http
  GET https://developer.apple.com/library/archive/documentation/AudioV ideo/Conceptual/iTuneSearchAPI/
```


 * UIKit
 * MVVM architecture
 * Data Binding
 * Singleton Design Pattern
 * URLSession - Generic Api calls - Networking API
 * Codable Protocol with JSONDecoder
 * Downloading Image - Kingfisher Library
 * Image Cache
 * Swift Package Manager - SPM
 * Closure, Completion, Typealias, Enum
 * Detailed use of UIStackView, UITableView, UITableViewCell XIB
 * CollectionView
 * Pagination
 * Search Result and Filter
 * Inheritance - Final Keyword, Init()
 * Memory Management
 * Light and Dark Mode


# Screen Shot
<img src="https://user-images.githubusercontent.com/50744756/226448110-6828c05d-def5-4524-9dd2-f9645ca56867.png" width="350" height="650">  <img src="https://user-images.githubusercontent.com/50744756/226448115-88ad8d85-14ac-4e42-bd6c-ef48c6750327.png" width="350" height="650">  <img src="https://user-images.githubusercontent.com/50744756/226448117-bc540576-7033-4acb-9b00-9c44fc4cec76.png" width="350" height="650">  <img src="https://user-images.githubusercontent.com/50744756/226448119-7420bfe4-fa51-4530-ac18-b100a94c3bb9.png" width="350" height="650">  <img src="https://user-images.githubusercontent.com/50744756/226448120-1616d7e6-879a-4a41-b17f-2449e8defdfc.png" width="350" height="650"> 
 <img src="https://user-images.githubusercontent.com/50744756/226448123-ae7dc46f-98c2-4a72-9fdd-d37e01eb4716.png" width="350" height="650">  



