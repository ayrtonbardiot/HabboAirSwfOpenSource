// by nota

//com.vimeo.api.VimeoPlayer

package com.vimeo.api
{
    import flash.display.Sprite;
    import flash.utils.Timer;
    import flash.system.Security;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import flash.display.Loader;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;
    import flash.geom.Point;

    public class VimeoPlayer extends Sprite 
    {

        private var container:Sprite = new Sprite();
        private var _SafeStr_5755:Object = false;
        private var player_mask:Sprite = new Sprite();
        private var player_width:int = 400;
        private var player_height:int = 300;
        private var api_version:int = 2;
        private var load_timer:Timer = new Timer(200);

        public function VimeoPlayer(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String="10", _arg_6:int=2)
        {
            this.setDimensions(_arg_3, _arg_4);
            Security.allowDomain("vimeo.com");
            Security.allowDomain("api.vimeo.com");
            var _local_10:String = "&js_api=1";
            this.api_version = _arg_6;
            if (_arg_5 != "9")
            {
                switch (_arg_6)
                {
                    case 2:
                        _local_10 = "&api=1";
                    default:
                };
            }
            else
            {
                this.api_version = 1;
            };
            var _local_7:URLRequest = new URLRequest((((((((((((("http://api.vimeo.com/moogaloop_api.swf?oauth_key=" + _arg_1) + "&clip_id=") + _arg_2) + "&width=") + _arg_3) + "&height=") + _arg_4) + "&fullscreen=0&fp_version=") + _arg_5) + _local_10) + "&cache_buster=") + (Math.random() * 1000)));
            var _local_8:LoaderContext = new LoaderContext(true);
            var _local_9:Loader = new Loader();
            _local_9.contentLoaderInfo.addEventListener("complete", onComplete, false, 0, true);
            _local_9.load(_local_7, _local_8);
            this.addEventListener("addedToStage", addedToStageHandler, false, 0, true);
        }

        public function destroy():void
        {
            if (_SafeStr_5755 == null)
            {
                return;
            };
            if (_SafeStr_5755["destroy"] != undefined)
            {
                _SafeStr_5755.destroy();
            };
            if (container.contains(DisplayObject(_SafeStr_5755)))
            {
                container.removeChild(DisplayObject(_SafeStr_5755));
            };
            if (this.contains(player_mask))
            {
                this.removeChild(player_mask);
            };
            if (this.contains(container))
            {
                this.removeChild(container);
            };
            stage.removeEventListener("mouseMove", mouseMove);
        }

        private function setDimensions(_arg_1:int, _arg_2:int):void
        {
            player_width = _arg_1;
            player_height = _arg_2;
        }

        private function onComplete(_arg_1:Event):void
        {
            container.addChild(_arg_1.currentTarget.loader.content);
            _SafeStr_5755 = _arg_1.currentTarget.loader.content;
            this.addChild(player_mask);
            container.mask = player_mask;
            this.addChild(container);
            redrawMask();
            load_timer.addEventListener("timer", playerLoadedCheck);
            load_timer.start();
        }

        private function playerLoadedCheck(_arg_1:TimerEvent):void
        {
            if (_SafeStr_5755.player_loaded)
            {
                load_timer.stop();
                load_timer.removeEventListener("timer", playerLoadedCheck);
                _SafeStr_5755.disableMouseMove();
                if (stage)
                {
                    stage.addEventListener("mouseMove", mouseMove, false, 0, true);
                };
                dispatchEvent(new Event("complete"));
            };
        }

        private function mouseMove(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_3:MouseEvent = (_arg_1 as MouseEvent);
            if (_local_3 == null)
            {
                return;
            };
            if (((_SafeStr_5755) && (_SafeStr_5755.player_loaded)))
            {
                _local_2 = this.parent.localToGlobal(new Point(this.x, this.y));
                if (((((_local_3.stageX >= _local_2.x) && (_local_3.stageX <= (_local_2.x + this.player_width))) && (_local_3.stageY >= _local_2.y)) && (_local_3.stageY <= (_local_2.y + this.player_height))))
                {
                    _SafeStr_5755.mouseMove(_local_3);
                }
                else
                {
                    _SafeStr_5755.mouseOut();
                };
            };
        }

        private function redrawMask():void
        {
            with (player_mask.graphics)
            {
                beginFill(0, 1);
                drawRect(container.x, container.y, player_width, player_height);
                endFill();
            };
        }

        public function play():void
        {
            _SafeStr_5755.play();
        }

        public function pause():void
        {
            _SafeStr_5755.pause();
        }

        public function getDuration():int
        {
            return (_SafeStr_5755.duration);
        }

        public function seekTo(_arg_1:int):void
        {
            _SafeStr_5755.seek(_arg_1);
        }

        public function changeColor(_arg_1:String):void
        {
            _SafeStr_5755.color = ("0x" + _arg_1);
        }

        public function loadVideo(_arg_1:int):void
        {
            _SafeStr_5755.loadVideo(_arg_1);
        }

        public function setSize(_arg_1:int, _arg_2:int):void
        {
            this.setDimensions(_arg_1, _arg_2);
            _SafeStr_5755.setSize(_arg_1, _arg_2);
            this.redrawMask();
        }

        private function addedToStageHandler(_arg_1:Event):void
        {
            stage.addEventListener("mouseMove", mouseMove);
            this.addEventListener("removedFromStage", removedFromStageHandler, false, 0, true);
        }

        private function removedFromStageHandler(_arg_1:Event):void
        {
            stage.removeEventListener("mouseMove", mouseMove);
            this.removeEventListener("removedFromStage", removedFromStageHandler);
        }


    }
}//package com.vimeo.api

// _SafeStr_5755 = "_-Nv" (String#3674, DoABC#4)


