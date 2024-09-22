package routes

import (
	"github.com/Ming-doan/Fitgoals/app/controllers"
	"github.com/gofiber/fiber/v2"
)

func RegisterRoutes(app *fiber.App) {
	// Define route group
	api := app.Group("/api")

	// User routes
	api.Post("/user", controllers.CreateUser)
	api.Put("/user/:id", controllers.UpdateUserData)
}
