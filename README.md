# Unit Converter Web App

## Overview

The **Unit Converter Web App** is a web-based application that allows users to convert various units such as temperature, length, weight, and more. The app is built using Java, Servlets, JSP, and MySQL, following the MVC architecture. It provides a clean, user-friendly interface for seamless conversions, ensuring a great user experience.

This project is part of the **Unit Converter** challenge provided by [roadmap.sh](https://roadmap.sh/projects/unit-converter).

## Features

- **Unit Conversion**: Convert units for temperature, length, weight, and other types.
- **Responsive Interface**: The web app provides a clean and intuitive UI.
- **Backend**: Built with Java Servlets and JSP for dynamic content handling.
- **Database Integration**: MySQL database used for storing conversion rates (optional for more advanced implementations).
- **MVC Architecture**: The app follows the Model-View-Controller architecture for modularity and maintainability.

## Project Structure

```
UnitConverter/
├── src/
│   └── main/
│       └── webapp/
│           ├── WEB-INF/
│           │   ├── lib/
│           │   ├── classes/
│           │   └── web.xml (not required if using annotations)
│           ├── index.jsp
│           ├── convert.jsp
│           ├── error.jsp
│           └── css/
│               └── styles.css
└── README.md
```

## Technologies Used

- **Java**: The core programming language for backend logic.
- **Servlets & JSP**: Used to handle HTTP requests and generate dynamic content.
- **MySQL**: Used for storing conversion rates and other data (optional).
- **HTML/CSS**: For frontend design and layout.
- **Maven**: For dependency management (optional).
- **MVC Architecture**: The design pattern followed for structuring the application.

## Setup Instructions

### Prerequisites

1. Java 8 or higher.
2. Apache Tomcat or any servlet container for running the application.
3. MySQL Database (optional for more advanced features).
4. Maven (optional for dependency management).

### Steps to Run the Application

1. Clone the repository:
   ```
   git clone https://github.com/lakshay1341/Unit-Converter-Web-App.git
   ```

2. Open the project in your favorite IDE (Eclipse, IntelliJ, etc.).

3. Deploy the app on your servlet container (e.g., Apache Tomcat).

4. Access the app via `http://localhost:8080/UnitConverter/`.

## Roadmap

This project follows the development roadmap outlined by [roadmap.sh](https://roadmap.sh/projects/unit-converter).

### Future Improvements

- **Add More Units**: Support for additional units (e.g., currency, energy, time).
- **User Authentication**: Allow users to sign up, log in, and save their preferences.
- **Conversion Rate API**: Integrate an external API to get live conversion rates (for temperature, currency, etc.).
- **Unit Conversion History**: Store and display a history of previous conversions.

For more details, check out the roadmap for the Unit Converter challenge at [roadmap.sh](https://roadmap.sh/projects/unit-converter).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
