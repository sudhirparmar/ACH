import { Injectable } from '@angular/core';
import { CanActivate,RouterStateSnapshot } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { Router } from '@angular/router';
import { Globals } from '.././globals';
declare var $: any;

@Injectable()
export class AuthGuard implements CanActivate {

  constructor(private authService : AuthService,private router: Router, public globals: Globals) { }
  

  canActivate(route,state:RouterStateSnapshot) {
	debugger 
	this.globals.isLoading = false;	
	$('footer').removeClass('footer_fixed');
	$('.right_content_block').removeClass('performance_block');
	if(state.url=='/login'){					   
		$("body").addClass("height_100");
	} else {
		$("body").removeClass("height_100");
	}
	if(state.url.split('/')[3] != undefined){
		this.globals.currentLink = '/'+state.url.split('/')[1]+'/'+state.url.split('/')[2]+'/'+state.url.split('/')[3];
	} else if(state.url.split('/')[2] != undefined) {
		this.globals.currentLink = '/'+state.url.split('/')[1]+'/'+state.url.split('/')[2];
	} else {
		this.globals.currentLink = '/'+state.url.split('/')[1];
	}
	  if(this.authService.isLoggedIn()==true){	

		if(state.url=='/login' || state.url=='/forgot-password' || state.url.split('/')[1]=='reset-password'){			
			this.globals.IsLoggedIn = true;
			
			this.router.navigate(['/ach-list']);
			return false;
		} else {
			
			this.globals.IsLoggedIn = true;
			return true;		  
		}				  
	  } else {
		if(state.url=='/login' || state.url=='/forgot-password' || state.url.split('/')[1]=='reset-password'){					   
			   this.globals.IsLoggedIn = false;
			   return true;
		   } else {
			   this.globals.IsLoggedIn = false;
			   this.router.navigate(['/login']);
			   //window.location.href = '/login';
			   return false;
		   }		  
	  }
  }
  
}
