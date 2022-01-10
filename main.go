package main

import (
	"fmt"
	"net/http"
	"os"
)

func printEnvs(w http.ResponseWriter, req *http.Request) {

	for _, v := range os.Environ() {
		fmt.Fprintf(w, v+"\n")
	}
}

func main() {

	http.HandleFunc("/", printEnvs)

	http.ListenAndServe(":8080", nil)
	fmt.Println("listening")
}
