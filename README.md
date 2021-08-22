# Contoso Coffee Shop Case

This is my solution to a Case Study in the AZ-104 course. Below is a visual representation of the solution. In the Templates folder you can find a Bicep template to deploy the resources, with some guidance to deploy it.

## User accounts

Contoso Coffee required 3 Administrators, Bob, Dave and Mark. Based on the Case description i granted them the access they needed. The diagram below shows the roles and scope i assigned to the users.

![User Diagram](./Diagrams/Useraccounts.jpg)

## Website hosting

Contoso Coffee wants to host a globally accessible website. They want their users to be able to access a local server. Therefore i deployed two websites, one in East US for the US users and one in UK South for their UK users. To route the users to their local server i placed a Traffic Manager in front of the websites utulizing the Performance routing method.

![Website Diagram](./Diagrams/Websites.jpg)

## Contoso Coffee data storage

Contoso coffee is planning to store a large amount of image information that will be shared with staff members and clients. These images will be scans of 35 and 120 film for hipster photography that will be displayed around the coffee shop. The storage solution should minimise costs by automatically archiving data onto slower storage when required. A SAS key solution should be created for a future image gallery solution to display images on a TV in the Coffee Shop running a small Raspberry Pi solution locally hosting a web page to display the images. Bonus points for creating an image display web app.

![Storage Diagram](./Diagrams/Storage.jpg)