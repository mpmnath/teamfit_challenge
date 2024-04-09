
# Dashboard Delight

## Introduction

Welcome to Dashboard Delight, a project designed for developers to showcase their problem-solving and coding skills in a simulated work environment. This project aims to emulate an hour of work life in our company, focusing not on task completion but on how developers manage their time, approach coding challenges, and devise solutions.

## Project Description

Dashboard Delight is developed to simulate an hour of working live in the company, focusing on the process rather than the outcome. It is an excellent opportunity for developers to demonstrate how they navigate coding tasks, manage their time effectively, and contribute to a project's development within a limited timeframe.

### Core Features

- **Fake Backend Client**: Comes with a predefined method `fetchData` that mimics a backend service by returning a `FakeResponse`. This response includes a body with a result string, a status code (200 indicating success), and an error message for unsuccessful responses.
- **Prepared Assets**: Developers will find the `result.json` in the assets directory to get familiar with the data structure. A `ProductModel` is provided, requiring the addition of a `toMap` method.
- **Included Packages**: The project already includes essential packages such as `bloc`, `get_it`, and `equitable`. Feel free to add more as needed.

## Tasks

Your assignment includes the following tasks:
1. **Branch Creation**: Initiate by creating a branch named after yourself. This branch will hold your contributions.
2. **Architecture Implementation**: Employ the MVVM architecture, enhanced by dependency injection (using `get_it`), to fetch data from the FakeClient.
3. **Module Development**:
   - Develop a module to display items in a GridView.
   - Create a module to showcase items in a Carousel.

Ensure consistency in item heights across modules. The grid view should adjust its cross-axis count based on the device's orientation and type.

**Each item will display the following information**:
- **Image**: Construct URLs using the model `https://product-images.cdn.moebel.de/{partner.id}/{productId}-{imageName}-366x275.{suffix}?quality=85&format=webp`. For images named like `1253.jpg`, the imageName is `1253`. Exclude items without images.
- **Title**
- **Description**: Limited to two lines.
- **Price Module**: Format prices as follows:
  - Prefix with "ab" if `clusterProductsCount` is greater than 1.
  - Format numbers according to the European style (e.g., 1.299,00 €).
  - If `value` and `valueFormer` differ, display `value` in red, `valueFormer` in gray with a smaller font and a strike-through.
- **Available Immediately Tag**: We show this tag in the top left side of tile just if:
  - If `features.deliveryTime` exists and this list contains `sofort-lieferbar`, d
### Additional Instructions

- Use `bloc` for state management to handle loading states and error messaging efficiently.
- Feel free to ask questions, suggest improvements, or incorporate your favorite packages. This project simulates real-life work scenarios, encouraging the use of resources like Copilot, ChatGPT, Google, etc.
- Aim for clean coding practices to ensure your code is readable, maintainable, and efficient.

## Setting Up

1. **Clone the Repository**: Begin by cloning this repository to your local development environment.
2. **Create Your Branch**: Make a new branch with your name where you will push your commits.
3. **Install Dependencies**: Run `flutter pub get` to install the required packages.
4. **Run the Project**: Use `flutter run` to start the project on your device or emulator.

## Contributing

This project is a test of coding skills, time management, and problem-solving abilities. While completing the tasks is important, how you approach the work and the quality of your code are equally valued. Use clean coding standards and work efficiently to demonstrate your capabilities.
