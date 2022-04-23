// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//login.WebCaptchaView

package login
{
    import flash.display.Sprite;
    import com.sulake.habbo.communication.login._SafeStr_34;
    import flash.media.StageWebView;
    import com.sulake.habbo.communication.login._SafeStr_32;
    import flash.geom.Rectangle;
    import flash.events.Event;
    import flash.events.LocationChangeEvent;

    public class WebCaptchaView extends Sprite implements _SafeStr_34 
    {

        private static const CAPTCHA_ENDPOINT:String = "/api/public/captcha";
        private static const TOKEN_KEY:String = "token=";

        private static var _SafeStr_9236:StageWebView;

        private var _SafeStr_4360:_SafeStr_32;

        public function WebCaptchaView(_arg_1:_SafeStr_32)
        {
            _SafeStr_4360 = _arg_1;
            addEventListener("addedToStage", onAddedToStage);
        }

        private static function resolveToken(_arg_1:String):String
        {
            var _local_2:int = ((_arg_1 != null) ? _arg_1.indexOf("token=") : -1);
            if (_local_2 < 0)
            {
                return (null);
            };
            return (_arg_1.substr((_local_2 + "token=".length)));
        }


        private function onAddedToStage(_arg_1:Event):void
        {
            var _local_2:String = (_SafeStr_4360.getProperty("web.api") + "/api/public/captcha");
            _SafeStr_14.log(("[WebCaptchaView] Initialize url: " + _local_2));
            this.width = stage.stageWidth;
            this.height = stage.stageHeight;
            if (_SafeStr_9236 == null)
            {
                _SafeStr_9236 = new StageWebView(true);
                _SafeStr_9236.stage = this.stage;
                _SafeStr_9236.viewPort = new Rectangle(0, 100, stage.width, (stage.height - 100));
                _SafeStr_9236.loadURL(_local_2);
                _SafeStr_9236.addEventListener("locationChange", onLocationChange);
            };
        }

        public function dispose():void
        {
            _SafeStr_4360 = null;
            if (_SafeStr_9236)
            {
                _SafeStr_9236.removeEventListener("locationChange", onLocationChange);
                _SafeStr_9236.dispose();
            };
        }

        private function onLocationChange(_arg_1:LocationChangeEvent):void
        {
            var _local_2:String = resolveToken(_arg_1.location);
            if (_local_2 != null)
            {
                _SafeStr_4360.handleCaptchaResult(_local_2);
            };
        }


    }
}//package login

// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_32 = "_-vo" (String#10425, DoABC#3)
// _SafeStr_34 = "_-41Q" (String#6823, DoABC#3)
// _SafeStr_4360 = "_-58" (String#6905, DoABC#3)
// _SafeStr_9236 = "_-5j" (String#6926, DoABC#3)


