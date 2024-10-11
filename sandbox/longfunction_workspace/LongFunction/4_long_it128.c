#include <stdio.h>
#include <stdlib.h>

typedef struct person{
    char *name;
    int age;
    long id;
} person_t;

typedef struct company{
    person_t *employees[1000];
    char *company_name;
    long id;
    int employee_count;
} company_t;

int main() {
    company_t company;
    int i;
    for (int i = 0; i < 128; i++){
        company.employees[i] = malloc(sizeof(person_t));
    }
    company.id = 10001;
    company.company_name = "My Company";
    company.employee_count = 0;

    i = 0;
    int id_begin = 1;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;

    company.employees[i]->name = "Cold";
    company.employees[i]->age = 23;
    company.employees[i]->id = id_begin++;
    company.employee_count++;
    i++;




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