import { Injectable } from '@angular/core';
import IPerson from '../interfaces/person.interface';

@Injectable({
  providedIn: 'root'
})
export class StorageService {

  public person: IPerson[] = [];

  constructor() { }

  onLoadPerson(): boolean {

    let value = localStorage.getItem('listPerson');
    if (!value) {
      return false;
    }

    let rawJson: any = JSON.parse(value);
    this.person = rawJson;
    return true;

  }

  onSavePerson( value: IPerson[] ) {
    localStorage.setItem('listPerson', JSON.stringify( value ) );
    this.person = value;
  }

  onAddPerson( data: IPerson ) {
    this.person.push( data );
    localStorage.setItem('listPerson', JSON.stringify( this.person ) );

  }

  onUpdatePerson( data: IPerson ) {
    const finded = this.person.findIndex( rec => rec.pkPerson === data.pkPerson );
    if (finded >= 0) {
      // console.log(this.person);
        this.person[ finded ].name = data.name;
        this.person[ finded ].surname = data.surname;
        this.person[ finded ].nameComplete = `${ data.surname }, ${ data.name }`;
        this.person[ finded ].phone = data.phone;
        this.person[ finded ].email = data.email;
        this.person[ finded ].document = data.document;
        localStorage.setItem('listPerson', JSON.stringify( this.person ) );
    }

  }

  onDeletePerson( pk: number ) {
    this.person = this.person.filter( rec => rec.pkPerson != pk );
    localStorage.setItem('listPerson', JSON.stringify( this.person ) );
  }

}
