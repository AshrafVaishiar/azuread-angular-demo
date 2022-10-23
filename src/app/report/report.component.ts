import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { AzureAdDemoService } from '../azure-ad-demo.service';
import { Course } from '../course.model';

@Component({
  selector: 'app-report',
  templateUrl: './report.component.html',
  styleUrls: ['./report.component.scss']
})
export class ReportComponent implements OnInit {
  pdfUrl?: SafeResourceUrl
  reporstStatus?:string
  courseList!: Course[];
  constructor(private azureAdDemoService: AzureAdDemoService,
    private domSanitizer: DomSanitizer,
    private snackBar:MatSnackBar) { }

  ngOnInit(): void {
   
  }
  
  getAllCourses() {
    this.azureAdDemoService.getAllCourses().subscribe((res) => {
        this.courseList = res;
    }, (error) => {
      if(error.status==401
        ||error.status==403)
        {
          this.snackBar.open('You are unauthorized!')
        }
        console.log("Error while getAllCourses");
    })
}
}
