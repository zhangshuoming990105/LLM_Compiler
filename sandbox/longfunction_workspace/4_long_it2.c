#include <stdio.h>
#include <stdlib.h>

typedef struct person{
    char *name;
    int age;
    long id;
} person_t;

typedef struct company{
    person_t *employees[10];
    char *company_name;
    long id;
    int employee_count;
} company_t;

int main() {
    company_t company;
    person_t *person = malloc(sizeof(person_t));
    person_t *person2 = malloc(sizeof(person_t));
    int i;

    company.id = 10001;
    company.company_name = "My Company";
    company.employee_count = 0;

    // employee 0
    person->name = "Cold";
    person->age = 23;
    person->id = 200012267760;
    company.employees[0] = person;
    company.employee_count += 1;

    // employee 1
    person2->name = "Warm";
    person2->age = 25;
    person2->id = 199901052619;
    company.employees[1] = person2;
    company.employee_count += 1;

    // print company
    printf("Company Name: %s\n", company.company_name);
    printf("Company ID: %ld\n", company.id);
    for(i = 0; i < company.employee_count; i++){
        printf("--------------------\n");
        printf("Employee %d\n", i+1);
        printf("Name: %s\n", company.employees[i]->name);
        printf("Age: %d\n", company.employees[i]->age);
        printf("ID: %ld\n", company.employees[i]->id);
    }
    // free memory
    for(i = 0; i < company.employee_count; i++){
        if (company.employees[i] != NULL)
            free(company.employees[i]);
    }
    return 0;
}