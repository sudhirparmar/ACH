import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { HttpModule } from '@angular/http';
import { AppRoutingModule } from './app-routing.module';
import { FormsModule } from '@angular/forms';
import { Globals } from './globals';
import { HttpClientModule } from '@angular/common/http';



import { AppComponent } from './app.component';
import { AchComponent } from './ach/ach.component';
import { AchService} from './services/ach.service';


import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { AchlistComponent } from './achlist/achlist.component';


@NgModule({
  declarations: [
    AppComponent,
    AchComponent,
    HeaderComponent,
   FooterComponent,
   AchlistComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    AppRoutingModule,
    HttpClientModule,
    RouterModule.forRoot([
        { path: 'achform', component: AchComponent},
        { path: 'achlist', component: AchlistComponent},
        
     ])
  ],
  providers: [Globals,AchService],
  bootstrap: [AppComponent]
})
export class AppModule { }
