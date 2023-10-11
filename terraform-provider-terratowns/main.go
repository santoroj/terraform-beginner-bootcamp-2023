// Package main: declares the package name.
// The package is special in Go, it's where the execution of the program starts.
package main

// imports the fmt package which contains functions for formatted I/O
import (
	"fmt"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)


// Defines the main function, the entry point the of the application
func main(){
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: Provider,
	})

	// Format.Printline
	// Prints to standard output
	fmt.Println("Hello, World!")
}

// In Golang, a titlecase function will get exported
func Provider() *schema.Provider {
	var p *schema.Provider
	p = &schema.Provider{
		ResourcesMap:   map[string]*schema.Resource{

		},
		DataSourcesMap: map[string]*schema.Resource{

		},
		Schema: map[string]*schema.Schema{
			"endpoint": {
				Type: schema.TypeString,
				Required: true,
				Description: "The endpoint for the external service",
			},
			"token": {
				Type: schema.TypeString,
				Required: true,
				Sensitive: true, // Will mark the token as sensitive to it in the logs
				Description: "Bearer token for authorization",
			},
			"user_uuid":{
				Type: schema.TypeString,
				Required: true,
				Description: "UUID for configuration",
				// ValidateFunc: validateUUID,
			},
		},
	}
	// p.ConfigureContextFunc = providerConfigure(p)
	return p
}


// func validateUUID(v, interface{}, k string) (ws []string, errors []error){
// 	log.Print('validateUUID.start')
// 	value := v.(string)
// 	if _,err - uuid.Parse(value); err != nil {
// 		errors = append(errors, fmt.Errorf("Invalid UUID format"))
// 	}
// 	log.Print('validateUUID.end')
// }