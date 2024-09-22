package configs

import (
	"context"
	"fmt"
	"log"
	"os"

	"cloud.google.com/go/storage"
)

var StorageClientBucket *storage.BucketHandle

func InitializeStorage() {
	ctx := context.Background()
	client, err := FirebaseApp.Storage(ctx)
	if err != nil {
		log.Fatalf("Failed to connect to Firestore: %v", err.Error())
	}

	// Initialize Bucket
	bucket, err := client.Bucket(
		fmt.Sprintf("%s.appspot.com", os.Getenv("FIREBASE_PROJECT_ID")),
	)
	if err != nil {
		log.Fatalf("Failed to connect to Firestore: %v", err.Error())
	}

	StorageClientBucket = bucket
}
