package main

import (
	"fmt"
	"net/http"

	"github.com/junzzz/nanika"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, nanika.Version())
}
func main() {
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}
