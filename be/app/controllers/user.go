package controllers

import (
	"log"

	database "github.com/Ming-doan/Fitgoals/app/configs"
	models "github.com/Ming-doan/Fitgoals/app/models"
	"github.com/Ming-doan/Fitgoals/app/services"
	"github.com/Ming-doan/Fitgoals/app/utils"
	"github.com/gofiber/fiber/v2"
)

func CreateUser(c *fiber.Ctx) error {
	// Get body from request
	var user models.User
	if err := c.BodyParser(&user); err != nil {
		return c.Status(400).JSON(err.Error())
	}

	// Define collection
	collection := database.FirestoreClient.Collection("Users")

	// Create user
	err := services.CreateData(collection, &user)
	if err != nil {
		log.Fatalf("Fail to create user: %v", err.Error())
	}

	// Update user data based on provided status
	var fitnessTodo []models.FitnessTodo
	var nutritionTodo []models.NutritionTodo
	var supplementTodo []models.SupplementTodo
	if user.Status.Weight > user.Status.TargetWeight {
		fitnessTodo, nutritionTodo, supplementTodo = utils.MockLoseWeightTodo()
	} else {
		fitnessTodo, nutritionTodo, supplementTodo = utils.MockGainWeightTodo()
	}
	user.FitnessTodoList = fitnessTodo
	user.NutritionTodoList = nutritionTodo
	user.SupplementTodoList = supplementTodo
	err = services.UpdateData(collection, user.Id, &user)
	if err != nil {
		log.Fatalf("Fail to update user: %v", err.Error())
	}

	return c.Status(200).JSON(fiber.Map{
		"message": "Created user",
		"data":    user,
	})
}

func UpdateUserData(c *fiber.Ctx) error {
	userId := c.Params("id")
	var user models.User

	// Define collection
	collection := database.FirestoreClient.Collection("Users")

	// Get user by user id
	err := services.ReadData(collection, userId, &user)
	if err != nil {
		log.Fatalf("Fail to read user: %v", err.Error())
	}

	return c.Status(200).JSON(fiber.Map{
		"message": "Updated user",
		"data":    "",
	})
}
