#include <stdio.h>

typedef struct {
    int company_id;
    char company_name[10];
} Company;

typedef struct {
    int person_age;
    char person_name[10];
    long person_id;
    Company *person_company;
} Person;

void foo(Person *person1, Person *person2) {
    printf("enter foo\n");
    if(person1->person_age > person2->person_age) {
        person1->person_age += 5;
    } else {
        person2->person_age += 5;
    }
    printf("exit foo\n");
}