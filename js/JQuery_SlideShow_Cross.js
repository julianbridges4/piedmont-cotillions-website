var imagePatharr;
var curIndex = 0;
var pTotalCycles = 20;
var numcycles = 0;
var timer ;
var imageCount = 0 ;
var imgs = [];
var topIndex = 0;
var pFadeOutTime = 2000;
var pFadeInTime = 2000;
var pShowTime = 1500;
var pImageNotReadyDelay = 500;
var pCrossFade = false;
var PrevIndex = 0;
var fOutFN = FadeOut;
var imageLoadComplete = false;
var calledImageLoad = false;
var pdebug = false;
var pClipWidth = 500;
var pClipHeight = 500;

function Init(targetElement,arr,ClipWidth,ClipHeight,FadeInTime,FadeOutTime,ShowTime,CrossFade,TotalCycles,Debug){

	dbout("init started");

	imagePatharr = arr

	if (ClipWidth != undefined) { pClipWidth = ClipWidth };
	if (ClipHeight != undefined) { pClipHeight = ClipHeight};
	if (FadeInTime != undefined){pFadeInTime = FadeInTime};
	if (FadeOutTime != undefined){pFadeOutTime = FadeOutTime};
	if (ShowTime != undefined){pShowTime = ShowTime};
	if (CrossFade != undefined){pCrossFade = CrossFade};
	if (TotalCycles != undefined){pTotalCycles = TotalCycles};
	if (Debug != undefined){pdebug = Debug};
	
	
	if (pdebug){
		$("body").append("<div id='JQDebugOutput'></div>");
	}


	$(targetElement).html("<img id='SlideImage1' >") 
	$("#SlideImage1").hide();
	$("#SlideImage1").css("position", "absolute");
	$("#SlideImage1").css("width", pClipWidth);
	$("#SlideImage1").css("height", pClipHeight);
	$("#SlideImage1").css("overflow", "hidden");

	if (pCrossFade) { $(targetElement).prepend("<img id='SlideImage2' >"); $("#SlideImage2").hide(); $("#SlideImage2").css("position", "absolute"); $("#SlideImage2").css("width", pClipWidth); $("#SlideImage2").css("height", pClipHeight); $("#SlideImage2").css("overflow", "hidden"); }
	topIndex = imagePatharr.length - 1;
	numcycles =  0;
	curIndex = 0;
	fOutFN = FadeOut;
	jQuery.each(imagePatharr, function() {
		imgs[imageCount] = new Image();
		
		imgs[imageCount].loaded = false;
		imgs[imageCount].id = "Image" + imageCount;
		imgs[imageCount].src = this;
		imgs[imageCount].imgIndex = imageCount;

		if (imgs[imageCount].complete){
			
			imgs[imageCount].loaded = true;
			imageLoadComplete = true;
			dbout("Img complete " + ' ' + imgs[imageCount].id + ' ' + imgs[imageCount].loaded);
		}else{
			if (!imageLoadComplete){
			
				$(imgs[imageCount]).load(function(){ImageLoaded(this)});
				calledImageLoad = true;
			}
		}
		
		imageCount += 1;
	})


	if (!calledImageLoad){
	dbout("!calledImageLoad");
	//$("#dboutput").append("!calledImageLoad" + "<BR>");
	//$("#dboutput").append("curIndex" + curIndex + "<BR>");
	//$("#dboutput").append("numcycles" + numcycles + "<BR>");
	
	dbout("curIndex:" + curIndex + " numcycles:" + numcycles);
	dbout("fOutFN:" + fOutFN);	

	jQuery.each(imgs, function(index,value) {
		value.loaded = true;
	})

	
			$("#SlideImage1").attr({src: imgs[curIndex].src});
			curIndex+=1;
			$("#SlideImage1").fadeIn(pFadeInTime,fOutFN);
	}
}
function ImageLoaded(imgsrc){

dbout("ImageLoaded:" + curIndex +  ' ' + imgsrc.imgIndex);	
dbout("imgIndex:" + imgsrc.imgIndex);	
	imgsrc.loaded = true;
	if (imgsrc.imgIndex == 0){
		$("#SlideImage1").attr({src: imgs[curIndex].src});
		curIndex+=1;
		dbout("SS Stared:" + curIndex);	
		dbout("curIndex:" + curIndex + " numcycles:" + numcycles);
		dbout("fOutFN:" + fOutFN);	
		$("#SlideImage1").fadeIn(pFadeInTime,fOutFN);
	}

}


function stop(){}

function FadeOut(){
	if (pCrossFade){
	$("#SlideImage2").attr({src: imgs[PrevIndex].src});	
	$("#SlideImage2").show();
	}
	$("#SlideImage1").delay(pShowTime).fadeOut(pFadeOutTime,FadeIn);
	
}

function FadeIn(){
dbout("FadeIn 1:" + curIndex + ' ' + imgs[curIndex].id + ' ' + imgs[curIndex].loaded);
	if (imgs[curIndex].loaded){
	dbout("FadeIn 2:");
		$("#SlideImage1").attr({src: imgs[curIndex].src});
		$("#SlideImage1").fadeIn(pFadeInTime,fOutFN);
			PrevIndex = curIndex;
				curIndex += 1;
			if (curIndex > topIndex){
				curIndex = 0;
				numcycles += 1
				if (numcycles >= pTotalCycles){
					fOutFN = stop;
				}
			}
	}else{
		$("#SlideImage1").delay(pImageNotReadyDelay).show();
	}
}

function dbout(input){
	if (pdebug) {
		$("#JQDebugOutput").append(input + '<BR>');
	}
}