package services

import (
	"context"

	configs "github.com/Ming-doan/Fitgoals/app/configs"
	"github.com/google/generative-ai-go/genai"
)

func SendMessage() {
	ctx := context.Background()
	configs.LLM.GenerateContent(ctx, genai.Text("Hello, world!"))
}
