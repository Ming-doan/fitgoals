package models

type FitnessTodo struct {
	Id          string `json:"id" firestore:"id"`
	Name        string `json:"name" firestore:"name"`
	Description string `json:"description" firestore:"description"`
	IsCompleted bool   `json:"isCompleted" firestore:"isCompleted"`
	Calories    int    `json:"calories" firestore:"calories"`
	ItemId      string `json:"itemId" firestore:"itemId"`
}

type NutritionTodo struct {
	Id          string `json:"id" firestore:"id"`
	Name        string `json:"name" firestore:"name"`
	Description string `json:"description" firestore:"description"`
	IsCompleted bool   `json:"isCompleted" firestore:"isCompleted"`
	Calories    int    `json:"calories" firestore:"calories"`
	ItemId      string `json:"itemId" firestore:"itemId"`
}

type SupplementTodo struct {
	Id          string `json:"id" firestore:"id"`
	Name        string `json:"name" firestore:"name"`
	Description string `json:"description" firestore:"description"`
	IsCompleted bool   `json:"isCompleted" firestore:"isCompleted"`
	ItemId      string `json:"itemId" firestore:"itemId"`
}
