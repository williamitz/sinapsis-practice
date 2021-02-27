import { Component, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import IResApi from 'src/app/interfaces/response.interfce';
import { PersonService } from 'src/app/services/person.service';
import { StorageService } from 'src/app/services/storage.service';
import IPerson from '../../interfaces/person.interface';
import * as $ from 'jquery';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-person',
  templateUrl: './person.component.html',
  styleUrls: ['./person.component.css']
})
export class PersonComponent implements OnInit {
  personSbc: Subscription;

  loadData = false;
  titleModal = 'Nuevo';
  txtBtn = 'Guardar';

  pkDel = 0;

  bodyPerson: IPerson = {
    pkPerson: 0,
    name: '',
    surname: '',
    nameComplete: '',
    phone: '',
    email: '',
    document: ''
  };

  constructor( private personSvc: PersonService, public st: StorageService ) { }

  ngOnInit() {

    this.onGetPerson();

  }

  onGetPerson() {
    if (! this.st.onLoadPerson()) {

      this.personSbc = this.personSvc.onGetList().subscribe( (res: IResApi) => {
        if (! res.ok) {
          throw new Error( res.error );
        }

        this.st.onSavePerson( res.data );

      });

    }
  }

  onEdit( pk: number ) {
    const finded = this.st.person.find( rec => rec.pkPerson === pk );
    if (finded) {
      this.loadData = true;
      this.txtBtn = 'Guardar cambios';
      this.bodyPerson.pkPerson = finded.pkPerson;
      this.bodyPerson.name = finded.name;
      this.bodyPerson.surname = finded.surname;
      this.bodyPerson.nameComplete = finded.nameComplete;
      this.bodyPerson.phone = finded.phone;
      this.bodyPerson.email = finded.email;
      this.bodyPerson.document = finded.document;
      $('#btnAddPerson').trigger('click');
    }
  }

  onReset() {
    this.bodyPerson = {
      pkPerson: 0,
      name: '',
      surname: '',
      nameComplete: '',
      phone: '',
      email: '',
      document: ''
    };

    this.loadData = false;

    $('#frmPerson').trigger('reset');
    $('#btnClose').trigger('click');
  }

  onSubmit( frm: NgForm ) {
    if (frm.valid) {

      if (!this.loadData && this.bodyPerson.pkPerson === 0 ) {
        this.bodyPerson.pkPerson = Math.random() * (999999 - 9999) + 9999;
        this.bodyPerson.nameComplete = `${ this.bodyPerson.surname }, ${ this.bodyPerson.name }`;
        this.st.onAddPerson( this.bodyPerson );
        this.onReset();
      } else {
        console.log(this.bodyPerson);
        this.st.onUpdatePerson( this.bodyPerson );
        this.onReset();
      }


    }
  }

  onShowConfirm( pk: number ) {
    this.pkDel = pk;

  }

  onDelete() {
    this.st.onDeletePerson( this.pkDel );
    $('#btnCloseConfirm').trigger('click');
  }

}
