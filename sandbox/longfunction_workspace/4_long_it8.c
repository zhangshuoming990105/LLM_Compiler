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
    person_t *person3 = malloc(sizeof(person_t));
    person_t *person4 = malloc(sizeof(person_t));
    person_t *person5 = malloc(sizeof(person_t));
    person_t *person6 = malloc(sizeof(person_t));
    person_t *person7 = malloc(sizeof(person_t));
    person_t *person8 = malloc(sizeof(person_t));
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

    // employee 2
    person3->name = "Hot";
    person3->age = 27;
    person3->id = 199707092235;
    company.employees[2] = person3;
    company.employee_count += 1;

    // employee 3
    person4->name = "Cool";
    person4->age = 29;
    person4->id = 199502022223;
    company.employees[3] = person4;
    company.employee_count += 1;

    // employee 4
    person5->name = "Freeze";
    person5->age = 31;
    person5->id = 199301012222;
    company.employees[4] = person5;
    company.employee_count += 1;

    // employee 5
    person6->name = "Burn";
    person6->age = 33;
    person6->id = 199101012222;
    company.employees[5] = person6;
    company.employee_count += 1;

    // employee 6
    person7->name = "Melt";
    person7->age = 35;
    person7->id = 198901012222;
    company.employees[6] = person7;
    company.employee_count += 1;

    // employee 7
    person8->name = "Boil";
    person8->age = 37;
    person8->id = 198701012222;
    company.employees[7] = person8;
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