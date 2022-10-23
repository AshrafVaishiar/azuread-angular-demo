import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';
import { Course } from './course.model';
const LMS_API_BASE_URI =
  'https://learningmanagementsystemapi.azurewebsites.net';
@Injectable({
  providedIn: 'root',
})
export class AzureAdDemoService {
  isUserLoggedIn: Subject<boolean> = new Subject<boolean>();
  constructor(private httpClient: HttpClient) {}
  getAllCourses(): Observable<Course[]> {
    return this.httpClient.get<Course[]>(LMS_API_BASE_URI+"/lms/courses/getall");
  }
}
