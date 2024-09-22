package configs

import (
	"context"
	"log"
	"os"

	firebase "firebase.google.com/go"
	"google.golang.org/api/option"
)

var FirebaseApp *firebase.App

func InitializeFirebaseApp() {
	ctx := context.Background()
	// Config for Google Cloud Deployment
	conf := &firebase.Config{ProjectID: os.Getenv("FIREBASE_PROJECT_ID")}
	// Check if development or production
	var sa option.ClientOption
	if os.Getenv("DEVELOPMENT_STATUS") == "development" {
		sa = option.WithCredentialsFile("./fitgoalsCredentials.json")
	} else {
		// In production, the service account is provided by the environment of Google Cloud
		sa = nil
	}

	// Initialize App
	app, err := firebase.NewApp(ctx, conf, sa)
	if err != nil {
		log.Fatalf("Failed to connect to Firestore: %v", err.Error())
	}

	FirebaseApp = app
}
