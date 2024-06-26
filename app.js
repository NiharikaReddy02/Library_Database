const express = require("express");
const mysql = require("mysql");
const app = express();
const studentRoutes = require("./routes/studentRoutes");
const bookRoutes = require("./routes/bookRoutes");
const borrowsRoutes = require("./routes/borrows")

// Middleware
app.set("view engine", "ejs");
app.use(express.urlencoded({ extended: false }));

// Routes
app.get('/', (req, res) => {
    res.render('about', { view: 'about' }); // Passing the view variable here
  });
  
// Assuming you have a route handler for rendering the about page
app.get('/about', (req, res) => {
    res.render('about', { view: 'about' }); // Passing the view variable here
  });
  app.get('/Library', (req, res) => {
    res.render('about', { view: 'about' }); // Passing the view variable here
  });
  
app.use("/students", studentRoutes);
app.use("/books", bookRoutes);
app.use("/borrows",borrowsRoutes)

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
