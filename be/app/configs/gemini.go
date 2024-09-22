package configs

import (
	"context"
	"log"
	"os"

	"github.com/google/generative-ai-go/genai"
	"google.golang.org/api/option"
)

var LLM *genai.GenerativeModel

func InitializeLLM() {
	// API Key
	apiKey := os.Getenv("GEMINI_API_KEY")

	// Initialize GenAI client
	ctx := context.Background()
	client, err := genai.NewClient(ctx, option.WithAPIKey(apiKey))
	if err != nil {
		log.Fatalf("Failed to initialize GenAI client: %v", err.Error())
	}

	// Define model
	model := client.GenerativeModel("gemini-1.5-pro-latest")

	// Set model
	LLM = model
}
