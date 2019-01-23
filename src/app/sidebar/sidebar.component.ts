import { Component, OnInit } from '@angular/core';
import { Globals } from '.././globals';
declare var $, PerfectScrollbar: any;

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {

  constructor(private globals: Globals) { }

  ngOnInit() {
	  $('body').tooltip({
        selector: '[data-toggle="tooltip"], [title]:not([data-toggle="popover"])',
        trigger: 'hover',
        container: 'body'
    }).on('click mousedown mouseup', '[data-toggle="tooltip"], [title]:not([data-toggle="popover"])', function () {
        $('[data-toggle="tooltip"], [title]:not([data-toggle="popover"])').tooltip('destroy');
    });	 
    setTimeout(function () {
      $('.left_menu_toggle').click(function () {
        $('.left_menu_toggle i').toggleClass("fa-indent");
        $('.sidebar_wrap').toggleClass("small_menu");
        $('.menu_right').toggleClass("active_right");
        $('footer').toggleClass("footer_sidebaractive");
      });
      //alert($(window).width());
      if ($(window).width() <= 834) {
        $('.left_menu_toggle i').addClass("fa-indent");
        $('.sidebar_wrap').addClass("small_menu");
        $('.menu_right').addClass("active_right");
        $('footer').addClass("footer_sidebaractive");
      }
      new PerfectScrollbar('.sidebar_wrap');
    }, 100);
  }
  closecollapse() {
    $(".dropdown_menu").addClass("collapsed");
    $(".dropdown_menu").attr("aria-expanded", "false");
    $(".collapse").removeClass("in");
  }

  checkcollapse(data,i){ 
    var check = $("#test_"+data).hasClass("collapsed");
    
    $(".dropdown_menu").addClass("collapsed");
    $(".dropdown_menu").attr("aria-expanded","false");
    $(".collapse").removeClass("in");
    if(check){ 
      $("#test_"+data).addClass("collapsed");
      $("#test_"+data).attr("aria-expanded","false");
      $("#collapseExample"+i).removeClass("in");
    } else {
      $("#test_"+data).removeClass("collapsed");
      $("#test_"+data).attr("aria-expanded","true");
      $("#collapseExample"+i).addClass("in");
    }
  }

}
