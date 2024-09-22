package utils

import "github.com/Ming-doan/Fitgoals/app/models"

func MockGainWeightTodo() ([]models.FitnessTodo, []models.NutritionTodo, []models.SupplementTodo) {
	// Fitness Todo
	fitnessTodo := []models.FitnessTodo{
		{
			Name:        "Push-Ups",
			Description: "3 sets, 8-12 reps",
			Calories:    100,
		},
		{
			Name:        "Squats",
			Description: "3 sets, 10-15 reps",
			Calories:    120,
		},
		{
			Name:        "Cardio",
			Description: "20-30 minutes",
			Calories:    150,
		},
	}
	nutritionTodo := []models.NutritionTodo{
		{
			Name:        "Egg",
			Description: "5 pieces",
			Calories:    250,
		},
		{
			Name:        "Rice, Fish",
			Description: "500 gram, 300 gram",
			Calories:    600,
		},
		{
			Name:        "Avocado Smoothie",
			Description: "300 ml",
			Calories:    180,
		},
		{
			Name:        "Chicken",
			Description: "500 gram",
			Calories:    300,
		},
	}
	supplementTodo := []models.SupplementTodo{
		{
			Name:        "Creatine",
			Description: "0.5 spoon",
		},
		{
			Name:        "Whey Protein",
			Description: "1 spoon",
		},
	}

	return fitnessTodo, nutritionTodo, supplementTodo
}

func MockLoseWeightTodo() ([]models.FitnessTodo, []models.NutritionTodo, []models.SupplementTodo) {
	// Fitness Todo
	fitnessTodo := []models.FitnessTodo{
		{
			Name:        "High-Intensity Interval Training (HIIT)",
			Description: "20 minutes",
			Calories:    300,
		},
		{
			Name:        "Yoga",
			Description: "30 minutes",
			Calories:    150,
		},
		{
			Name:        "Walking",
			Description: "45 minutes",
			Calories:    200,
		},
	}

	nutritionTodo := []models.NutritionTodo{
		{
			Name:        "Grilled Chicken Salad",
			Description: "200 grams",
			Calories:    350,
		},
		{
			Name:        "Quinoa and Vegetables",
			Description: "200 grams",
			Calories:    300,
		},
		{
			Name:        "Greek Yogurt with Berries",
			Description: "150 grams Greek yogurt, 100 grams mixed berries",
			Calories:    200,
		},
		{
			Name:        "Vegetable Soup",
			Description: "400 ml, low sodium",
			Calories:    150,
		},
	}

	supplementTodo := []models.SupplementTodo{
		{
			Name:        "Green Tea Extract",
			Description: "1 capsule",
		},
		{
			Name:        "L-Carnitine",
			Description: "1 scoop",
		},
	}

	return fitnessTodo, nutritionTodo, supplementTodo
}
