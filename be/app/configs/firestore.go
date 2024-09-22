package configs

import (
	"context"
	"log"

	"cloud.google.com/go/firestore"
)

var FirestoreClient *firestore.Client

func InitializeFirestore() {
	ctx := context.Background()
	client, err := FirebaseApp.Firestore(ctx)
	if err != nil {
		log.Fatalf("Failed to connect to Firestore: %v", err.Error())
	}

	FirestoreClient = client
}
