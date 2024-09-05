#include <stdint.h>
#include <stdio.h>
#include <stddef.h>

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

int main() {
    Company company = {10, "Company A"};
    Person person = {20, "Alice", 10086, &company};
    printf("person name: %s\n", person.person_name);
    printf("person age: %d\n", person.person_age);
    printf("person id: %ld\n", person.person_id);
    printf("person company id: %d\n", person.person_company->company_id);
    printf("person company name: %s\n", person.person_company->company_name);
    person.person_age += 5;
    company.company_id -=5;
    printf("person age: %d\n", person.person_age);
    printf("person company id: %d\n", person.person_company->company_id);

    return 0;
}