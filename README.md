# Test exercsise for clearscore


This example uses the CocoaPod Alamofire just because it simplifies http requests and more cleanly encapsulates them into closures than when working with the native iOS session and task classes.

I approached this in 4 stages, the first stage was to make a unit test and an API call to just test that some data was being retrieved within some time limit - I put 5 seconds which is way longer than it should take.

Next once I had an idea of the data returned I created a model to populate just the values needed to display the credit score and the max credit score ignoring other data returned by the call.

After this I create a credit score view which allowed me to set the max score and score inside of the storyboard using IBDesignable so that I could interactively set the values and ensure the view responded correctly as can be seen below.

![Alt text](/Screenshots/CreditScoreView.png?raw=true "Credit Score View using IBDesignable in Storyboard")

Finally I tied in the call to the API into the main view controller and updated the credit score view accordingly.

#Notes:

I decided to draw the arc, but didn't use gradients or special shading, just an orange colour.

The text inside the view was placed manually by trial and error inside the view's draw method rather than using labels and constraints etc. This way it is a single view making use of core graphics for the rendering of both the text and the circle and arc.  This seemed a bit cleaner but might respond oddly as the view is scaled, for example the text might overflow due to font size etc, but it was aligned reletive to the center so it should scale up ok if not down.

I used horizontal and vertical center constraints as well as aspect radio constraints and left/right edge constraints to place the view.

I realise that many people are working declaritatively and avoiding storyboards especially with SwiftUI.  However I've not used SwiftUI, only watched a few video's on it, so I thought I'd stick to the old way of doing things.

I am aware that storyboards can be troublesome when many developers are working on the same project as they can easily get corrupted.





