package main

import (
	"log"
	"os"

	"github.com/gofiber/fiber/v2"
	"github.com/joho/godotenv"

	configs "github.com/Ming-doan/Fitgoals/app/configs"
	routes "github.com/Ming-doan/Fitgoals/app/routes"
)

func main() {
	// Define app
	app := fiber.New()

	// Initialize
	godotenv.Load()
	configs.InitializeFirebaseApp()
	configs.InitializeFirestore()
	configs.InitializeStorage()
	configs.InitializeLLM()

	// Middleware

	// Register routes
	routes.RegisterRoutes(app)

	// Static

	// Handler

	// Listen
	log.Fatal(app.Listen(":" + os.Getenv("PORT")))
}
