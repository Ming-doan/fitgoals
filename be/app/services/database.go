package services

import (
	"context"

	"cloud.google.com/go/firestore"
	"github.com/Ming-doan/Fitgoals/app/utils"
)

type CollectionRef = firestore.CollectionRef

func CreateData[T any](collection *CollectionRef, data *T) error {
	ctx := context.Background()
	docRef := collection.NewDoc()
	// Set data
	_, err := docRef.Set(ctx, data)
	if err != nil {
		return err
	}
	// Set ID for data
	if idField, ok := any(data).(interface{ SetID(string) }); ok {
		idField.SetID(docRef.ID)
	}
	return nil
}

func ReadData[T any](collection *CollectionRef, docId string, data *T) error {
	ctx := context.Background()
	doc, err := collection.Doc(docId).Get(ctx)
	if err != nil {
		return err
	}
	// Parse data
	if err := doc.DataTo(data); err != nil {
		return err
	}
	// Set ID for data
	if idField, ok := any(data).(interface{ SetID(string) }); ok {
		idField.SetID(docId)
	}
	return nil
}

func UpdateData[T any](collection *CollectionRef, docId string, data *T) error {
	ctx := context.Background()
	docRef := collection.Doc(docId)
	// Parse struct to map
	mapData, err := utils.StructToMap(data)
	if err != nil {
		return err
	}
	// Update document
	_, err = docRef.Set(ctx, mapData, firestore.MergeAll)
	if err != nil {
		return err
	}
	// Set ID for data
	if idField, ok := any(data).(interface{ SetID(string) }); ok {
		idField.SetID(docId)
	}
	return nil
}

func DeleteData(collection *CollectionRef, docId string) error {
	ctx := context.Background()
	docRef := collection.Doc(docId)
	_, err := docRef.Delete(ctx)
	return err
}
