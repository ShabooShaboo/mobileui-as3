package
{
	import Utils.Utils;
	
	import com.greensock.*;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.filters.*;
	import flash.system.Capabilities;
	
	public class MobileUI extends Sprite
	{
		var util:Utils = new Utils();
		public function MobileUI()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			//get dimentions from stage
			var st:Stage  = stage;
			var SGwidth:Number = st.fullScreenWidth;
			var SGheight:Number = st.fullScreenHeight;
			
			var button:UIButton = new UIButton();
			button.createButton([0xf3f3f3,0xf5f5f5,0xeaeaea],[0x676767,0x666666,0x616161],80,50,500,400,'cog','','left',0x000000,32);
			button.registerListeners();
			
			var checkbox:UICheckbox = new UICheckbox();
			checkbox.createCheckbox(40,40,250,100,null,0x000000,'=');
			checkbox.registerListeners();
			
			var searchInput:UISearchInput = new UISearchInput();
			searchInput.createSearchInput('search',250,40,300,200,'',null,null);
	
			//slider
			var slider:UISlider = new UISlider();
			slider._stage = stage;
			slider.createSlider(20,100,10,200);
			
			var mediaPlayer:UIMediaPlayer = new UIMediaPlayer();
			mediaPlayer.$stage = stage;
			mediaPlayer.initPlayer(500,300,0,SGheight-300,true);
			
			
			button.addEventListener(MouseEvent.CLICK,function(){
				
				TweenLite.to(nav,1,{x:SGwidth*-1,y:0,onComplete:function(){
					
					nav.remove();
				}});
				TweenLite.to(nav1, 1, {x:0, y:0});
			
			});
			
			
			
			
			//Constructor
			var uiConstructor:UIConstructor = new UIConstructor();
			uiConstructor.constructView(0xcccccc,SGwidth,SGheight,[checkbox,button,searchInput,slider,mediaPlayer]);
			
			
			// Navigator
			var nav:UINavigator = new UINavigator();
			nav.createTopBar(SGwidth,80,null,false,false,'Page #1');
			nav.createNavigator(uiConstructor);
			nav.x = 0;
			nav.y = 0;
			
			//////////////
			var searchInput2:UISearchInput = new UISearchInput();
			searchInput2.createSearchInput('password',150,40,300,200,'');
			
			var uiConstructor2:UIConstructor = new UIConstructor();
			uiConstructor2.constructView(0xcccccc,SGwidth,SGheight,[searchInput2]);
			
			var nav1:UINavigator = new UINavigator();
			nav1.createTopBar(SGwidth,80,null,true,false,'Page #2');
			nav1.createNavigator(uiConstructor2);
			nav1.x = SGwidth;
			nav1.y = 0;
			
			addChild(nav);
			addChild(nav1);
			//addChild(checkbox);
			//addChild(button);
			//addChild(searchInput);
		
		}
		
		
		
		private function getBitmapFilter():BitmapFilter {
			var color:Number = 0x000000;
			var alpha:Number = 0.8;
			var blurX:Number = 24;
			var blurY:Number = 24;
			var strength:Number = 2;
			var inner:Boolean = true;
			var knockout:Boolean = false;
			var quality:Number = BitmapFilterQuality.HIGH;
			
			return new GlowFilter(color,
				alpha,
				blurX,
				blurY,
				strength,
				quality,
				inner,
				knockout);
		}
	}
}