import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';

const URI_API = environment.URI_API;

@Injectable({
  providedIn: 'root'
})
export class PersonService {

  constructor( private http: HttpClient ) { }

  onGetList() {
    return this.http.get( URI_API + '/getPerson' );
  }


}
