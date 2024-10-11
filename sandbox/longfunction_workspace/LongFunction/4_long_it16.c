#include <stdio.h>
#include <stdlib.h>

typedef struct person{
    char *name;
    int age;
    long id;
} person_t;

typedef struct company{
    person_t *employees[100];
    char *company_name;
    long id;
    int employee_count;
} company_t;

int main() {
    company_t company;
    int i;
    for (int i = 0; i < 16; i++){
        company.employees[i] = malloc(sizeof(person_t));
    }
    company.id = 10001;
    company.company_name = "My Company";
    company.employee_count = 16;

    company.employees[0]->name = "Cold";
    company.employees[0]->age = 23;
    company.employees[0]->id = 1;

    company.employees[1]->name = "Warm";
    company.employees[1]->age = 25;
    company.employees[1]->id = 2;

    company.employees[2]->name = "Hot";
    company.employees[2]->age = 27;
    company.employees[2]->id = 3;

    company.employees[3]->name = "Cool";
    company.employees[3]->age = 29;
    company.employees[3]->id = 4;

    company.employees[4]->name = "Black";
    company.employees[4]->age = 12;
    company.employees[4]->id = 5;

    company.employees[5]->name = "White";
    company.employees[5]->age = 15;
    company.employees[5]->id = 6;

    company.employees[6]->name = "Red";
    company.employees[6]->age = 17;
    company.employees[6]->id = 7;

    company.employees[7]->name = "Blue";
    company.employees[7]->age = 19;
    company.employees[7]->id = 8;

    company.employees[8]->name = "Green";
    company.employees[8]->age = 21;
    company.employees[8]->id = 9;

    company.employees[9]->name = "Yellow";
    company.employees[9]->age = 23;
    company.employees[9]->id = 10;

    company.employees[10]->name = "Purple";
    company.employees[10]->age = 25;
    company.employees[10]->id = 11;

    company.employees[11]->name = "Orange";
    company.employees[11]->age = 27;
    company.employees[11]->id = 12;

    company.employees[12]->name = "Brown";
    company.employees[12]->age = 29;
    company.employees[12]->id = 13;

    company.employees[13]->name = "Pink";
    company.employees[13]->age = 31;
    company.employees[13]->id = 14;

    company.employees[14]->name = "Grey";
    company.employees[14]->age = 33;
    company.employees[14]->id = 15;

    company.employees[15]->name = "Violet";
    company.employees[15]->age = 35;
    company.employees[15]->id = 16;



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