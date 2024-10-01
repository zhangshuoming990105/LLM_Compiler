#include <stdio.h>

int Fare_d(int km)
{
 int fare;
 int c_km;

 if (km <= 30) {
  return 130;
 }
 if (km <= 60) {
  return 150;
 }
 if (km <= 100) {
  return 160;
 }
 if (3000 < km) {
  ;
  return -1;
 } else if (1000 < km) {
  c_km = (km - 1) / 200 * 200 + 100;
 } else if (500 < km) {
  c_km = (km - 1) / 100 * 100 + 50;
 } else if (100 < km) {
  c_km = (km - 1) / 50 * 50 + 30;
 } else {
  ;
 }
 fare = 1325 * c_km;

 if (c_km <= 1000) {

  fare = (fare + 9999) / 10000 * 10;
 } else {
  fare = (fare + 50000) / 100000 * 100;
 }
 return (fare + ((fare * 1000 * 5 / 100000) + 5) / 10 * 10);
}