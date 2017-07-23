<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <div class="col-sm-4" id="hot-deal">
    	<div class="panel-heading">Best Item</div>
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" style="width:100%; height:100% ;">
      <div class="item active" >
        <a href="./pairing/pairingView.pairing?num=${pairing[0].num}"><img src="./upload/${files[0]}" alt="${pairing[0].title}" style="width:100%; height: 250px; " ></a>
        <div class="carousel-caption">
          
        </div>      
      </div>
      <div class="item">
        <img src="./upload/${files[1]}" alt="${pairing[1].title}" style="width:100%; height: 100% ">
        <div class="carousel-caption">
          
        </div>      
      </div>  
      <div class="item">
        <img src="./upload/${files[2]}" alt="${pairing[2].title}" style="width:100%; height: 100%; ">
        <div class="carousel-caption">
          
        </div>      
      </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
    </div>
    