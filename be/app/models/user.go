package models

type UserStatus struct {
	Age          int      `json:"age" firestore:"age"`
	Height       float32  `json:"height" firestore:"height"`
	Weight       float32  `json:"weight" firestore:"weight"`
	TargetWeight float32  `json:"targetWeight" firestore:"targetWeight"`
	Diseases     []string `json:"diseases" firestore:"diseases"`
}

type User struct {
	Id                 string           `json:"id" firestore:"id"`
	Status             UserStatus       `json:"status" firestore:"status"`
	FitnessTodoList    []FitnessTodo    `json:"fitnessTodoList" firestore:"fitnessTodoList"`
	NutritionTodoList  []NutritionTodo  `json:"nutritionTodoList" firestore:"nutritionTodoList"`
	SupplementTodoList []SupplementTodo `json:"supplementTodoList" firestore:"supplementTodoList"`
}

// Implement SetID method
func (u *User) SetID(id string) {
	u.Id = id
}
